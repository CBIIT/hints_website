Imports System.Data
Imports System.Data.SqlClient
Imports GenericHelper.GenericHelper
Imports CacheData.CacheData

Partial Class advanced
    Inherits System.Web.UI.Page



    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim objDataAdapter As New SqlDataAdapter("", objConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader
    Dim objDataSet As New System.Data.DataSet
    Dim objDataView As DataView

    Dim WildCardString As String

    Dim SpecialSearch As Boolean


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        WildCardString = ""

        If Not Page.IsPostBack Then
            UC_Results.Visible = False
            SpecialSearch = False

            If Test_RequestVar_IsPopulated(Server.HtmlEncode(Request.QueryString("q"))) Then
                TXT_SearchBox.Text = Server.HtmlEncode(Request("q").ToString())
                TXT_SearchBox.Text = TXT_SearchBox.Text.Replace("&quot;", """")
                SpecialSearch = True
            End If

            'sf means that the advanced search link was clicked
            If Server.HtmlEncode(Request.QueryString("sf")) Is Nothing Then
                PLC_Filter.Visible = False

                bTN_ShowOptions.Visible = True
                BTN_HideOptions.Visible = False
            Else
                PLC_Filter.Visible = True
                bTN_ShowOptions.Visible = False
                BTN_HideOptions.Visible = True
            End If


            objConnect.Open()
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "List_Sections_Without_HINTS"
            objDR = Cmd.ExecuteReader()
            DDL_Section.DataSource = objDR
            DDL_Section.DataBind()
            objDR.Close()
            Cmd.Parameters.Clear()


            Cmd.CommandText = "List_Cycles"
            objDR = Cmd.ExecuteReader()
            CKLIst_Cyle.DataSource = objDR
            CKLIst_Cyle.DataBind()
            objDR.Close()
            Cmd.Parameters.Clear()

            Cmd.CommandText = "List_Criteria"
            objDR = Cmd.ExecuteReader()
            DDL_WhoAsked.DataSource = objDR
            DDL_WhoAsked.DataBind()
            objDR.Close()
            Cmd.Parameters.Clear()

            objConnect.Close()


            DDL_Section.Items.Insert(0, New ListItem("-Select a section-", "-1"))
            DDL_WhoAsked.Items.Insert(0, New ListItem("-Select a term-", "-1"))



            If Test_RequestVar_IsPopulated(Server.HtmlEncode(Request.QueryString("tpc"))) Then
                PreSelectDDL(DDL_Section, Server.HtmlEncode(Request("tpc").ToString()))
                SpecialSearch = True
                PLC_Filter.Visible = True
                bTN_ShowOptions.Visible = False
                BTN_HideOptions.Visible = True
            End If

            If SpecialSearch = True Then
                RunSearch()
            End If
        End If
    End Sub


    Protected Sub BTN_Clear_Click(sender As Object, e As EventArgs) Handles BTN_Clear.Click
        TXT_SearchBox.Text = ""
        DDL_Section.ClearSelection()
        DDL_WhoAsked.ClearSelection()
        CK_ArticleAttached.Checked = False
        CK_BriefsAttached.Checked = False
        Dim anitem As ListItem
        For Each anitem In CKLIst_Cyle.Items
            anitem.Selected = False
        Next
        UC_Results.Visible = False
    End Sub



    Protected Sub BTN_Search_Click(sender As Object, e As EventArgs) Handles BTN_advancedSearch.Click
        RunSearch()

    End Sub

    Sub RunSearch()

        WildCardString = ""

        Dim fullstring As String = TXT_SearchBox.Text
        fullstring = setSearchStringWildCard(TXT_SearchBox.Text)

        Dim BLNFlag As Boolean = True
        Do While BLNFlag = True
            If fullstring.IndexOf("""") < 0 Then
                BLNFlag = False
                Exit Do
            Else
                fullstring = fullstring.Replace("""", "")
            End If
        Loop



        fullstring = setSearchString(fullstring)
        fullstring = fullstring.Replace("""**"" AND ", "")
        fullstring = fullstring.Replace("""**""", "")

        If WildCardString <> "" And fullstring <> "" Then
            fullstring = fullstring & " AND ""*" & WildCardString & "*"""
        ElseIf WildCardString <> "" And fullstring = "" Then
            fullstring = fullstring & """*" & WildCardString & "*"""
        End If
        'Response.Write("<h1>wildcard=" & WildCardString & "</h1>")
        'Response.Write("<h1>fullstring=" & fullstring & "</h1>")
        'Exit Sub


        Dim BLN_First As Boolean = True
        Dim Array_CyclesSelected As New StringBuilder
        Array_CyclesSelected.Append("")
        Dim anitem As ListItem
        For Each anitem In CKLIst_Cyle.Items
            If anitem.Selected Then
                If BLN_First = True Then
                    BLN_First = False
                    Array_CyclesSelected.Append(anitem.Value)
                Else
                    Array_CyclesSelected.Append("," & anitem.Value)
                End If
            End If
        Next

        objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure
        objDataAdapter.SelectCommand.CommandText = "[AdvancedSearch_ListQuestions_Wildcards]"
        'objDataAdapter.SelectCommand.CommandText = "[AdvancedSearch_ListQuestions_Wildcards_DEBUG]"




        If fullstring = "" Then
            objDataAdapter.SelectCommand.Parameters.Add("@SearchTerm", SqlDbType.NVarChar).Value = System.DBNull.Value
        Else
            objDataAdapter.SelectCommand.Parameters.Add("@SearchTerm", SqlDbType.NVarChar).Value = fullstring
        End If
        'Response.Write("<h1>fullstring=" & fullstring & "</h1>")
        'Response.Write("<h1>WildCardString=" & "%" & WildCardString & "%" & "</h1>")
        objDataAdapter.SelectCommand.Parameters.Add("@FK_Section", SqlDbType.Int).Value = DDL_Section.SelectedValue
        objDataAdapter.SelectCommand.Parameters.Add("@WithArticles", SqlDbType.Bit).Value = CK_ArticleAttached.Checked
        objDataAdapter.SelectCommand.Parameters.Add("@WithBriefs", SqlDbType.Bit).Value = CK_BriefsAttached.Checked


        If Array_CyclesSelected.Length = 0 Then
            objDataAdapter.SelectCommand.Parameters.Add("@Cycles", SqlDbType.NVarChar).Value = System.DBNull.Value
        Else
            objDataAdapter.SelectCommand.Parameters.Add("@Cycles", SqlDbType.NVarChar).Value = Array_CyclesSelected.ToString
        End If

        If DDL_WhoAsked.SelectedValue = "-1" Then
            objDataAdapter.SelectCommand.Parameters.Add("@Criteria", SqlDbType.NVarChar).Value = System.DBNull.Value
        Else
            objDataAdapter.SelectCommand.Parameters.Add("@Criteria", SqlDbType.NVarChar).Value = DDL_WhoAsked.SelectedValue
        End If

        objDataAdapter.Fill(objDataSet, "newlisting")
        objConnect.Close()


        UC_Results.BuildResults(objDataSet.Tables("newlisting").DefaultView)
        UC_Results.Visible = True
    End Sub

    Protected Sub bTN_ShowOptions_Click(sender As Object, e As EventArgs) Handles bTN_ShowOptions.Click
        PLC_Filter.Visible = True
        bTN_ShowOptions.Visible = False
        BTN_HideOptions.Visible = True
    End Sub

    Protected Sub BTN_HideOptions_Click(sender As Object, e As EventArgs) Handles BTN_HideOptions.Click
        PLC_Filter.Visible = False
        bTN_ShowOptions.Visible = True
        BTN_HideOptions.Visible = False
    End Sub



    Function setSearchStringWildCard(tmp As String) As String

        If CountCharacter(tmp, """") <> 2 Then
            WildCardString = ""
            Return tmp
        Else
            Dim i As Integer = tmp.IndexOf("""")
            WildCardString = tmp.Substring(i + 1, tmp.IndexOf("""", i + 1) - i - 1)
            tmp = tmp.Replace(WildCardString, "")
            tmp = tmp.Replace(" """, "")
            tmp = tmp.Replace("""", "")
            Return tmp
        End If

    End Function


    Function setSearchString(tmp As String) As String
        tmp = """*" & tmp.Replace(" ", "*""" & " AND " & """*") & "*"""
        Return tmp
    End Function

    Function CountCharacter(ByVal value As String, ByVal ch As Char) As Integer
        Dim cnt As Integer = 0
        For Each c As Char In value
            If c = ch Then cnt += 1
        Next
        Return cnt
    End Function
End Class

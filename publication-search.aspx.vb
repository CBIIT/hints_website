Imports System.Data
Imports System.Data.SqlClient
Imports GenericHelper.GenericHelper

Partial Class publication_search
    Inherits System.Web.UI.Page

    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim objDR As SqlDataReader
    Dim objDataAdapter As New SqlDataAdapter("", objConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDataSet As New System.Data.DataSet
    Dim startDate As Integer
    Dim endDate As Integer

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            UC_Articles.Visible = False

            DDL_month.Items.Insert(0, New ListItem("- Select a month -", "-1"))
            PopulateMonth()
            DDL_year.Items.Insert(0, New ListItem("- Select a year -", "-1"))
            PopulateYear()




            objConnect.Open()
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "List_ArticleTypes"
            objDR = Cmd.ExecuteReader()
            DDL_articletype.DataSource = objDR
            DDL_articletype.DataBind()
            objDR.Close()
            Cmd.Parameters.Clear()
            objConnect.Close()

            DDL_articletype.Items.Insert(0, New ListItem("- Select resource type -", "-1"))



            'Display no options when sf is nothing
            If Server.HtmlEncode(Request.QueryString("sf")) Is Nothing Then
                publications_search_wrapper.Visible = False
                bTN_ShowOptions.Visible = True
                BTN_HideOptions.Visible = False
            Else
                publications_search_wrapper.Visible = True
                bTN_ShowOptions.Visible = False
                BTN_HideOptions.Visible = True
            End If


            If Test_RequestVar_IsPopulated(Server.HtmlEncode(Request.QueryString("q"))) = True Then
                TXT_SearchTerm.Text = Server.HtmlEncode(Request.QueryString("q"))
                bTN_ShowOptions.Visible = True
                BTN_HideOptions.Visible = False
                RunSearch()
            End If

        End If
    End Sub

    Protected Sub BTN_Search_Click(sender As Object, e As EventArgs) Handles BTN_Search.Click
        RunSearch()
    End Sub

    Protected Sub BTN_Clear_Click(sender As Object, e As EventArgs) Handles BTN_Clear.Click
        TXT_SearchTerm.Text = ""
        DDL_articletype.ClearSelection()
        DDL_month.ClearSelection()
        DDL_year.ClearSelection()
        LIT_ResType.Text = Nothing
        UC_Articles.Visible = False

    End Sub

    Sub RunSearch()
        objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure
        objDataAdapter.SelectCommand.CommandText = "List_PublicationsSearch"

        If TXT_SearchTerm.Text = "" Then
            objDataAdapter.SelectCommand.Parameters.Add("@SearchTerm", SqlDbType.NVarChar).Value = System.DBNull.Value
        Else
            objDataAdapter.SelectCommand.Parameters.Add("@SearchTerm", SqlDbType.NVarChar).Value = TXT_SearchTerm.Text
        End If

        If DDL_articletype.SelectedValue = "-1" Then
            objDataAdapter.SelectCommand.Parameters.Add("@FK_ArticleType", SqlDbType.Int).Value = System.DBNull.Value
        Else
            objDataAdapter.SelectCommand.Parameters.Add("@FK_ArticleType", SqlDbType.Int).Value = DDL_articletype.SelectedValue
        End If

        If DDL_month.SelectedValue = "-1" Then
            objDataAdapter.SelectCommand.Parameters.Add("@FK_Month", SqlDbType.NVarChar).Value = System.DBNull.Value
        Else
            objDataAdapter.SelectCommand.Parameters.Add("@FK_Month", SqlDbType.NVarChar).Value = DDL_month.SelectedValue
        End If

        If DDL_year.SelectedValue = "-1" Then
            objDataAdapter.SelectCommand.Parameters.Add("@PubYear", SqlDbType.Int).Value = System.DBNull.Value
        Else
            objDataAdapter.SelectCommand.Parameters.Add("@PubYear", SqlDbType.Int).Value = DDL_year.SelectedValue
        End If

        objDataAdapter.Fill(objDataSet, "Publication Results")

        If DDL_articletype.SelectedValue = "-1" Then
            LIT_ResType.Text = "Publications and Briefs:"
        Else
            LIT_ResType.Text = DDL_articletype.SelectedItem.ToString & " :"
        End If

   
        objConnect.Close()
        objDataAdapter.SelectCommand.Parameters.Clear()

        UC_Articles.BuildResults(objDataSet.Tables("Publication Results").DefaultView)
        UC_Articles.Visible = True

    End Sub

    Private Sub PopulateMonth()
        Dim time As DateTime = New DateTime(2000, 12, 12)
        Dim i As Integer
        For i = 1 To 12
            DDL_month.Items.Insert(i, New ListItem(time.AddMonths(i).ToString("MMMM"), i))
        Next
    End Sub

    Private Sub PopulateYear()
        startDate = 2004
        endDate = DateTime.Now.Year
        While startDate <= endDate
            DDL_year.Items.Add(startDate.ToString)
            startDate += 1
        End While
    End Sub

    Protected Function CheckifURLAvailable(ByVal dtmtitle As Object, ByVal dtmurl As Object) As String
        Dim strtitle As String = ""

        If dtmurl Is DBNull.Value Then
            strtitle = dtmtitle.ToString
        Else
            strtitle = "<a href='" + dtmurl.ToString + "' target='_balnk'>" + dtmtitle.ToString + "</a>"
        End If

        Return strtitle
    End Function

    Protected Sub bTN_ShowOptions_Click(sender As Object, e As EventArgs) Handles bTN_ShowOptions.Click
        publications_search_wrapper.Visible = True
        bTN_ShowOptions.Visible = False
        BTN_HideOptions.Visible = True
    End Sub

    Protected Sub BTN_HideOptions_Click(sender As Object, e As EventArgs) Handles BTN_HideOptions.Click
        publications_search_wrapper.Visible = False
        bTN_ShowOptions.Visible = True
        BTN_HideOptions.Visible = False
    End Sub

End Class
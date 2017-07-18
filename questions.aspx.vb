Imports System.Data
Imports System.Data.SqlClient

Partial Class questions
    Inherits System.Web.UI.Page


    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader
    Dim objDataAdapter As New SqlDataAdapter("", objConnect)
    Dim objDataSet As New System.Data.DataSet
    Dim objDataView As DataView


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            UC_Results.Visible = False
            objConnect.Open()
            Cmd.CommandText = "List_Cycles"
            objDR = Cmd.ExecuteReader()
            CKLIst_Cyle.DataSource = objDR
            CKLIst_Cyle.DataBind()
            objDR.Close()
            Cmd.Parameters.Clear()

            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "List_Sections_Without_HINTS"
            objDR = Cmd.ExecuteReader()
            CKList_Categories.DataSource = objDR
            CKList_Categories.DataBind()
            objDR.Close()
            Cmd.Parameters.Clear()
            objConnect.Close()
        End If
    End Sub


    Protected Sub BTN_Clear_Click(sender As Object, e As EventArgs) Handles BTN_Clear.Click
        Dim anitem As ListItem
        For Each anitem In CKList_Categories.Items
            anitem.Selected = False
        Next
        For Each anitem In CKLIst_Cyle.Items
            anitem.Selected = False
        Next

        UC_Results.Visible = False
    End Sub


    Protected Sub BTN_Search_Click(sender As Object, e As EventArgs) Handles BTN_Search.Click
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

        Dim SectionArray As New StringBuilder
        SectionArray.Append("")
        For Each anitem In CKList_Categories.Items
            If anitem.Selected Then
                If BLN_First = True Then
                    BLN_First = False
                    SectionArray.Append(anitem.Value)
                Else
                    SectionArray.Append("," & anitem.Value)
                End If
            End If
        Next
       
        objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure
        objDataAdapter.SelectCommand.CommandText = "QuestionsPage_ListQuestions"

        If SectionArray.Length = 0 Then
            objDataAdapter.SelectCommand.Parameters.Add("@SectionArray", SqlDbType.NVarChar).Value = System.DBNull.Value
        Else
            objDataAdapter.SelectCommand.Parameters.Add("@SectionArray", SqlDbType.NVarChar).Value = SectionArray.ToString
        End If

        If Array_CyclesSelected.Length = 0 Then
            objDataAdapter.SelectCommand.Parameters.Add("@Cycles", SqlDbType.NVarChar).Value = System.DBNull.Value
        Else
            objDataAdapter.SelectCommand.Parameters.Add("@Cycles", SqlDbType.NVarChar).Value = Array_CyclesSelected.ToString
        End If

        objDataAdapter.Fill(objDataSet, "newlisting")
        objConnect.Close()

        Array_CyclesSelected = Nothing
        SectionArray = Nothing



        UC_Results.BuildResults(objDataSet.Tables("newlisting").DefaultView)
        UC_Results.Visible = True
    End Sub
End Class

Imports System.Data
Imports System.Data.SqlClient
Imports GenericHelper.GenericHelper

Partial Class publicationsfolder_hints_briefs
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

            RunSearch()

        End If

    End Sub




    Sub RunSearch()

        objConnect.Open()

        objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure
            objDataAdapter.SelectCommand.CommandText = "List_Briefs"
            objDataAdapter.Fill(objDataSet, "NewBriefsList")
        objDataView = objDataSet.Tables("NewBriefsList").DefaultView

        objConnect.Close()

        objDataView.RowFilter = "FK_Language = 1 " 'FK_Language = 1 means English
        UC_Articles_English.BuildResults(objDataView)

        objDataView.RowFilter = "FK_Language = 2 " 'FK_Language = 2 means Spanish
        UC_Articles_Spanish.BuildResults(objDataView)

    End Sub


End Class

Imports System.Data
Imports System.Data.SqlClient

Partial Class _pub_admin_PubCounts
    Inherits System.Web.UI.Page


    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim objDataAdapter As New SqlDataAdapter("", objConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDataSet As New DataSet()
    Dim objDR As SqlDataReader

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load



        Cmd.CommandType = CommandType.StoredProcedure
        Cmd.CommandText = "[Report_AllPublications]"
        objConnect.Open()
        objDR = Cmd.ExecuteReader()
        Do While objDR.Read()
            LIT_TotalArticles.Text = objDR("TotalArticles")
            LIT_TotalPublications.Text = objDR("TotalPublications")
            LIT_TotalBriefs.Text = objDR("TotalBriefs")
            LIT_TotalEnglishBriefs.Text = objDR("TotalEnglishBriefs")
            LIT_TotalSpanishBriefs.Text = objDR("TotalSpanishBriefs")
        Loop
        objDR.Close()
        objConnect.Close()
        Cmd.Parameters.Clear()


    End Sub
End Class

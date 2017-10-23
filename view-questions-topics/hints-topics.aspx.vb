Imports System.Data
Imports System.Data.SqlClient

Partial Class questionsfolder_hints_topics
    Inherits System.Web.UI.Page

    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            objConnect.Open()
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "List_Sections"
            objDR = Cmd.ExecuteReader()
            rptTopics.DataSource = objDR
            rptTopics.DataBind()
            objDR.Close()
            Cmd.Parameters.Clear()

            objConnect.Close()

        End If
    End Sub
End Class

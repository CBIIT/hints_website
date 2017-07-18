Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Sql
Imports System.Data.SqlTypes
Imports System.Configuration
Imports System.IO
Imports System.Web.Security


Partial Class _pub_admin_FailedLogins
    Inherits System.Web.UI.Page

    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim objDataAdapter As New SqlDataAdapter("", objConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDataSet As New DataSet()
    Dim objDR As SqlDataReader

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            objConnect.Open()
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "List_Failed_Login_Attempts"
            objDR = Cmd.ExecuteReader()
            RPTR.DataSource = objDR
            RPTR.DataBind()
            objDR.Close()
            Cmd.Parameters.Clear()
            objConnect.Close()
        End If
    End Sub

    Sub MyButtonClick(sender As Object, e As EventArgs)

        Dim arg As String = CType(sender, Button).CommandArgument

        objConnect.Open()
        Cmd.CommandType = CommandType.StoredProcedure
        Cmd.CommandText = "Clear_Failed_Login_Attempts"
        Cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = arg
        Cmd.ExecuteNonQuery()
        Cmd.Parameters.Clear()
        objConnect.Close()

        Response.Redirect(Request.Url.AbsoluteUri)

    End Sub



End Class


Imports System.Web
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO


Partial Class _Default
    Inherits System.Web.UI.Page

    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader
    Dim BriefTitle As String
    Dim link As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then


        End If
    End Sub

    Protected Function GetFileSize(ByVal File_Path As Object) As String
        Try

            Dim f As New FileInfo(Server.MapPath("~") & File_Path)
            Dim s1 As Long = (f.Length) / 1024

            Return s1 & " k"
        Catch ex As Exception
            Return ""
        End Try
    End Function

End Class

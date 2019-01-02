Imports System.Data
Imports System.Data.SqlClient
Imports GenericHelper.GenericHelper
Imports System.Drawing
Imports Microsoft.Win32
Partial Class _tmp_rwb_view_sub
    Inherits System.Web.UI.Page

    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load


        If Test_RequestVar_IsNumeric(Server.HtmlEncode(Request.QueryString("PK_Submission"))) = False Then
            Response.RedirectPermanent("~/default.aspx")
        End If

        Dim PK_Submission As Integer = CInt(Server.HtmlEncode(Request.QueryString("PK_Submission")))

        Dim FileData As Object

        objConnect.Open()
        Cmd.CommandType = CommandType.StoredProcedure
        Cmd.CommandText = "Get_File_By_PK_Submission"
        Cmd.Parameters.Add("@PK_Submission", SqlDbType.Int).Value = PK_Submission
        objDR = Cmd.ExecuteReader()
        objDR.Read()
        Response.ContentType = objDR("FileType")
        FileData = objDR("FileData")
        objDR.Close()
        Cmd.Parameters.Clear()
        objConnect.Close()

        Response.BinaryWrite(FileData)


    End Sub

End Class


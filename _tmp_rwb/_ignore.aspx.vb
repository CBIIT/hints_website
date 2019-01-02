Imports System.Data
Imports System.Data.SqlClient

Partial Class _tmp_rwb_ignore
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
            Cmd.CommandType = CommandType.Text
            '  Cmd.CommandText = "List_SubmittedApplications"
            Cmd.CommandText = "select * from Publication_Submissions where isprocessed=0"
            objDR = Cmd.ExecuteReader()
            RPTR.DataSource = objDR
            RPTR.DataBind()
            objDR.Close()
            Cmd.Parameters.Clear()
            objConnect.Close()
        End If
    End Sub

    Sub btnDeleteClick(sender As Object, e As EventArgs)

        Dim arg As String = CType(sender, Button).CommandArgument

        objConnect.Open()
        Cmd.CommandType = CommandType.StoredProcedure
        Cmd.CommandText = "Delete_Pub_Submissions"
        Cmd.Parameters.Add("@PK_Submission", SqlDbType.Int).Value = CInt(arg)
        Cmd.ExecuteNonQuery()
        Cmd.Parameters.Clear()
        objConnect.Close()

        Response.Redirect(Request.Url.AbsoluteUri)

    End Sub

    Sub btnProcessedClick(sender As Object, e As EventArgs)

        Dim arg As String = CType(sender, Button).CommandArgument
        Dim username As String = HttpContext.Current.User.Identity.Name
        objConnect.Open()


        Cmd.CommandType = CommandType.StoredProcedure
        Cmd.CommandText = "Track_Process_Pub_Submissions"
        Cmd.Parameters.Add("@PK_Submission", SqlDbType.Int).Value = CInt(arg)
        Cmd.ExecuteNonQuery()
        Cmd.Parameters.Clear()

        objConnect.Close()

        Response.Redirect(Request.Url.AbsoluteUri)

    End Sub


    Function CheckVis(objfilename As Object) As Boolean
        If CheckNull(objfilename) = "" Then
            Return False
        Else
            Return True
        End If
    End Function



    Function CheckNull(TmpStr As Object) As String
        If TypeOf (TmpStr) Is DBNull Then
            Return ""
        Else
            Return TmpStr
        End If
    End Function

    Protected Sub BTN_Excel1_Click(sender As Object, e As EventArgs) Handles BTN_Excel1.Click
        Response.Redirect("_reportXLS.aspx")

    End Sub
End Class


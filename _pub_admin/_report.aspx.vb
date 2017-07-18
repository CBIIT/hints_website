Imports System.Data
Imports System.Data.SqlClient



Partial Class _pub_admin_report
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
            Cmd.CommandText = "List_InformUsForm"
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
        Dim UserId As Integer
        objConnect.Open()

        Cmd.CommandType = CommandType.StoredProcedure
        Cmd.CommandText = "Get_UserId"
        Cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = username
        UserId = Cmd.ExecuteScalar()
        Cmd.Parameters.Clear()



        Cmd.CommandType = CommandType.StoredProcedure
        Cmd.CommandText = "Track_Process_Pub_Submissions"
        Cmd.Parameters.Add("@PK_Submission", SqlDbType.Int).Value = CInt(arg)
        Cmd.Parameters.Add("@ProcessedBy", SqlDbType.Int).Value = UserId
        Cmd.Parameters.Add("@ProcessedDate", SqlDbType.NVarChar).Value = System.DateTime.Now.ToString
        Cmd.ExecuteNonQuery()
        Cmd.Parameters.Clear()

        Cmd.CommandType = CommandType.StoredProcedure
        Cmd.CommandText = "Process_Pub_Submissions"
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
        If TypeOf (TmpStr) Is dbnull Then
            Return ""
        Else
            Return TmpStr
        End If
    End Function

    Protected Sub BTN_Excel1_Click(sender As Object, e As EventArgs) Handles BTN_Excel1.Click
        Response.Redirect("_reportXLS.aspx")

    End Sub
End Class

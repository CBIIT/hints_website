Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Sql
Imports System.Data.SqlTypes
Imports System.Configuration
Imports System.IO
Imports System.Web.Security


Partial Class _pub_admin_Logon
    Inherits System.Web.UI.Page

    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim Cmd As New SqlCommand("", objConnect)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        send_sucess_row.Visible = False
        send_unsucess_row.Visible = False
        lblUname.Text = ""

        txtUserName.Focus()
        btnLogin.Enabled = True
        btnPass.Enabled = True
    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click

        Dim username As String = "default"
        Dim password As String = "default"
        Dim tempPass As String = ""
        Dim failedAttempts As Integer = 0
        Dim maxAttempts As Integer = 5

        If txtUserName.Value <> "" Then
            username = txtUserName.Value
        End If

        If txtUserPass.Value <> "" Then
            password = txtUserPass.Value
        End If

        ' Count number of failed login attempts
        objConnect.Open()

        Cmd.CommandType = CommandType.StoredProcedure
        Cmd.CommandText = "Count_Failed_Login_Attempts"
        Cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = username
        failedAttempts = Cmd.ExecuteScalar()
        Cmd.Parameters.Clear()

        If failedAttempts >= 5 Then

            lblLockMsg.Text = "Your account has been locked. Please contact the site administrator."

            btnLogin.Enabled = False
            btnPass.Enabled = False
        Else

            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "CheckUser"
            Cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = username
            tempPass = Cmd.ExecuteScalar()
            Cmd.Parameters.Clear()

            If password = tempPass Then

                ' Clear failed attempts

                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.CommandText = "Clear_Failed_Login_Attempts"
                Cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = username
                Cmd.ExecuteNonQuery()
                Cmd.Parameters.Clear()

                FormsAuthentication.RedirectFromLoginPage(username, True)

            Else

                lblFailMsg.Text = "Invalid Credentials"

                ' Add to failed login table

                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.CommandText = "Add_Failed_Login_Attempts"
                Cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = username
                Cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = password
                Cmd.Parameters.Add("@TimeOfAttempt", SqlDbType.NVarChar).Value = System.DateTime.Now.ToString
                Cmd.ExecuteNonQuery()
                Cmd.Parameters.Clear()


                ' Count number of failed login attempts

                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.CommandText = "Count_Failed_Login_Attempts"
                Cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = username
                failedAttempts = Cmd.ExecuteScalar()
                Cmd.Parameters.Clear()

                If failedAttempts >= maxAttempts Then

                    lblLockMsg.Text = "Your account has been locked. Please contact the site administrator."
                    btnLogin.Enabled = False
                    btnPass.Enabled = False
                End If

            End If

        End If

        objConnect.Close()

    End Sub

    Protected Sub btnPass_Click(sender As Object, e As EventArgs) Handles btnPass.Click

        Dim username As String = "Default"
        Dim tempPass As String
        Dim failedAttempts As Integer

        lblUname.Text = ""
        lblFailMsg.Text = ""

        If txtUserName.Value <> "" Then
            username = txtUserName.Value
        End If

        objConnect.Open()

        Cmd.CommandType = CommandType.StoredProcedure
        Cmd.CommandText = "Count_Failed_Login_Attempts"
        Cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = username
        failedAttempts = Cmd.ExecuteScalar()
        Cmd.Parameters.Clear()

        If failedAttempts >= 5 Then

            lblLockMsg.Text = "Your account has been locked. Please contact the site administrator."

            btnLogin.Enabled = False
            btnPass.Enabled = False
        Else



            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "CheckUser"
            Cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = username
            tempPass = Cmd.ExecuteScalar()
            Cmd.Parameters.Clear()
            objConnect.Close()

            'Dim SmtpClient As New System.Net.Mail.SmtpClient("localhost")
            Dim SmtpClient As New System.Net.Mail.SmtpClient(System.Configuration.ConfigurationManager.AppSettings("EmailHost").ToString)
            Dim Message As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage

            If tempPass <> "" Then

                Try
                    Message.To.Add(username)

                    Message.From = New System.Net.Mail.MailAddress("admin@test.com")

                    Message.Subject = "HINTS:Admin password recovery"
                    Message.Body = "Your password is: " & tempPass

                    Message.IsBodyHtml = True
                    SmtpClient.Send(Message)
                    Message.To.Clear()

                    send_sucess_row.Visible = True

                Catch ex As Exception
                    send_sucess_row.Visible = False
                    send_unsucess_row.Visible = True
                End Try

            Else
                lblUname.Text = "Invalid username"
            End If
        End If
    End Sub

    Protected Sub BTN_Clear_Click(sender As Object, e As EventArgs) Handles BTN_Clear.Click
        txtUserName.Value = ""
        txtUserPass.Value = ""
        send_sucess_row.Visible = False
        send_unsucess_row.Visible = False
        lblFailMsg.Text = ""
        lblLockMsg.Text = ""
        lblUname.Text = ""
    End Sub

End Class

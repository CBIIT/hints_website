Imports System.Data
Imports System.Data.SqlClient
Imports System.Net
Imports System.Web.Services
Imports System.IO
Imports System.Net.Mail
Imports System.Net.Mail.Attachment
Imports System.Web
Imports System.Web.Script.Serialization

Partial Class aboutfolder_contact_us
    Inherits System.Web.UI.Page

    Protected Shared ReCaptcha_Key As String = System.Configuration.ConfigurationManager.AppSettings("ReCaptchaPublicKey")
    Protected Shared ReCaptcha_Secret As String = System.Configuration.ConfigurationManager.AppSettings("ReCaptchaPrivateKey")


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            contact_table.Visible = True
            contactresult_table.Visible = False
            tr_captchaError_row.Visible = False

        End If
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        contactresult_table.Visible = False

        If recaptchaValidate() Then

            tr_captchaError_row.Visible = False

            If Page.IsValid Then
                DoSave()
            Else
                Exit Sub
            End If
            '                    <asp:Label ID="lblmsg" Text="" runat="server"></asp:Label>
            'lblmsg.Text = "Valid Recaptcha"
            'lblmsg.ForeColor = System.Drawing.Color.Green
        Else
            contactresult_table.Visible = True
            send_sucess_row.Visible = False
            send_unsucess_row.Visible = False
            tr_captchaError_row.Visible = True
            Exit Sub
            'lblmsg.Text = "Not Valid Recaptcha"
            'lblmsg.ForeColor = System.Drawing.Color.Red
        End If

    End Sub


    Sub DoSave()


        If Page.IsValid Then
            Dim SB_body As New StringBuilder
            'Dim SmtpClient As New System.Net.Mail.SmtpClient("localhost")
            Dim SmtpClient As New System.Net.Mail.SmtpClient(System.Configuration.ConfigurationManager.AppSettings("EmailHost").ToString)
            Dim Message As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage

            SB_body.Append("Name: " & txtfname.Text & " " & txtlname.Text & "<br/>")
            SB_body.Append("Phone: " & txtphone.Text & "<br/>")
            SB_body.Append("Subject: " & ddlformsubject.SelectedItem.Value & "<br/>")
            SB_body.Append("Email: " & txtemail.Text & "<br/>")
            SB_body.Append("Comments: " & txtcomments.Text & "<br/>")

            Try
                Message.To.Clear()
                Message.To.Add(System.Configuration.ConfigurationManager.AppSettings("AdminContactUs_To"))
                Message.CC.Add(System.Configuration.ConfigurationManager.AppSettings("AdminContactUs_CC"))
                Message.From = New System.Net.Mail.MailAddress(txtemail.Text)
                Message.Subject = "HINTS: email from contact form"
                Message.Body = SB_body.ToString
                LIT_Body.Text = SB_body.ToString
                Message.IsBodyHtml = True
                SmtpClient.Send(Message)
                Message.To.Clear()
                SB_body = Nothing

                contact_table.Visible = False
                contactresult_table.Visible = True
                send_sucess_row.Visible = True
                send_unsucess_row.Visible = False


            Catch ex As Exception
                contactresult_table.Visible = True
                send_sucess_row.Visible = False
                send_unsucess_row.Visible = True
            End Try
        End If


    End Sub

    Public Function recaptchaValidate() As Boolean
        Dim Response As String = Request.Form("g-recaptcha-response")
        Dim Valid As Boolean = False
        Dim req As HttpWebRequest = DirectCast(WebRequest.Create(Convert.ToString("https://www.google.com/recaptcha/api/siteverify?secret=" & ReCaptcha_Secret & "&response=") & Response), HttpWebRequest)
        'Try
        Using wResponse As WebResponse = req.GetResponse()

            Using readStream As New StreamReader(wResponse.GetResponseStream())
                Dim jsonResponse As String = readStream.ReadToEnd()
                Dim js As New JavaScriptSerializer()
                Dim data As Object = js.Deserialize(Of Object)(jsonResponse)
                Valid = Convert.ToBoolean(data("success"))
                'Context.Response.Write("<H1>xxxxxxxxx--" & data("success") & "--</h1>")
            End Using
        End Using

        Return Valid
        'Catch ex As WebException
        '    Throw ex
        'End Try

    End Function
End Class


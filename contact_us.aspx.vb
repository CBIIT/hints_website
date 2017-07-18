Partial Class contact_us
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            contact_table.Visible = True
            contactresult_table.Visible = False
        End If
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click



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
                send_sucess_row.Visible = False
                send_unsucess_row.Visible = True
            End Try
        End If

    End Sub

End Class

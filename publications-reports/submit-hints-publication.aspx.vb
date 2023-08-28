Imports System.Data
Imports System.Data.SqlClient
Imports System.Net
Imports System.Web.Services
Imports System.IO
Imports System.Net.Mail
Imports System.Net.Mail.Attachment
Imports System.Web
Imports System.Web.Script.Serialization

Partial Class publicationsfolder_submit_hints_publication
    Inherits System.Web.UI.Page


    Dim startDate As Integer
    Dim endDate As Integer

    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load



        If Not Page.IsPostBack Then

        End If


        TXT_title.Focus()
        title_wrapper.Visible = True
        If Not Page.IsPostBack Then
            informus_form.Visible = True
            contactresult_table.Visible = False
            PopulateMonth()
            PopulateYear()
        End If
    End Sub

    Protected Sub BTN_Submit_Click(sender As Object, e As EventArgs) Handles BTN_Submit.Click





        If rwbNotEmail.Text <> "" Then
            Response.Redirect("/error/potential.aspx")
        Else
            If Page.IsValid Then
                DoSave()
            Else
                Exit Sub
            End If
        End If


    End Sub

    Sub DoSave()



        If Page.IsValid Then



            Try

                Dim SB_body As New StringBuilder

                Dim strMonth As String = "not answered"

                If DDL_month.SelectedValue = "-1" Then
                    strMonth = ""
                Else
                    strMonth = DDL_month.SelectedItem.Value
                End If

                Dim strYear As String = "not answered"

                If DDL_year.SelectedValue = "-1" Then
                    strYear = ""
                Else
                    strYear = DDL_year.SelectedItem.Value
                End If

                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12


                'Dim SmtpClient As New System.Net.Mail.SmtpClient("localhost")
                Dim SmtpClient As New System.Net.Mail.SmtpClient(System.Configuration.ConfigurationManager.AppSettings("EmailHost").ToString)
                Dim Message As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage

                SB_body.Append("<strong>Title:</strong> " & TXT_title.Text & "<br/>")
                SB_body.Append("<strong>Journal:</strong> " & TXT_journal.Text & "<br/>")
                SB_body.Append("<strong>Primary Author:</strong> " & TXT_author.Text & "<br/>")
                SB_body.Append("<strong>All Author:</strong> " & TXT_Allauthors.Text & "<br/>")
                SB_body.Append("<strong>Corresponding Author Email:</strong> " & TXT_authorEmail.Text & "<br/>")
                SB_body.Append("<strong>Publish Date:</strong> " & strMonth & "/" & strYear & "<br/>")

                Message.To.Clear()
                Message.To.Add(System.Configuration.ConfigurationManager.AppSettings("AdminSubmitPub"))
                Message.From = New System.Net.Mail.MailAddress("rel.breedlove@icf.com")
                Message.Subject = "HINTS: Publication Submission From Web Site"
                Message.Body = SB_body.ToString
                Message.IsBodyHtml = True


                If CBool(System.Configuration.ConfigurationManager.AppSettings("ScanIsGoing")) = False Then
                    SmtpClient.Send(Message)
                End If
                Message.To.Clear()
                SB_body = Nothing

                informus_form.Visible = False
                title_wrapper.Visible = False
                contactresult_table.Visible = True

                'Response.Write("<h1>saved</h1>")
                msgSuccess.Visible = True
                send_unsucess_row.Visible = False


            Catch ex As Exception

                send_unsucess_row.Visible = True
            End Try
        End If


    End Sub

    Private Sub PopulateMonth()
        Dim time As DateTime = New DateTime(2000, 12, 12)
        Dim i As Integer
        For i = 1 To 12
            DDL_month.Items.Add(time.AddMonths(i).ToString("MMMM"))
        Next
    End Sub

    Private Sub PopulateYear()
        startDate = 2004
        endDate = DateTime.Now.Year
        While startDate <= endDate
            DDL_year.Items.Add(startDate.ToString)
            startDate += 1
        End While
    End Sub


End Class

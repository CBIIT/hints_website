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

    Protected Shared ReCaptcha_Key As String = System.Configuration.ConfigurationManager.AppSettings("ReCaptchaPublicKey")
    Protected Shared ReCaptcha_Secret As String = System.Configuration.ConfigurationManager.AppSettings("ReCaptchaPrivateKey")


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load



        If Not Page.IsPostBack Then

            '<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

            '        <!--
            '<p>
            '    <span class="required">*</span>Please enter the characters you see in the box below, in order. This helps prevent automated programs from misusing this service.
            '</p>
            '<div class="FormItemWrapper">
            '     <recaptcha:RecaptchaControl visible="false" ID="recaptcha" Theme="white" runat="server" />
            '<asp:CustomValidator ID="cvRecaptcha" CssClass="required" ErrorMessage="<br />Incorrect. Please enter the characters that appear on the screen."
            '    Display="Dynamic" runat="server" />

            '</div>

            '-->
        End If


        TXT_title.Focus()
        file_error.Text = ""
        title_wrapper.Visible = True
        If Not Page.IsPostBack Then
            informus_form.Visible = True
            contactresult_table.Visible = False
            PopulateMonth()
            PopulateYear()
        End If
    End Sub

    Protected Sub BTN_Submit_Click(sender As Object, e As EventArgs) Handles BTN_Submit.Click


        'If Not recaptcha.IsValid Then
        '    cvRecaptcha.IsValid = False
        'Else
        '    cvRecaptcha.IsValid = True
        'End If


        If recaptchaValidate() Then

            If Page.IsValid Then
                DoSave()
            Else
                Exit Sub
            End If
            '                    <asp:Label ID="lblmsg" Text="" runat="server"></asp:Label>
            'lblmsg.Text = "Valid Recaptcha"
            'lblmsg.ForeColor = System.Drawing.Color.Green
        Else
            Exit Sub
            'lblmsg.Text = "Not Valid Recaptcha"
            'lblmsg.ForeColor = System.Drawing.Color.Red
        End If


    End Sub

    Sub DoSave()


        If (FileUpload1.HasFile And FileUpload1.PostedFile.ContentLength > 5242880) Then
            file_error.Text = "Uploaded file too large. Please upload file < 5 MB"
            Return
        End If

        If Page.IsValid Then

            Dim SB_body As New StringBuilder
            'Dim SmtpClient As New System.Net.Mail.SmtpClient("localhost")
            Dim SmtpClient As New System.Net.Mail.SmtpClient(System.Configuration.ConfigurationManager.AppSettings("EmailHost").ToString)

            Dim Message As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage
            Dim br As New BinaryReader(FileUpload1.PostedFile.InputStream)
            Dim bytes As Byte() = br.ReadBytes(FileUpload1.PostedFile.InputStream.Length)

            SB_body.Append("Title: " & TXT_title.Text & "<br/>")
            SB_body.Append("Journal: " & TXT_journal.Text & "<br/>")
            SB_body.Append("Primary Author: " & TXT_author.Text & "<br/>")
            SB_body.Append("All Authors: " & TXT_Allauthors.Text & "<br/>")
            SB_body.Append("Author's email: " & TXT_authorEmail.Text & "<br/>")
            If DDL_month.SelectedItem.Value = "-1" Then
                SB_body.Append("Publish Month: <br/>")
            Else
                SB_body.Append("Publish Month: " & DDL_month.SelectedItem.Value & "<br/>")
            End If
            If DDL_month.SelectedItem.Value = "-1" Then
                SB_body.Append("Publish Year: <br/>")
            Else
                SB_body.Append("Publish Year: " & DDL_year.SelectedItem.Value & "<br/>")
            End If

            Try

                Message.To.Add(System.Configuration.ConfigurationManager.AppSettings("AdminInformUs_To"))
                Message.CC.Add(System.Configuration.ConfigurationManager.AppSettings("AdminInformUs_CC"))
                If (TXT_authorEmail.Text = "") Then
                    Message.From = New System.Net.Mail.MailAddress("noinfo@provided.com")
                Else
                    Message.From = New System.Net.Mail.MailAddress(TXT_authorEmail.Text)
                End If

                Message.Subject = "HINTS: email from inform us form"
                Message.Body = SB_body.ToString

                If (FileUpload1.HasFile And FileUpload1.PostedFile.ContentLength <= 5242880) Then
                    Message.Attachments.Add(New Attachment(FileUpload1.PostedFile.InputStream, FileUpload1.FileName))
                    SB_body.Append("Attachment: " & FileUpload1.FileName)
                End If

                LIT_Body.Text = SB_body.ToString
                Message.IsBodyHtml = True
                SmtpClient.Send(Message)
                'Response.Write("<h1>Email Sent</h1>")
                Message.To.Clear()

                SB_body = Nothing
                informus_form.Visible = False
                title_wrapper.Visible = False
                contactresult_table.Visible = True

                send_sucess_row.Visible = True
                'Response.Write("<h1>saved</h1>")
                msgSuccess.Visible = True
                send_unsucess_row.Visible = False


            Catch ex As Exception
                send_sucess_row.Visible = False
                send_unsucess_row.Visible = True
            End Try

            SaveToDB(bytes)
        End If

    End Sub


    Protected Sub SaveToDB(ByVal bytes As Byte())


        Dim Cmd As New SqlCommand("", objConnect)

        objConnect.Open()

        Cmd.CommandType = CommandType.StoredProcedure
        Cmd.CommandText = "Add_Publication_Submissions"

        Cmd.Parameters.Add("@Title", SqlDbType.NVarChar).Value = TXT_title.Text

        If TXT_journal.Text = "" Then
            Cmd.Parameters.Add("@Journal", SqlDbType.NVarChar).Value = System.DBNull.Value
        Else
            Cmd.Parameters.Add("@Journal", SqlDbType.NVarChar).Value = TXT_journal.Text
        End If


        If TXT_author.Text = "" Then
            Cmd.Parameters.Add("@PrimaryAuthor", SqlDbType.NVarChar).Value = System.DBNull.Value
        Else
            Cmd.Parameters.Add("@PrimaryAuthor", SqlDbType.NVarChar).Value = TXT_author.Text
        End If


        If TXT_Allauthors.Text = "" Then
            Cmd.Parameters.Add("@AllAuthors", SqlDbType.NVarChar).Value = System.DBNull.Value
        Else
            Cmd.Parameters.Add("@AllAuthors", SqlDbType.NVarChar).Value = TXT_Allauthors.Text
        End If


        If TXT_authorEmail.Text = "" Then
            Cmd.Parameters.Add("@AuthorEmail", SqlDbType.NVarChar).Value = System.DBNull.Value
        Else
            Cmd.Parameters.Add("@AuthorEmail", SqlDbType.NVarChar).Value = TXT_authorEmail.Text
        End If

        If DDL_month.SelectedValue = "-1" Then
            Cmd.Parameters.Add("@PublishMonth", SqlDbType.NVarChar).Value = System.DBNull.Value
        Else
            Cmd.Parameters.Add("@PublishMonth", SqlDbType.NVarChar).Value = DDL_month.SelectedItem.Value
        End If

        If DDL_year.SelectedValue = "-1" Then
            Cmd.Parameters.Add("@PublishYear", SqlDbType.NVarChar).Value = System.DBNull.Value
        Else
            Cmd.Parameters.Add("@PublishYear", SqlDbType.NVarChar).Value = DDL_year.SelectedItem.Value
        End If

        If FileUpload1.HasFile Then

            Cmd.Parameters.Add("@FileName", SqlDbType.NVarChar).Value = FileUpload1.FileName
            Cmd.Parameters.Add("@FileType", SqlDbType.NVarChar).Value = FileUpload1.PostedFile.ContentType
            Cmd.Parameters.Add("@FileData", SqlDbType.VarBinary).Value = bytes

        Else

            Cmd.Parameters.Add("@FileName", SqlDbType.NVarChar).Value = System.DBNull.Value
            Cmd.Parameters.Add("@FileType", SqlDbType.NVarChar).Value = System.DBNull.Value
            Cmd.Parameters.Add("@FileData", SqlDbType.VarBinary).Value = System.DBNull.Value

        End If

        Cmd.Parameters.Add("@CreationDate", SqlDbType.NVarChar).Value = System.DateTime.Now.ToString

        Cmd.ExecuteNonQuery()
        Cmd.Parameters.Clear()
        objConnect.Close()


        'Response.Write("<h1>record saved</h1>")
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
                'Context.Response.Write("<H1>--" & data("success") & "--</h1>")
            End Using
        End Using

        Return Valid
        'Catch ex As WebException
        '    Throw ex
        'End Try

    End Function
End Class

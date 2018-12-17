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
            Dim br As New BinaryReader(FileUpload1.PostedFile.InputStream)
            Dim bytes As Byte() = br.ReadBytes(FileUpload1.PostedFile.InputStream.Length)
            Try


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
                Dim ws As New com.hintsmeeting.Subscribe

                ws.Insert_Application(TXT_title.Text, TXT_journal.Text, TXT_author.Text, TXT_Allauthors.Text, TXT_authorEmail.Text, strMonth, strYear, FileUpload1.FileName, bytes, FileUpload1.PostedFile.ContentType, DateTime.Now().ToString("d"))




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

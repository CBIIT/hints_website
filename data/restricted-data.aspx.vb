﻿Imports System.Data
Imports System.Data.SqlClient
Imports GenericHelper.GenericHelper
Imports System.Net.Mail
Imports System.Net

Imports System.Threading.Tasks
Imports System.Net.Http.Headers
Imports System.Net.Http
Imports System.Activities.Expressions


Partial Class data_restricted_data
    Inherits System.Web.UI.Page


    'Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    'Dim objConnect As New SqlConnection(strConnect)
    'Dim Cmd As New SqlCommand("", objConnect)
    'Dim objDR As SqlDataReader
    'Dim objDataAdapter As New SqlDataAdapter("", objConnect)
    'Dim objDataSet As New System.Data.DataSet
    'Dim objDataView As DataView



    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    '    If Not Page.IsPostBack Then

    '        objConnect.Open()
    '        Cmd.CommandType = CommandType.StoredProcedure
    '        Cmd.CommandText = "List_restrictedadatasetsform_Cycles"
    '        objDR = Cmd.ExecuteReader()
    '        CKLIst_Cyle.DataSource = objDR
    '        CKLIst_Cyle.DataBind()
    '        objDR.Close()
    '        Cmd.Parameters.Clear()
    '        objConnect.Close()


    '    End If
    'End Sub


    'Protected Sub BTN_SubmitRestrictedData_Click(sender As Object, e As EventArgs) Handles BTN_SubmitRestrictedData.Click

    '    If rwbNotEmail.Text <> "" Then
    '        Response.Redirect("/error/potential.aspx")
    '    Else
    '        If Page.IsValid Then
    '            DoSave()
    '        Else
    '            Exit Sub
    '        End If
    '    End If

    'End Sub

    'Sub DoSave()
    '    If Page.IsValid Then


    '        Dim SB_body As New StringBuilder
    '        'Dim SmtpClient As New System.Net.Mail.SmtpClient("localhost")
    '        Dim SmtpClient As New System.Net.Mail.SmtpClient(System.Configuration.ConfigurationManager.AppSettings("EmailHost").ToString)
    '        Dim Message As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage

    '        Dim TempString As String = ""
    '        SB_body.Append("The following has sent a request for Restricted Datasets.<br/><br/>")

    '        SB_body.Append("<strong>Name:</strong> " & txt_Name.Text & "<br/>")
    '        SB_body.Append("<strong>Email:</strong> " & txt_email.Text & "<br/>")

    '        If CK_SAS.Checked = True Then
    '            TempString = "SAS"
    '        End If
    '        If CK_SPSS.Checked = True Then
    '            If TempString = "" Then
    '                TempString = "SPSS"
    '            Else
    '                TempString &= ", SPSS"
    '            End If
    '        End If
    '        If CK_STATA.Checked = True Then
    '            If TempString = "" Then
    '                TempString = "STATA"
    '            Else
    '                TempString &= ", STATA"
    '            End If
    '        End If
    '        SB_body.Append("<strong>Preferred Data Format:</strong> " & TempString & "<br/>")

    '        TempString = ""
    '        Dim MyItem As ListItem

    '        For Each MyItem In CKLIst_Cyle.Items
    '            If MyItem.Selected = True Then

    '                TempString &= "&nbsp;&nbsp;&nbsp;" & MyItem.Text & "<br/>"

    '            End If
    '        Next

    '        SB_body.Append("<strong>Requested iterations:</strong><br/>" & TempString & "<br/><br/>")






    '        SB_body.Append("<strong>Briefly describe your project including a title, and research questions/objectives or hypotheses.</strong><br/>" & txtproject.Text & "<br/><br/>")
    '        SB_body.Append("<strong>Please list your main independent and dependent variables.</strong><br/>" & txt_variables.Text & "<br/><br/>")
    '        SB_body.Append("<strong>Describe your analytic plan. What type of statistical tests do you plan to employ? How do you plan to incorporate the restricted variables including any linking variables? How are these related to your research questions/objectives or hypotheses?</strong><br/>" & txt_analyticplan.Text & "<br/><br/>")
    '        SB_body.Append("<strong>Describe your plan for addressing potentially small (n=<25) or missing data cells in order to either reduce disclosure risk, increase precision, or both — e.g., will you collapse across categories or suppress certain results? Do you anticipate any concerns with statistical power, i.e., having enough sample size to detect differences when they exist, and if so, what adjustments will you make, if any? Please elaborate.</strong><br/>" & txt_smallmissing.Text & "<br/><br/>")
    '        SB_body.Append("<strong>If you are utilizing the geocodes, describe your plan for how you will incorporate these variables — e.g., are you planning to use the geocodes as individual categories, or are you using them as linking variables to other data? If the latter, to which data will you be linking?</strong><br/>" & txt_geocodes.Text & "<br/><br/>")






    '        Try
    '            Message.To.Clear()
    '            Message.To.Add(System.Configuration.ConfigurationManager.AppSettings("AdminContactUs_To"))
    '            Message.CC.Add(System.Configuration.ConfigurationManager.AppSettings("AdminContactUs_CC"))
    '            Message.From = New System.Net.Mail.MailAddress(System.Configuration.ConfigurationManager.AppSettings("AdminContactUs_To"))
    '            Message.Subject = "HINTS: Request Restricted HINTS Datasets Submission"
    '            Message.Body = SB_body.ToString
    '            LIT_Body.Text = SB_body.ToString
    '            Message.IsBodyHtml = True


    '            ' rwb


    '            If CBool(System.Configuration.ConfigurationManager.AppSettings("ScanIsGoing")) = False Then
    '                SmtpClient.Send(Message)
    '            End If
    '            Message.To.Clear()
    '            SB_body = Nothing

    '            PLC_form.Visible = False
    '            PLC_Issue.Visible = False
    '            PLC_thankyou.Visible = True


    '        Catch ex As Exception

    '            PLC_form.Visible = False
    '            PLC_Issue.Visible = True
    '            PLC_thankyou.Visible = False
    '        End Try

    '        Try

    '            If chkAcceptTerm_SinglePage.Checked Then

    '                If CBool(System.Configuration.ConfigurationManager.AppSettings("ScanIsGoing")) = False Then
    '                    SubscribeToGovDelivery().Wait()
    '                End If

    '            End If





    '        Catch ex As Exception
    '            Response.Write("<h1>" & ex.ToString & "</h1>")
    '        End Try


    '    Else
    '        Exit Sub
    '    End If
    'End Sub




    'Private Async Function SubscribeToGovDelivery() As Task

    '    Try
    '        If CBool(System.Configuration.ConfigurationManager.AppSettings("ScanIsGoing")) = False Then


    '            System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12

    '            Using client As HttpClient = New HttpClient()
    '                client.DefaultRequestHeaders.Authorization = CreateBasicAuthenticationHeader()

    '                Dim xml = CreateXMLForCall(txt_email.Text, "USNIHNCI_331")

    '                Dim httpContent = New StringContent(xml, Encoding.UTF8, "application/xml")
    '                Dim responseObj = Await client.PostAsync(System.Configuration.ConfigurationManager.AppSettings("govdel_site"), httpContent).ConfigureAwait(False)

    '                If responseObj.StatusCode = HttpStatusCode.OK Then
    '                    ' Do Nothing
    '                Else
    '                    Response.Write("<h3>" & responseObj.StatusCode.ToString & "</h3>")
    '                End If

    '            End Using
    '        End If

    '    Catch ex As Exception

    '        Response.Write("<h3>" & ex.ToString & "</h3>")
    '    End Try
    'End Function


    'Function CreateXMLForCall(stremailAddress As String, strTopic As String) As String
    '    Dim sb As StringBuilder = New StringBuilder()
    '    sb.AppendLine("<subscriber>")
    '    sb.AppendLine("<email>" & stremailAddress & "</email>")
    '    sb.AppendLine("<send-notifications type='boolean'>false</send-notifications>")
    '    sb.AppendLine("<topics type='array'>")
    '    sb.AppendLine("<topic>")
    '    sb.AppendLine("<code>" & strTopic & "</code>")
    '    sb.AppendLine("</topic>")
    '    sb.AppendLine("</topics>")
    '    sb.AppendLine("</subscriber>")

    '    Return sb.ToString()
    'End Function

    'Private Function CreateBasicAuthenticationHeader() As AuthenticationHeaderValue
    '    Dim apiUser = System.Configuration.ConfigurationManager.AppSettings("govdel_user")
    '    Dim apiKey = System.Configuration.ConfigurationManager.AppSettings("govdel_pass")
    '    Dim byteArray = Encoding.ASCII.GetBytes(apiUser & ":" & apiKey)
    '    Dim header = New AuthenticationHeaderValue("Basic", Convert.ToBase64String(byteArray))
    '    Return header
    'End Function

    'Private Shared Function GetSubscriberId(ByVal emailAddress As String) As String
    '    Dim bytes = Encoding.UTF8.GetBytes(emailAddress)
    '    Return Convert.ToBase64String(bytes)
    'End Function


End Class

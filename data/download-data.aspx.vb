Imports System.Net
Imports System.Threading.Tasks
Imports System.Net.Http.Headers
Imports System.Net.Http
Partial Class datafolder_download_data
    Inherits System.Web.UI.Page


    Public strbody As String = ""
    Dim AcceptTerm As Boolean = False


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Me.MaintainScrollPositionOnPostBack = True

            Dim TermsUseCookie As HttpCookie = Request.Cookies("TermsAccepted")
            If TermsUseCookie Is Nothing Then
                Dim TempCookieToAdd As New HttpCookie("TermsAccepted")
                TempCookieToAdd.Value = "NOTAccepted"
                TempCookieToAdd.Expires = DateAndTime.Now.AddDays(7)
                Response.Cookies.Add(TempCookieToAdd)
                'Response.Redirect("/data/download-data.aspx")
                ' Done now in javascript so can test for cookies turned off.
            Else
                If (Request.Cookies("TermsAccepted").Value IsNot Nothing) And Request.Cookies("TermsAccepted").Value = "Accepted" Then

                    dv_data.Attributes.CssStyle.Remove("TermsHidden")
                    dv_data.Attributes.Add("class", "TermsShow")

                    PNL_Terms.Attributes.CssStyle.Remove("TermsShow")
                    PNL_Terms.Attributes.Add("class", "TermsHidden")
                End If

            End If
        End If

    End Sub



    Protected Sub btnSubmit_SinglePage_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit_SinglePage.Click
        If rwbNotEmail.Text <> "" Then
            Response.Redirect("/error/potential.aspx")
        Else
            If Page.IsValid Then
                AcceptTerm = True
                DoSave()
            Else
                Exit Sub
            End If
        End If
    End Sub


    Sub DoSave()
        Dim TermsUseCookie As HttpCookie = Request.Cookies("TermsAccepted")

        If AcceptTerm Then
            ' Set cookie to Accepted
            If TermsUseCookie Is Nothing Then
                Dim TempCookieToAdd As New HttpCookie("TermsAccepted")
                TempCookieToAdd.Value = "NOTAccepted"
                TempCookieToAdd.Expires = DateAndTime.Now.AddDays(7)
                Response.Cookies.Add(TempCookieToAdd)
            Else

                TermsUseCookie.Value = "Accepted"
                TermsUseCookie.Expires = DateAndTime.Now.AddDays(7)
                Response.Cookies.Set(TermsUseCookie)
            End If
            Sendemail()
        Else
            'AcceptTerm = False
            ' Optionally handle cases where acceptance wasn't confirmed
            If TermsUseCookie Is Nothing Then
                Dim TempCookieToAdd As New HttpCookie("TermsAccepted")
                TempCookieToAdd.Value = "NOTAccepted"
                TempCookieToAdd.Expires = DateAndTime.Now.AddDays(7)
                Response.Cookies.Add(TempCookieToAdd)
            Else
                TermsUseCookie.Value = "NOTAccepted"
                TermsUseCookie.Expires = DateAndTime.Now.AddDays(7)
                Response.Cookies.Set(TermsUseCookie)
            End If
            Exit Sub
        End If
    End Sub

    Private Sub Sendemail()
        Try

            Dim email_address As Object = txtemailTerms.Text

            System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12

            If txtemailTerms.Text <> "" Then
                If CBool(System.Configuration.ConfigurationManager.AppSettings("ScanIsGoing")) = False Then
                    SubscribeToGovDelivery().Wait()
                End If
            End If


            'Response.Redirect("~/data/download-data.aspx", False)


            dv_data.Attributes.CssStyle.Remove("TermsHidden")
            dv_data.Attributes.Add("class", "TermsShow")

            PNL_Terms.Attributes.CssStyle.Remove("TermsShow")
            PNL_Terms.Attributes.Add("class", "TermsHidden")


        Catch ex As Exception
            Response.Write("<h1>" & ex.ToString & "</h1>")
        End Try
    End Sub



    Private Async Function SubscribeToGovDelivery() As Task

        Try
            If CBool(System.Configuration.ConfigurationManager.AppSettings("ScanIsGoing")) = False Then



                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12

                Using client As HttpClient = New HttpClient()
                    client.DefaultRequestHeaders.Authorization = CreateBasicAuthenticationHeader()

                    Dim xml = CreateXMLForCall(txtemailTerms.Text, "USNIHNCI_331")

                    Dim httpContent = New StringContent(xml, Encoding.UTF8, "application/xml")
                    Dim responseObj = Await client.PostAsync(System.Configuration.ConfigurationManager.AppSettings("govdel_site"), httpContent).ConfigureAwait(False)

                    If responseObj.StatusCode = HttpStatusCode.OK Then
                        'Do Nothing
                    Else
                        Response.Write("<h3>" & responseObj.StatusCode.ToString & "</h3>")
                    End If

                End Using
            End If

        Catch ex As Exception

            Response.Write("<h3>" & ex.ToString & "</h3>")
        End Try
    End Function


    Function CreateXMLForCall(stremailAddress As String, strTopic As String) As String
        Dim sb As StringBuilder = New StringBuilder()
        sb.AppendLine("<subscriber>")
        sb.AppendLine("<email>" & stremailAddress & "</email>")
        sb.AppendLine("<send-notifications type='boolean'>false</send-notifications>")
        sb.AppendLine("<topics type='array'>")
        sb.AppendLine("<topic>")
        sb.AppendLine("<code>" & strTopic & "</code>")
        sb.AppendLine("</topic>")
        sb.AppendLine("</topics>")
        sb.AppendLine("</subscriber>")

        Return sb.ToString()
    End Function


    Private Function CreateBasicAuthenticationHeader() As AuthenticationHeaderValue
        Dim apiUser = System.Configuration.ConfigurationManager.AppSettings("govdel_user")
        Dim apiKey = System.Configuration.ConfigurationManager.AppSettings("govdel_pass")
        Dim byteArray = Encoding.ASCII.GetBytes(apiUser & ":" & apiKey)
        Dim header = New AuthenticationHeaderValue("Basic", Convert.ToBase64String(byteArray))
        Return header
    End Function

    Private Shared Function GetSubscriberId(ByVal emailAddress As String) As String
        Dim bytes = Encoding.UTF8.GetBytes(emailAddress)
        Return Convert.ToBase64String(bytes)
    End Function




End Class

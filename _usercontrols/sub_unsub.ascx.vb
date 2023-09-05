Imports System.Net
Imports System.Threading.Tasks
Imports System.Net.Http.Headers
Imports System.Net.Http


Partial Class _usercontrols_sub_unsub
    Inherits System.Web.UI.UserControl



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

        End If
    End Sub


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        If Page.IsValid Then

            If rwbNotEmail.Text <> "" Then
                Response.Redirect("/error/potential.aspx")
            Else
                If Page.IsValid Then
                    DoSave()
                Else
                    Exit Sub
                End If
            End If


        End If
    End Sub
    Sub DoSave()
        If rdSub.Checked Then
            SubscribeToGovDelivery().Wait()
        ElseIf rdUnsub.Checked Then
            UNSubscribeToGovDelivery().Wait()
        Else
            Exit Sub
        End If
    End Sub


    Private Async Function UNSubscribeToGovDelivery() As Task

        Try
            If CBool(System.Configuration.ConfigurationManager.AppSettings("ScanIsGoing")) = False Then


                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12

                Using client As HttpClient = New HttpClient()
                    client.DefaultRequestHeaders.Authorization = CreateBasicAuthenticationHeader()
                    Dim sb As StringBuilder = New StringBuilder()
                    Dim xml = CreateXMLForCall(txtemailTerms.Text, "USNIHNCI_331")
                    Dim httpContent = New StringContent(xml, Encoding.UTF8, "application/xml")

                    Dim request = New HttpRequestMessage With {
                         .Method = HttpMethod.Delete,
                          .RequestUri = New Uri(System.Configuration.ConfigurationManager.AppSettings("govdel_site")),
                          .Content = httpContent
                       }
                    Dim responseobj = Await client.SendAsync(request).ConfigureAwait(False)

                    ' Dim responseObj = Await client.PostAsync(System.Configuration.ConfigurationManager.AppSettings("govdel_site"), httpContent).ConfigureAwait(False)

                    If responseobj.StatusCode = HttpStatusCode.OK Then
                        ' Do Nothing
                    Else
                        Response.Write("<h3>" & responseobj.StatusCode.ToString & "</h3>")
                    End If

                End Using
            End If

        Catch ex As Exception
            Response.Write("<h3>" & ex.ToString & "</h3>")
        End Try
    End Function

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
                        ' Do Nothing
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

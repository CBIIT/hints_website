Imports System.Net
Imports System.Threading.Tasks
Imports System.Net.Http.Headers
Imports System.Net.Http
Imports System.Activities.Expressions
Imports System.Net.Mail

Partial Class subscribe_Default
    Inherits System.Web.UI.Page



    Public strbody As String = ""

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            MultiView1.SetActiveView(VW_Form)
        End If
    End Sub


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
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
        'If rdSub.Checked Then
        '    subscribeMe()
        'ElseIf rdUnsub.Checked Then
        '    UnSubscribeMe()
        'Else
        '    Exit Sub
        'End If
        SubscribeToGovDelivery().Wait()
    End Sub


    Private Async Function SubscribeToGovDelivery() As Task

        Try
            If CBool(System.Configuration.ConfigurationManager.AppSettings("ScanIsGoing")) = False Then


                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12

                Using client As HttpClient = New HttpClient()
                    client.DefaultRequestHeaders.Authorization = CreateBasicAuthenticationHeader()
                    Dim sb As StringBuilder = New StringBuilder()
                    sb.AppendLine("<subscriber>")
                    sb.AppendLine("<email>" & txtemailTerms.Text & "</email>")
                    sb.AppendLine("<send-notifications type='boolean'>false</send-notifications>")
                    sb.AppendLine("<topics type='array'>")
                    sb.AppendLine("<topic>")
                    sb.AppendLine("<code>USNIHNCI_331</code>")
                    sb.AppendLine("</topic>")
                    sb.AppendLine("</topics>")
                    sb.AppendLine("</subscriber>")
                    Dim xml = sb.ToString()
                    Dim httpContent = New StringContent(xml, Encoding.UTF8, "application/xml")
                    Dim responseObj = Await client.PostAsync(System.Configuration.ConfigurationManager.AppSettings("govdel_site"), httpContent).ConfigureAwait(False)

                    If responseObj.StatusCode = HttpStatusCode.OK Then
                        MultiView1.SetActiveView(VW_Subscribed)
                    Else
                        Response.Redirect("~/problem.aspx")
                    End If

                    MultiView1.SetActiveView(VW_Subscribed)
                End Using
            End If

        Catch ex As Exception

            Response.Redirect("~/problem.aspx")
        End Try
    End Function



    'Sub UnSubscribeMe()
    '    Try
    '        System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12
    '        Dim ws As New com.hintsmeeting.Subscribe
    '        Dim email_address As Object = txtemailTerms.Text


    '        If CBool(System.Configuration.ConfigurationManager.AppSettings("ScanIsGoing")) = False Then
    '            ws.UNSubscribeToNciHintsUsers(email_address)
    '        End If

    '        MultiView1.SetActiveView(VW_UNSubscribed)
    '    Catch ex As Exception
    '        Response.Redirect("~/problem.aspx")
    '    End Try

    'End Sub



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

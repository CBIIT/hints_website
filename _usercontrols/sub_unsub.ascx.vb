Imports System.Net
Imports System.Threading.Tasks
Imports System.Net.Http.Headers
Imports System.Net.Http
Imports System.Activities.Expressions
Imports System.Net.Mail

Partial Class _usercontrols_sub_unsub
    Inherits System.Web.UI.UserControl


    Public strbody As String = ""

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

        End If
    End Sub


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        If Page.IsValid Then

            If CBool(System.Configuration.ConfigurationManager.AppSettings("ScanIsGoing")) = False Then
                SubscribeToGovDelivery().Wait()
            End If
        End If
    End Sub



    Private Async Function SubscribeToGovDelivery() As Task

        Try
            If CBool(System.Configuration.ConfigurationManager.AppSettings("ScanIsGoing")) = False Then



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
                        ' Do Nothing
                    Else
                        Response.Redirect("~/problem.aspx")
                    End If

                End Using
            End If

        Catch ex As Exception

            Response.Redirect("~/problem.aspx")
        End Try
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

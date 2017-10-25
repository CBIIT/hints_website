Imports GenericHelper.GenericHelper
Imports Lyris.Lyris


Partial Class _usercontrols_terms
    Inherits System.Web.UI.UserControl



    Public strbody As String = ""


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit_UCbtn.Click
        If Page.IsValid Then

            Dim TermsUseCookie As HttpCookie = Request.Cookies("TermsAccepted")
            If Me.chkAcceptTerm_mod.Checked Then
                If TermsUseCookie Is Nothing Then

                    Dim TempCookieToAdd As New HttpCookie("TermsAccepted")
                    TempCookieToAdd.Value = "Accepted"
                    TempCookieToAdd.Expires = DateAndTime.Now.AddDays(7)
                    Response.Cookies.Add(TempCookieToAdd)
                Else
                    TermsUseCookie.Value = "Accepted"
                    TermsUseCookie.Expires = DateAndTime.Now.AddDays(7)
                    Response.Cookies.Set(TermsUseCookie)
                End If

                Sendemail()
                Response.Redirect("~/data/download-data.aspx")
            Else
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
        End If
    End Sub

    Private Sub Sendemail()
        If Page.IsValid Then
            Try

                Dim HINTSMeeting_SubscribeService As New com.hintsmeeting.Subscribe
                Dim obj As Object = txtemailTermsService.Text

                HINTSMeeting_SubscribeService.SubscribeToNciHintsUsers(obj)



            Catch ex As Exception
                Response.Write("<h1>" & ex.ToString & "</h1>")
            End Try
        End If
    End Sub
End Class


Partial Class datafolder_survey_instruments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then


            Dim TermsUseCookie As HttpCookie = Request.Cookies("TermsAccepted")
            If TermsUseCookie Is Nothing Then
                Dim TempCookieToAdd As New HttpCookie("TermsAccepted")
                TempCookieToAdd.Value = "NOTAccepted"
                TempCookieToAdd.Expires = DateAndTime.Now.AddDays(7)
                Response.Cookies.Add(TempCookieToAdd)
                hyp_instruments_download_inner.HRef = "~/data/download-data.aspx"
                hyp_instruments_download_inner_One.HRef = "~/data/download-data.aspx"
            Else
                If (Request.Cookies("TermsAccepted").Value IsNot Nothing) And Request.Cookies("TermsAccepted").Value = "Accepted" Then
                    hyp_instruments_download_inner.HRef = "~/data/download-data.aspx"
                    hyp_instruments_download_inner_One.HRef = "~/data/download-data.aspx"
                Else
                    hyp_instruments_download_inner.HRef = "~/data/download-data.aspx"
                    hyp_instruments_download_inner_One.HRef = "~/data/download-data.aspx"
                End If
            End If
        End If

    End Sub
End Class



Partial Class inform_us
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Response.RedirectPermanent("/publications-reports/submit-hints-publication.aspx")
    End Sub
End Class
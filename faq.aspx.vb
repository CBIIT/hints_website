
Partial Class faq
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Response.RedirectPermanent("/about-hints/frequently-asked-questions.aspx")
    End Sub


End Class

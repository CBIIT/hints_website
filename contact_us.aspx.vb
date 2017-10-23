Partial Class contact_us
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Response.RedirectPermanent("/about-hints/contact-us.aspx")
    End Sub



End Class


Partial Class about
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Response.RedirectPermanent("/about-hints/learn-more-about-hints.aspx")
    End Sub
End Class

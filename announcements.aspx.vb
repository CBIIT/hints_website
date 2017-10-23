
Partial Class announcements
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Response.RedirectPermanent("/about-hints/announcements.aspx")
    End Sub

End Class

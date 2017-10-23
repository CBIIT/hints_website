
Partial Class hints4
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Response.RedirectPermanent("/about-hints/data-collection-schedule.aspx")
    End Sub
End Class

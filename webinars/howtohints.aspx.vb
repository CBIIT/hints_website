
Partial Class webinars_howtohints
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Response.RedirectPermanent("/meetings-trainings/hints-educational-webinars.aspx")
    End Sub
End Class

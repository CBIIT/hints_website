
Partial Class instrument
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Response.RedirectPermanent("/data/survey-instruments.aspx")
    End Sub

End Class

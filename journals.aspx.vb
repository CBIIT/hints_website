
Partial Class journals
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Response.RedirectPermanent("/publications-reports/hints-journals.aspx")
    End Sub

End Class

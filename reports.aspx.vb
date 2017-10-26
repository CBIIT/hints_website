
Partial Class reports
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Response.RedirectPermanent("/publications-reports/nci-reports.aspx")
    End Sub
End Class

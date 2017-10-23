
Partial Class dataset
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Response.RedirectPermanent("/data/download-data.aspx")
    End Sub
End Class



Partial Class sections
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Response.RedirectPermanent("/view-questions-topics/hints-topics.aspx")
    End Sub
End Class

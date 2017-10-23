Partial Class allMaps
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Response.RedirectPermanent("/view-questions-topics/geographic-data-maps.aspx")
    End Sub
End Class

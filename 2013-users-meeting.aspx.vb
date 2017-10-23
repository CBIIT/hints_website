
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Response.RedirectPermanent("/meetings-trainings/2014-users-meeting.aspx")
    End Sub
End Class

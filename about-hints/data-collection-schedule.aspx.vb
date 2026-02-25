
Partial Class aboutfolder_data_collection_schedule
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Dim newUrl As String = "/" ' <-- replace with your real URL
        Response.RedirectPermanent(newUrl, endResponse:=True)
    End Sub

End Class

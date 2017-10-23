
Partial Class datafolder_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load


        If Not Page.IsPostBack Then

            If Cache("termsAccepted") = Nothing Then
                'Cache.Insert("termsAccepted", "NOTAccepted", Nothing, Cache.NoAbsoluteExpiration, TimeSpan.FromSeconds(20))
                Cache("termsAccepted") = "NOTAccepted"
            End If
            If Cache("termsAccepted") = "Accepted" Then
                HYP_Download_landingPage.NavigateUrl = "~/data/termsofuse.aspx"
            Else
                HYP_Download_landingPage.NavigateUrl = "~/data/termsofuse.aspx"
            End If
        End If


    End Sub
End Class


Partial Class datafolder_survey_instruments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then


            If Cache("termsAccepted") = Nothing Then
                'Cache.Insert("termsAccepted", "NOTAccepted", Nothing, Cache.NoAbsoluteExpiration, TimeSpan.FromSeconds(20))
                Cache("termsAccepted") = "NOTAccepted"
            End If
            If Cache("termsAccepted") = "Accepted" Then
                hyp_instruments_download_inner.HRef = "~/data/download-data.aspx"
                hyp_instruments_download_inner_One.HRef = "~/data/download-data.aspx"
            Else
                hyp_instruments_download_inner.HRef = "~/data/termsofuse.aspx"
                hyp_instruments_download_inner_One.HRef = "~/data/termsofuse.aspx"
            End If
        End If

    End Sub
End Class

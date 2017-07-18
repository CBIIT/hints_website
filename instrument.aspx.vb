
Partial Class instrument
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then


            If Session("AcceptTerm") = Nothing Then
                Session("AcceptTerm") = False
            End If
            If Session("AcceptTerm") = True Then
                hyp_instruments_download_inner.HRef = "~/dataset.aspx"
                hyp_instruments_download_inner_One.HRef = "~/dataset.aspx"
            Else
                hyp_instruments_download_inner.HRef = "~/instrument.aspx#openModal"
                hyp_instruments_download_inner_One.HRef = "~/instrument.aspx#openModal"
            End If
        End If
    End Sub

End Class

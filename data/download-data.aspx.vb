
Partial Class datafolder_download_data
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Cache("termsAccepted") = Nothing Then
                Response.Redirect("/data/termsofuse.aspx")
            Else
                If Cache("termsAccepted") = "Accepted" Then
                    '' do nothing"
                Else
                    Response.Redirect("/data/termsofuse.aspx")
                End If
            End If
        End If

    End Sub

End Class

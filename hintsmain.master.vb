
Partial Class hintsmain
    Inherits System.Web.UI.MasterPage




    Protected Sub LinkButtonSearch_Click(sender As Object, e As System.EventArgs) Handles BTN_Search.Click
        If Page.IsValid Then

            Response.Redirect("~/Advanced.aspx?q=" & Server.UrlEncode(SearchBoxText.Text))


        End If

    End Sub

End Class


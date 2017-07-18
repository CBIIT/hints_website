
Partial Class _usercontrols_search
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        Panel1.DefaultButton = LinkButtonSearch.ID

        TextBoxSearch.Attributes.Add("onfocus", "clearText()")
        TextBoxSearch.Attributes.Add("onblur", "resetText()")

        Dim strSearch As String = "enter keyword..."
        TextBoxSearch.Text = strSearch

        TextBoxSearch.Attributes.Add("onfocus", "QuestionNumberFocus(this, '" & strSearch & "');")
        TextBoxSearch.Attributes.Add("onblur", "QuestionNumberBlur(this, '" & strSearch & "');")

    End Sub


    Protected Sub LinkButtonSearch_Click(sender As Object, e As System.EventArgs) Handles LinkButtonSearch.Click
        Response.Redirect("~/Advanced.aspx?q=" & Server.UrlEncode(TextBoxSearch.Text))
    End Sub


End Class


Partial Class Main
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            '  Response.Write("<h1>xxx=" & Session("AcceptTerm") & "</h1>")
            If Session("AcceptTerm") = Nothing Then
                Session("AcceptTerm") = False
            End If
            If Session("AcceptTerm") = True Then
                hints_download.HRef = "~/dataset.aspx"
                hints_download_NOJS.HRef = "~/dataset.aspx"
            Else
                hints_download.HRef = "javascript:OpenModalRWB();"
                hints_download_NOJS.HRef = "~/terms.aspx"
            End If
        End If
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        SearchPanel.DefaultButton = BTN_Search.ID

        SearchBoxText.Attributes.Add("onfocus", "clearText()")
        SearchBoxText.Attributes.Add("onblur", "resetText()")

        Dim strSearch As String = "enter keyword..."
        SearchBoxText.Text = strSearch

        SearchBoxText.Attributes.Add("onfocus", "QuestionNumberFocus(this, '" & strSearch & "');")
        SearchBoxText.Attributes.Add("onblur", "QuestionNumberBlur(this, '" & strSearch & "');")

    End Sub


    Protected Sub LinkButtonSearch_Click(sender As Object, e As System.EventArgs) Handles BTN_Search.Click
        If Page.IsValid Then
            If DDL_SearchWhat.SelectedValue = "p" Then
                Response.Redirect("~/publication-search.aspx?q=" & Server.UrlEncode(SearchBoxText.Text))
            Else
                Response.Redirect("~/Advanced.aspx?q=" & Server.UrlEncode(SearchBoxText.Text))
            End If

        End If

    End Sub

    Protected Sub BTN_AdvancedSearch_Click(sender As Object, e As System.EventArgs) Handles BTN_AdvancedSearch.Click

        If DDL_SearchWhat.SelectedValue = "p" Then
            Response.Redirect("~/publication-search.aspx?sf=1")
        Else
            Response.Redirect("~/Advanced.aspx?sf=1")
        End If

    End Sub

End Class


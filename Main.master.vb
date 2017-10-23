
Partial Class Main
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            If Cache("termsAccepted") = Nothing Then
                'Cache.Insert("termsAccepted", "NOTAccepted", Nothing, Cache.NoAbsoluteExpiration, TimeSpan.FromSeconds(20))
                Cache("termsAccepted") = "NOTAccepted"
            End If
            If Cache("termsAccepted") = "Accepted" Then
                hints_download.HRef = "~/data/download-data.aspx"
                hints_download_NOJS.HRef = "~/data/download-data.aspx"
                hints_download_Mobile.HRef = "~/data/download-data.aspx"
            Else
                hints_download.HRef = "javascript:OpenModalRWB();"
                hints_download_NOJS.HRef = "~/data/termsofuse.aspx"
                hints_download_Mobile.HRef = "~/data/termsofuse.aspx"
            End If
        End If

        'https://stackoverflow.com/questions/16542661/caching-in-asp-net-slidingexpiration-and-absoluteexpiration
        'Response.Write("<h1>master page termsAccepted Cache check = " & Cache("termsAccepted") & "</h1>")


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


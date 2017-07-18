
Partial Class dataset
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            '  Response.Write("<h1>xxx=" & Session("AcceptTerm") & "</h1>")
            If Session("AcceptTerm") = Nothing Then
                Session("AcceptTerm") = False
                Response.Redirect("/terms.aspx")
            End If
            If Session("AcceptTerm") = True Then
                '' do nothing"
            Else
                Response.Redirect("/terms.aspx")
            End If
        End If
    End Sub
End Class

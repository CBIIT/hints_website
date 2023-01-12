
Partial Class zremovecookie
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            Dim TermsUseCookie As HttpCookie = Request.Cookies("TermsAccepted")
            If TermsUseCookie Is Nothing Then

                Response.Write("<p>No Cookie</p>")
            Else
                If (Request.Cookies("TermsAccepted").Value IsNot Nothing) And Request.Cookies("TermsAccepted").Value = "Accepted" Then

                    Response.Write("<p>Cookie ==== " & Request.Cookies("TermsAccepted").Value & "---</p>")
                Else

                    Response.Write("<p>Cookie ELse Check ==== " & Request.Cookies("TermsAccepted").Value & "---</p>")
                End If
            End If


        End If


    End Sub


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim nameCookie As HttpCookie = Request.Cookies("TermsAccepted")
        nameCookie.Expires = DateTime.Now.AddDays(-1)
        Response.Cookies.Add(nameCookie)
        Response.Write("<H1>done - removed</h1>")
    End Sub
End Class

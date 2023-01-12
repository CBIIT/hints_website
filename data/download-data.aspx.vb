Imports System.Net
Partial Class datafolder_download_data
    Inherits System.Web.UI.Page


    Public strbody As String = ""
    Dim AcceptTerm As Boolean = False


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Me.MaintainScrollPositionOnPostBack = True

            Dim TermsUseCookie As HttpCookie = Request.Cookies("TermsAccepted")
            If TermsUseCookie Is Nothing Then
                Dim TempCookieToAdd As New HttpCookie("TermsAccepted")
                TempCookieToAdd.Value = "NOTAccepted"
                TempCookieToAdd.Expires = DateAndTime.Now.AddDays(7)
                Response.Cookies.Add(TempCookieToAdd)
                'Response.Redirect("/data/download-data.aspx")
                ' Done now in javascript so can test for cookies turned off.
            Else
                If (Request.Cookies("TermsAccepted").Value IsNot Nothing) And Request.Cookies("TermsAccepted").Value = "Accepted" Then

                    dv_data.Attributes.CssStyle.Remove("TermsHidden")
                    dv_data.Attributes.Add("class", "TermsShow")

                    PNL_Terms.Attributes.CssStyle.Remove("TermsShow")
                    PNL_Terms.Attributes.Add("class", "TermsHidden")
                End If

            End If
        End If

    End Sub



    Protected Sub btnSubmit_SinglePage_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit_SinglePage.Click
        If rwbNotEmail.Text <> "" Then
            Response.Redirect("/error/potential.aspx")
        Else
            If Page.IsValid Then
                DoSave()
            Else
                Exit Sub
            End If
        End If
    End Sub


    Sub DoSave()
        Dim TermsUseCookie As HttpCookie = Request.Cookies("TermsAccepted")

        If Me.chkAcceptTerm_SinglePage.Checked Then
            AcceptTerm = True
            If TermsUseCookie Is Nothing Then
                Dim TempCookieToAdd As New HttpCookie("TermsAccepted")
                TempCookieToAdd.Value = "NOTAccepted"
                TempCookieToAdd.Expires = DateAndTime.Now.AddDays(7)
                Response.Cookies.Add(TempCookieToAdd)
            Else

                TermsUseCookie.Value = "Accepted"
                TermsUseCookie.Expires = DateAndTime.Now.AddDays(7)
                Response.Cookies.Set(TermsUseCookie)
            End If
            Sendemail()
        Else
            AcceptTerm = False
            If TermsUseCookie Is Nothing Then
                Dim TempCookieToAdd As New HttpCookie("TermsAccepted")
                TempCookieToAdd.Value = "NOTAccepted"
                TempCookieToAdd.Expires = DateAndTime.Now.AddDays(7)
                Response.Cookies.Add(TempCookieToAdd)
            Else
                TermsUseCookie.Value = "NOTAccepted"
                TermsUseCookie.Expires = DateAndTime.Now.AddDays(7)
                Response.Cookies.Set(TermsUseCookie)
            End If
            Exit Sub
        End If
    End Sub

    Private Sub Sendemail()
        Try

            Dim ws As New com.hintsmeeting.Subscribe
            Dim email_address As Object = txtemailTerms.Text

            System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12
            ws.SubscribeToNciHintsUsers(email_address)
            'Response.Redirect("~/data/download-data.aspx", False)


            dv_data.Attributes.CssStyle.Remove("TermsHidden")
            dv_data.Attributes.Add("class", "TermsShow")

            PNL_Terms.Attributes.CssStyle.Remove("TermsShow")
            PNL_Terms.Attributes.Add("class", "TermsHidden")


        Catch ex As Exception
            Response.Write("<h1>" & ex.ToString & "</h1>")
        End Try
    End Sub


    Protected Sub CustomValidator1_ServerValidate(source As Object, args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator1.ServerValidate
        If chkAcceptTerm_SinglePage.Checked Then
            args.IsValid = True
        Else
            args.IsValid = False
        End If
    End Sub

End Class

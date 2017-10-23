
Partial Class data_termsofuse
    Inherits System.Web.UI.Page




    Public strbody As String = ""
    Dim AcceptTerm As Boolean = False

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.MaintainScrollPositionOnPostBack = True
    End Sub

    Protected Sub btnSubmit_SinglePage_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit_SinglePage.Click
        If Page.IsValid Then
            If Me.chkAcceptTerm_SinglePage.Checked Then
                AcceptTerm = True
                'Cache.Insert("termsAccepted", "Accepted", Nothing, Cache.NoAbsoluteExpiration, TimeSpan.FromSeconds(20))
                Cache("termsAccepted") = "Accepted"
                Sendemail()
            Else
                AcceptTerm = False
                'Cache.Insert("termsAccepted", "NOTAccepted", Nothing, Cache.NoAbsoluteExpiration, TimeSpan.FromSeconds(20))
                Cache("termsAccepted") = "NOTAccepted"
                Exit Sub
            End If
        End If
    End Sub

    Private Sub Sendemail()
        Try

            Dim ws As New com.hintsmeeting.Subscribe
            Dim email_address As Object = txtemailTerms.Text
            ws.SubscribeToNciHintsUsers(email_address)
            Response.Redirect("~/data/download-data.aspx", False)
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

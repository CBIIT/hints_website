
Imports Lyris.Lyris


Partial Class terms
    Inherits System.Web.UI.Page


    Public strbody As String = ""
    Dim AcceptTerm As Boolean = False

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        btnSubmit.Attributes.Add("onclick", "validateForm();")
        Me.MaintainScrollPositionOnPostBack = True
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        If Page.IsValid Then
            If Me.chkAcceptTerm.Checked Then
                AcceptTerm = True
                Session("AcceptTerm") = True
                Sendemail()
            Else
                AcceptTerm = False
                Session("AcceptTerm") = False
                Exit Sub
            End If
        End If
    End Sub

    Private Sub Sendemail()
        Try
          
            Dim ws As New com.hintsmeeting.Subscribe
            Dim email_address As Object = txtemailTerms.Text
            ws.SubscribeToNciHintsUsers(email_address)

            Response.Redirect("~/dataset.aspx")
        Catch ex As Exception
            Response.Write("<h1>" & ex.ToString & "</h1>")
        End Try
    End Sub


    Protected Sub CustomValidator1_ServerValidate(source As Object, args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator1.ServerValidate
        If chkAcceptTerm.Checked Then
            args.IsValid = True
        Else
            args.IsValid = False
        End If
    End Sub
End Class

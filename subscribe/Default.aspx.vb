Imports System.Net
Imports Lyris.Lyris

Partial Class subscribe_Default
    Inherits System.Web.UI.Page



    Public strbody As String = ""

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            MultiView1.SetActiveView(VW_Form)
        End If
    End Sub


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        If Page.IsValid Then
            If rdSub.Checked Then
                subscribeMe()
            ElseIf rdUnsub.Checked Then
                UnSubscribeMe()
            Else
                Exit Sub
            End If
        End If
    End Sub

    Sub subscribeMe()
        Try
            System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12
            Dim ws As New com.hintsmeeting.Subscribe
            Dim email_address As Object = txtemailTerms.Text
            ws.SubscribeToNciHintsUsers(email_address)

            MultiView1.SetActiveView(VW_Subscribed)
        Catch ex As Exception
            Response.Redirect("~/problem.aspx")
        End Try
    End Sub

    Sub UnSubscribeMe()
        Try
            System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12
            Dim ws As New com.hintsmeeting.Subscribe
            Dim email_address As Object = txtemailTerms.Text
            ws.UNSubscribeToNciHintsUsers(email_address)

            MultiView1.SetActiveView(VW_UNSubscribed)
        Catch ex As Exception
            Response.Redirect("~/problem.aspx")
        End Try

    End Sub

End Class

Imports GenericHelper.GenericHelper
Imports Lyris.Lyris


Partial Class _usercontrols_terms
    Inherits System.Web.UI.UserControl



    Public strbody As String = ""


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        If Page.IsValid Then
            If Me.chkAcceptTerm_mod.Checked Then
                ' Cache.Insert("termsAccepted", "Accepted", Nothing, Cache.NoAbsoluteExpiration, TimeSpan.FromSeconds(20))
                Cache("termsAccepted") = "Accepted"
                Sendemail()
                Response.Redirect("~/data/download-data.aspx")
            Else
                'Cache.Insert("termsAccepted", "NOTAccepted", Nothing, Cache.NoAbsoluteExpiration, TimeSpan.FromSeconds(20))
                Cache("termsAccepted") = "NOTAccepted"
                Exit Sub
            End If
        End If
    End Sub

    Private Sub Sendemail()
        If Page.IsValid Then
            Try

                Dim HINTSMeeting_SubscribeService As New com.hintsmeeting.Subscribe
                Dim obj As Object = txtemailTermsService.Text

                HINTSMeeting_SubscribeService.SubscribeToNciHintsUsers(obj)



            Catch ex As Exception
                Response.Write("<h1>" & ex.ToString & "</h1>")
            End Try
        End If
    End Sub
End Class

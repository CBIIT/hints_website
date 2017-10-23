
Imports GenericHelper.GenericHelper

Partial Class articles_by_question
    Inherits System.Web.UI.Page




    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim strRedirectString = "/view-questions-topics/articles-by-question.aspx?red=1"

        If Test_RequestVar_IsPopulated(Request("PK_Question")) = True Then
            If Test_RequestVar_IsNumeric(Request("PK_Question")) = True Then
                strRedirectString &= "&PK_Question=" & Request.QueryString("PK_Question")
            End If
        End If


        If Test_RequestVar_IsPopulated(Request("ArtType")) = True Then
            If Test_RequestVar_IsNumeric(Request("ArtType")) = True Then
                strRedirectString &= "&ArtType=" & Request.QueryString("ArtType")
            End If
        End If


        Response.RedirectPermanent(strRedirectString)

    End Sub

End Class

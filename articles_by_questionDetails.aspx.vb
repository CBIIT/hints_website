
Imports GenericHelper.GenericHelper

Partial Class articles_by_questionDetails
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim strRedirectString = "/view-questions-topics/articles-by-question.aspx?red=1"

        If Test_RequestVar_IsPopulated(Request("PK_QuestionDetails")) = True Then
            If Test_RequestVar_IsNumeric(Request("PK_QuestionDetails")) = True Then
                strRedirectString &= "&PK_QuestionDetails=" & Request.QueryString("PK_QuestionDetails")
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


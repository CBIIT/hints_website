Imports GenericHelper.GenericHelper

Partial Class question_details
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim strRedirectString = "/view-questions-topics/question-details.aspx?red=1"

        If Test_RequestVar_IsPopulated(Request("qid")) = True Then
            If Test_RequestVar_IsNumeric(Request("qid")) = True Then
                strRedirectString &= "&qid=" & Request.QueryString("qid")
            End If
        End If


        If Test_RequestVar_IsPopulated(Request("PK_Cycle")) = True Then
            If Test_RequestVar_IsNumeric(Request("PK_Cycle")) = True Then
                strRedirectString &= "&PK_Cycle=" & Request.QueryString("PK_Cycle")
            End If
        End If


        Response.RedirectPermanent(strRedirectString)

    End Sub


End Class

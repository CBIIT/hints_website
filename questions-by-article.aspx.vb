
Imports GenericHelper.GenericHelper

Partial Class questions_by_article
    Inherits System.Web.UI.Page




    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load


        Dim strRedirectString = "/view-questions-topics/questions-by-article.aspx?red=1"

        If Test_RequestVar_IsPopulated(Request("PK_Article")) = True Then
            If Test_RequestVar_IsNumeric(Request("PK_Article")) = True Then
                strRedirectString &= "&PK_Article=" & Request.QueryString("PK_Article")
            End If
        End If




        Response.RedirectPermanent(strRedirectString)


    End Sub
End Class

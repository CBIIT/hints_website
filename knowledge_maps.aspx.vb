
Imports GenericHelper.GenericHelper

Partial Class knowledge_maps
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim strRedirectString = "/view-questions-topics/map_details.aspx?red=1"
        If Test_RequestVar_IsPopulated(Request("qdid")) = True Then
            If Test_RequestVar_IsNumeric(Request("qdid")) = True Then
                strRedirectString &= "&qdid=" & Request.QueryString("qdid")
            End If
        End If


        Response.RedirectPermanent(strRedirectString)


    End Sub
End Class

Imports System.Data
Imports System.Data.SqlClient
Imports GenericHelper.GenericHelper

Partial Class publications
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Test_RequestVar_IsPopulated(Server.HtmlEncode(Request.QueryString("tpc"))) = True Then
            Response.RedirectPermanent("/publications-reports/hints-publications.aspx?tpc=" & Server.HtmlEncode(Request.QueryString("tpc")))
        Else
            Response.RedirectPermanent("/publications-reports/hints-publications.aspx")
        End If
    End Sub

   
End Class


Imports System.Web
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO


Partial Class _Default
    Inherits System.Web.UI.Page

    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader
    Dim BriefTitle As String
    Dim link As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then


            Dim TermsUseCookie As HttpCookie = Request.Cookies("TermsAccepted")
            If TermsUseCookie Is Nothing Then
                Dim TempCookieToAdd As New HttpCookie("TermsAccepted")
                TempCookieToAdd.Value = "NOTAccepted"
                TempCookieToAdd.Expires = DateAndTime.Now.AddDays(7)
                Response.Cookies.Add(TempCookieToAdd)

                hints_access_data.HRef = "javascript:OpenModalRWB();"
                hints_access_data_NoJs.HRef = "~/data/download-data.aspx"
                hints_download_carousel.HRef = "~/data/download-data.aspx"
            Else
                If (Request.Cookies("TermsAccepted").Value IsNot Nothing) And Request.Cookies("TermsAccepted").Value = "Accepted" Then
                    hints_access_data.HRef = "~/data/download-data.aspx"
                    hints_access_data_NoJs.HRef = "~/data/download-data.aspx"
                    hints_download_carousel.HRef = "~/data/download-data.aspx"
                Else
                    hints_access_data.HRef = "javascript:OpenModalRWB();"
                    hints_access_data_NoJs.HRef = "~/data/download-data.aspx"
                    hints_download_carousel.HRef = "~/data/download-data.aspx"
                End If
            End If




            objConnect.Open()
            Cmd.CommandText = "List_TopBriefs"
            objDR = Cmd.ExecuteReader()

            RPTR_Briefs.DataSource = objDR
            RPTR_Briefs.DataBind()

            objDR.Close()
            Cmd.Parameters.Clear()

            objConnect.Close()

        End If
    End Sub

    Protected Function GetFileSize(ByVal File_Path As Object) As String

        Dim f As New FileInfo(Server.MapPath("~") & File_Path)
        Dim s1 As Long = (f.Length) / 1024

        Return s1 & " k"
    End Function

End Class

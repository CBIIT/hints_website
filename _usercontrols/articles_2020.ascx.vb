Imports System.Data
Imports System.Data.SqlClient

Partial Class _usercontrols_articles_2020
    Inherits System.Web.UI.UserControl


    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader
    Public previousYear As String
    Public blnDisplayYear As Boolean



    Public Sub BuildResults(ResultsDataview As DataView)
        If ResultsDataview.Table.Rows.Count > 0 Then

            Me.results_wrapper.Visible = True
            Me.PBResults.Visible = True
            Me.Noresult.Visible = False

        Else

            Me.results_wrapper.Visible = True
            Me.Noresult.Visible = True
            Me.PBResults.Visible = False

        End If

        RPTR_Pubs.DataSource = ResultsDataview
        RPTR_Pubs.DataBind()
    End Sub

    Public Function IsTypeBriefs(ByVal ArticleType As Object) As Boolean
        If ArticleType.ToString = 2 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function IsTypePubOrPres(ByVal ArticleType As Object) As Boolean
        If ArticleType.ToString = 2 Then
            Return False
        Else
            Return True
        End If
    End Function


    Protected Function CheckifURLAvailable(ByVal dtmtitle As Object, ByVal dtmurl As Object) As String
        Dim strtitle As String = ""

        If dtmurl Is DBNull.Value Then
            strtitle = dtmtitle.ToString
        Else
            strtitle = "<a href='" + dtmurl.ToString + "' target='_blank'>" + dtmtitle.ToString + "</a>"
        End If

        Return strtitle
    End Function



End Class

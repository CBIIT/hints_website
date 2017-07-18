Imports System.Data
Imports System.Data.SqlClient

Partial Class research
    Inherits System.Web.UI.Page



    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader
    Dim dtable As New DataTable
    Dim dview As DataView
    Dim dtable1 As New DataTable
    Dim dview1 As DataView

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Cmd.CommandType = CommandType.StoredProcedure
        If Not Page.IsPostBack Then
            objConnect.Open()
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "List_Articles_ByArticleType"
            Cmd.Parameters.Add("@FK_ArticleType", SqlDbType.NVarChar).Value = 1 ' 1 means article, 2 means brief
            objDR = Cmd.ExecuteReader()

            dtable.Load(objDR)
            dview = New DataView(dtable)

            UC_Articles.BuildResults(dview)
            UC_Articles.Visible = True

            objDR.Close()
            Cmd.Parameters.Clear()


            objConnect.Close()
        End If
    End Sub

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

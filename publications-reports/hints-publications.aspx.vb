Imports System.Data
Imports System.Data.SqlClient
Imports GenericHelper.GenericHelper

Partial Class publicationsfolder_hints_publications
    Inherits System.Web.UI.Page



    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader
    Dim dtable As New DataTable
    Dim dview As DataView
    Public previousYear As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            objConnect.Open()
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "List_All_Articles_ByArticleType"
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

End Class

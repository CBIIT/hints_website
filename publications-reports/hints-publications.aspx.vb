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

            ' Adding sections to dropdown list
            objConnect.Open()
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "List_Sections_Without_HINTS"
            objDR = Cmd.ExecuteReader()
            DDL_Section.DataSource = objDR
            DDL_Section.DataBind()
            objDR.Close()
            Cmd.Parameters.Clear()
            objConnect.Close()
            DDL_Section.Items.Insert(0, New ListItem("- Any -", "-1"))


            If Test_RequestVar_IsPopulated(Server.HtmlEncode(Request.QueryString("tpc"))) = True Then
                DDL_Section.SelectedValue = Server.HtmlEncode(Request.QueryString("tpc"))
            End If


            RunSearch()

        End If
    End Sub

    Protected Sub DDL_Section_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL_Section.SelectedIndexChanged
        RunSearch()
    End Sub

    Public Sub RunSearch()

        objConnect.Open()


        If DDL_Section.SelectedValue = "-1" Then
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "List_All_Articles_ByArticleType"
            Cmd.Parameters.Add("@FK_ArticleType", SqlDbType.NVarChar).Value = 1 ' 1 means article, 2 means brief
            objDR = Cmd.ExecuteReader()

            dtable.Load(objDR)
            dview = New DataView(dtable)

        Else

            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "List_PubsBySection" ' Temporary. This sproc needs to be reviewed
            Cmd.Parameters.Add("@FK_Section", SqlDbType.NVarChar).Value = DDL_Section.SelectedValue ' 1 means article, 2 means brief
            objDR = Cmd.ExecuteReader()

            dtable.Load(objDR)
            dview = New DataView(dtable)


        End If
        UC_Articles.BuildResults(dview)
        UC_Articles.Visible = True

        objDR.Close()
        Cmd.Parameters.Clear()
        objConnect.Close()
    End Sub


End Class

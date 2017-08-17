Imports System.Data
Imports System.Data.SqlClient
Imports GenericHelper.GenericHelper

Partial Class briefsDetails
    Inherits System.Web.UI.Page

    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim objDataAdapter As New SqlDataAdapter("", objConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader
    Dim BriefTitle As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            If Test_RequestVar_IsNumeric(Server.HtmlEncode(Request.QueryString("ID"))) = False Then
                Response.RedirectPermanent("~/default.aspx")
            Else
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.CommandText = "Get_Article"
                Cmd.Parameters.Add("@PK_Article", SqlDbType.Int).Value = Server.HtmlEncode(Request.QueryString("ID"))
                objConnect.Open()
                objDR = Cmd.ExecuteReader()
                Do While objDR.Read()
                    LIT_Title.Text = CheckNull(objDR("Title"))
                    BriefTitle = CheckNull(objDR("Title"))
                    BriefLink.HRef = CheckNull(objDR("LinkURL"))
                    LIT_Month.Text = CheckNull(objDR("PubMonth"))
                    LIT_Year.Text = CheckNull(objDR("PubYear"))
                    LIT_Content.Text = CheckNull(objDR("FullContent"))
                Loop
                objDR.Close()
                objConnect.Close()
                Cmd.Parameters.Clear()
            End If
        End If
        AddHandler SiteMap.SiteMapResolve, AddressOf Me.breadcrumbsbDHandler
    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        ' Removing the handler otherwise it will get called on other pages
        RemoveHandler SiteMap.SiteMapResolve, AddressOf breadcrumbsbDHandler
    End Sub

    Private Function breadcrumbsbDHandler(ByVal sender As Object, ByVal e As SiteMapResolveEventArgs) As SiteMapNode
        Dim currentNode As SiteMapNode = SiteMap.CurrentNode.Clone(True)
        Dim tempNode As SiteMapNode = currentNode

        tempNode.Url = "?ID=" & Server.HtmlEncode(Request.QueryString("ID"))
        BriefTitle = Regex.Replace(BriefTitle, "<.*?>", "")
        tempNode.Description = BriefTitle
        Return currentNode

    End Function

End Class

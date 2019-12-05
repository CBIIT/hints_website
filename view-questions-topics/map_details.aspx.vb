
Imports System.Data
Imports System.Data.SqlClient
Imports GenericHelper.GenericHelper

Partial Class questionsfolder_map_details
    Inherits System.Web.UI.Page

    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader
    Dim SectionName As String = ""
    Dim QuestionName As String = ""
    Dim FK_Question As Integer
    Dim sectionID As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not Page.IsPostBack Then
            If Test_RequestVar_IsNumeric(Server.HtmlEncode(Request.QueryString("qdid"))) = False Then
                Response.RedirectPermanent("~/default.aspx")
            Else
                FK_Question = 0
                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.CommandText = "[Get_Question_AND_Details_By_DetailsID]"
                Cmd.Parameters.Add("@PK_QuestionDetails", SqlDbType.Int).Value = Server.HtmlEncode(Request.QueryString("qdid"))
                objConnect.Open()
                objDR = Cmd.ExecuteReader()
                Do While objDR.Read()
                    LIT_Question.Text = CheckNull(objDR("Question"))
                    QuestionName = CheckNull(objDR("Question"))
                    FK_Question = CheckNull_Integer(objDR("FK_Question"))
                    lblMap.Src = "/_images/maps/" & CheckNull(objDR("KnowledgeMap1"))
                    lblMap.Alt = CheckNull(objDR("MapAltText"))

                    If CheckNull(objDR("KnowledgeMap2")) <> "" Then
                        lblDownloadMap.HRef = "/_images/maps/" & CheckNull(objDR("KnowledgeMap2"))
                    End If

                Loop
                objDR.Close()
                Cmd.Parameters.Clear()


                '''''Cmd.CommandText = "Get_Article_Count_ByQuestion"
                '''''Cmd.Parameters.Add("@FK_Question", SqlDbType.Int).Value = FK_Question
                '''''Cmd.Parameters.Add("@FK_ArticleType", SqlDbType.Int).Value = 1 ' 1 means article
                '''''If Cmd.ExecuteScalar() = 0 Then
                '''''    hyp_publink.Visible = False
                '''''Else
                '''''    hyp_publink.Visible = True
                '''''    hyp_publink.HRef = "/view-questions-topics/articles-by-question.aspx?PK_Question=" & FK_Question & "&ArtType=1"
                '''''End If
                '''''Cmd.Parameters.Clear()

                Cmd.CommandText = "Get_Article_Count_ByQuestion"
                Cmd.Parameters.Add("@FK_Question", SqlDbType.Int).Value = FK_Question
                Cmd.Parameters.Add("@FK_ArticleType", SqlDbType.Int).Value = 2 ' 2 means Brief
                If Cmd.ExecuteScalar() = 0 Then
                    hyp_brieflink.Visible = False
                Else
                    hyp_brieflink.Visible = True
                    hyp_brieflink.HRef = "/view-questions-topics/articles-by-question.aspx?PK_Question=" & FK_Question & "&ArtType=2"
                End If
                Cmd.Parameters.Clear()

                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.CommandText = "Get_Section_ByQuestion"
                Cmd.Parameters.Add("@FK_Question", SqlDbType.Int).Value = FK_Question
                SectionName = Cmd.ExecuteScalar()
                Cmd.Parameters.Clear()


                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.CommandText = "Get_SectionNumber_From_PK_QuestionDetails"
                Cmd.Parameters.Add("@pk_questiondetails", SqlDbType.Int).Value = Server.HtmlEncode(Request.QueryString("qdid"))
                sectionID = Cmd.ExecuteScalar()
                Cmd.Parameters.Clear()

                objConnect.Close()

            End If

        End If
        AddHandler SiteMap.SiteMapResolve, AddressOf Me.breadcrumbsKMHandler
    End Sub


    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        ' Removing the handler otherwise it will get called on other pages
        RemoveHandler SiteMap.SiteMapResolve, AddressOf breadcrumbsKMHandler
    End Sub

    Private Function breadcrumbsKMHandler(ByVal sender As Object, ByVal e As SiteMapResolveEventArgs) As SiteMapNode
        Dim currentNode As SiteMapNode = SiteMap.CurrentNode.Clone(True)
        Dim newNode1 As SiteMapNode
        Dim newNode2 As SiteMapNode
        Dim tempNode As SiteMapNode

        If sectionName.Length > 0 Then
            newNode1 = New SiteMapNode(SiteMap.Provider, "section", "~/advanced.aspx?tpc=" & sectionID)
            newNode1.ParentNode = currentNode.ParentNode
            newNode2 = New SiteMapNode(SiteMap.Provider, "question", "~/view-questions-topics/question-details.aspx?PK_Question=" & FK_Question)
            newNode2.ParentNode = newNode1
            currentNode.ParentNode = newNode2

            newNode1.Description = sectionName
            newNode2.Description = QuestionName
        End If

        tempNode = currentNode

        tempNode.Url = tempNode.Url & "?qdid=" & Request.QueryString("qdid")
        tempNode.Description = "View map"

        Return currentNode
    End Function

End Class


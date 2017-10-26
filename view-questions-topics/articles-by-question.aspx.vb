Imports System.Data
Imports System.Data.SqlClient
Imports GenericHelper.GenericHelper
Imports System.Web.UI.HtmlControls

Partial Class questionsfolder_articles_by_question
    Inherits System.Web.UI.Page


    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader
    Dim PK_Question As Integer = 0
    Dim ARticleType As String = "1"
    Dim sectionName As String = ""
    Dim QuestionID As Integer
    Dim sectionID As Integer
    Dim QuestionName As String = ""
    Dim QuestionDetailID As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Test_RequestVar_IsNumeric(Server.HtmlEncode(Request.QueryString("PK_Question"))) = False Then
            Response.RedirectPermanent("/problem.aspx", False)
        Else
            QuestionID = Server.HtmlEncode(Request.QueryString("PK_Question"))
        End If

        Cmd.CommandType = CommandType.StoredProcedure

        If Not Page.IsPostBack Then
            ARticleType = "1"

            If Test_RequestVar_IsNumeric(Server.HtmlEncode(Request.QueryString("ArtType"))) = False Then
                Response.RedirectPermanent("~/default.aspx")
            Else
                ARticleType = Server.HtmlEncode(Request.QueryString("ArtType"))
            End If
            If Test_RequestVar_IsNumeric(Server.HtmlEncode(Request.QueryString("PK_Question"))) = False Then
                Response.RedirectPermanent("~/default.aspx")
            Else
                Cmd.CommandText = "Get_Question"
                Cmd.Parameters.Add("@PK_Question", SqlDbType.Int).Value = Server.HtmlEncode(Request.QueryString("PK_Question"))
                objConnect.Open()
                objDR = Cmd.ExecuteReader()
                Do While objDR.Read()
                    LIT_Question.Text = CheckNull(objDR("Question"))
                    QuestionName = CheckNull(objDR("Question"))
                    hyp_Question.HRef = "/view-questions-topics/question-details.aspx?qid=" & objDR("PK_Question")


                    Dim STR_TitleQuestion As String = ""
                    STR_TitleQuestion = objDR("Question")

                    Page.Title = STR_TitleQuestion & " | HINTS"

                    Dim metaTag1 As HtmlMeta = New HtmlMeta
                    metaTag1.Name = "Description"
                    metaTag1.Content = STR_TitleQuestion & " | HINTS"
                    Page.Header.Controls.Add(metaTag1)

                    Dim metaTag2 As HtmlMeta = New HtmlMeta
                    metaTag2.Name = "Title"
                    metaTag2.Content = STR_TitleQuestion & " | HINTS"
                    Page.Header.Controls.Add(metaTag2)

                Loop
                objDR.Close()
                Cmd.Parameters.Clear()

                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.CommandText = "List_Articles_ByQuestion"
                Cmd.Parameters.Add("@FK_Question", SqlDbType.NVarChar).Value = Server.HtmlEncode(Request.QueryString("PK_Question"))
                Cmd.Parameters.Add("@FK_ArticleType", SqlDbType.NVarChar).Value = ARticleType ' 1 means article, 2 means brief
                objDR = Cmd.ExecuteReader()
                RPTR_Pubs.DataSource = objDR
                RPTR_Pubs.DataBind()
                objDR.Close()
                Cmd.Parameters.Clear()


                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.CommandText = "Get_QuestionDetails_From_QuestionID"
                Cmd.Parameters.Add("@FK_Question", SqlDbType.Int).Value = QuestionID
                objDR = Cmd.ExecuteReader(CommandBehavior.SingleRow)
                objDR.Read()
                If (objDR.HasRows) Then
                    QuestionDetailID = CheckNull(objDR("PK_QuestionDetails"))
                End If
                objDR.Close()
                Cmd.Parameters.Clear()

                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.CommandText = "Get_Section_ByQuestion"
                Cmd.Parameters.Add("@FK_Question", SqlDbType.Int).Value = QuestionID
                sectionName = Cmd.ExecuteScalar()
                Cmd.Parameters.Clear()

                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.CommandText = "Get_SectionNumber_From_PK_QuestionDetails"
                Cmd.Parameters.Add("@pk_questiondetails", SqlDbType.Int).Value = QuestionDetailID
                sectionID = Cmd.ExecuteScalar()
                Cmd.Parameters.Clear()

                objConnect.Close()

            End If
        End If

        AddHandler SiteMap.SiteMapResolve, AddressOf Me.breadcrumbsAQHandler
    End Sub

    Protected Function CheckifURLAvailable(ByVal dtmtitle As Object, ByVal dtmurl As Object) As String
        Dim strtitle As String = ""



        If dtmurl Is DBNull.Value Then
            strtitle = dtmtitle.ToString
        Else
            Dim strURL = dtmurl.ToString
            'Response.Write(strURL.IndexOf("doc"))
            If strURL.IndexOf("doc") = 0 Then
                strURL = "/" & strURL
            End If

            strtitle = "<a href='" + strURL + "' target='_blank'>" + dtmtitle.ToString + "</a>"
        End If

        Return strtitle
    End Function

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        ' Removing the handler otherwise it will get called on other pages
        RemoveHandler SiteMap.SiteMapResolve, AddressOf breadcrumbsAQHandler
    End Sub

    Private Function breadcrumbsAQHandler(ByVal sender As Object, ByVal e As SiteMapResolveEventArgs) As SiteMapNode
        Dim currentNode As SiteMapNode = SiteMap.CurrentNode.Clone(True)
        Dim newNode1 As SiteMapNode
        Dim newNode2 As SiteMapNode
        Dim tempNode As SiteMapNode

        If sectionName.Length > 0 Then
            newNode1 = New SiteMapNode(SiteMap.Provider, "section", "~/advanced.aspx?tpc=" & sectionID)
            newNode1.ParentNode = currentNode.ParentNode
            newNode2 = New SiteMapNode(SiteMap.Provider, "question", "~//view-questions-topics/question-details.aspx?qid=" & QuestionID)
            newNode2.ParentNode = newNode1
            currentNode.ParentNode = newNode2

            newNode1.Description = sectionName
            newNode2.Description = QuestionName
        End If

        tempNode = currentNode

        tempNode.Url = tempNode.Url & "?PK_Question=" & Request.QueryString("PK_Question")
        tempNode.Url = tempNode.Url & "&ArtType=" & ARticleType
        tempNode.Description = "Published Articles that use this HINTS Question"

        Return currentNode
    End Function


    Protected Function CheckImageURL(LinkURL As Object, ID As Integer) As String
        If IsDBNull(LinkURL) Then
            ' there should be no briefs (ArticleType=2) without a URL
            Return ""
        Else
            Return "~/" & LinkURL.ToString
        End If
    End Function

    Public Function IsTypeBriefs(ByVal ArticleType As Object) As Boolean
        If ArticleType.ToString = 2 Then
            Return True
        Else
            Return False
        End If
    End Function

End Class


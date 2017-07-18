Imports System.Data
Imports System.Data.SqlClient
Imports GenericHelper.GenericHelper

Partial Class articles_by_questionDetails
    Inherits System.Web.UI.Page


    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader
    Dim PK_Question As Integer = 0
    Dim ARticleType As String = "1"
    Dim sectionName As String = ""
    Dim PK_QuestionDetails As Integer
    Dim sectionID As Integer
    Dim QuestionName As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        If Test_RequestVar_IsNumeric(Server.HtmlEncode(Request.QueryString("PK_QuestionDetails"))) = False Then
            Response.Redirect("/problem.aspx", False)
        Else
            PK_QuestionDetails = Server.HtmlEncode(Request.QueryString("PK_QuestionDetails"))
        End If

        Cmd.CommandType = CommandType.StoredProcedure


        If Not Page.IsPostBack Then
            ARticleType = "1"

            If Test_RequestVar_IsNumeric(Server.HtmlEncode(Request.QueryString("ArtType"))) = False Then
                Response.Redirect("~/default.aspx")
            Else
                ARticleType = Server.HtmlEncode(Request.QueryString("ArtType"))
            End If
            If Test_RequestVar_IsNumeric(Server.HtmlEncode(Request.QueryString("PK_QuestionDetails"))) = False Then
                Response.Redirect("~/default.aspx")
            Else
                Cmd.CommandText = "Get_Question_AND_Details_By_DetailsID"
                Cmd.Parameters.Add("@PK_QuestionDetails", SqlDbType.Int).Value = Server.HtmlEncode(Request.QueryString("PK_QuestionDetails"))
                objConnect.Open()
                objDR = Cmd.ExecuteReader()
                Do While objDR.Read()
                    LIT_Question.Text = CheckNull(objDR("Question"))
                    QuestionName = CheckNull(objDR("Question"))
                    hyp_Question.HRef = "question-details.aspx?PK_Question=" & objDR("PK_Question")
                    PK_Question = objDR("PK_Question")
                Loop
                objDR.Close()
                Cmd.Parameters.Clear()

                Cmd.CommandType = CommandType.StoredProcedure
                'Cmd.CommandText = "List_Articles_ByQuestionDetails"
                'Cmd.Parameters.Add("@PK_QuestionDetails", SqlDbType.NVarChar).Value = Server.HtmlEncode(Request.QueryString("PK_QuestionDetails"))
                'Cmd.Parameters.Add("@FK_ArticleType", SqlDbType.NVarChar).Value = ARticleType ' 1 means article, 2 means brief

                Cmd.CommandText = "List_Articles_ByQuestion"
                Cmd.Parameters.Add("@FK_Question", SqlDbType.Int).Value = PK_Question
                Cmd.Parameters.Add("@FK_ArticleType", SqlDbType.Int).Value = ARticleType ' 1 means article, 2 means brief


                objDR = Cmd.ExecuteReader()
                RPTR_Pubs.DataSource = objDR
                RPTR_Pubs.DataBind()
                objDR.Close()
                Cmd.Parameters.Clear()

                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.CommandText = "Get_Section_ByQuestion"
                Cmd.Parameters.Add("@FK_Question", SqlDbType.Int).Value = PK_Question
                sectionName = Cmd.ExecuteScalar()
                Cmd.Parameters.Clear()


                Cmd.CommandType = CommandType.StoredProcedure
                Cmd.CommandText = "Get_SectionNumber_From_PK_QuestionDetails"
                Cmd.Parameters.Add("@pk_questiondetails", SqlDbType.Int).Value = Server.HtmlEncode(Request.QueryString("PK_QuestionDetails"))
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
            strtitle = "<a href='" + dtmurl.ToString + "' target='_balnk'>" + dtmtitle.ToString + "</a>"
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
            newNode2 = New SiteMapNode(SiteMap.Provider, "question", "~/question-details.aspx?PK_Question=" & PK_Question)
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
            Return "~/briefsDetails.aspx?ID=" & ID
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


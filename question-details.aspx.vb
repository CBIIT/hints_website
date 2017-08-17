Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports GenericHelper.GenericHelper

Partial Class question_details
    Inherits System.Web.UI.Page

    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim objDataAdapter As New SqlDataAdapter("", objConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader
    Dim objDataSet As New DataSet
    Dim objDataView As DataView



    Dim Cmd1 As New SqlCommand("", objConnect)
    Dim objDR1 As SqlDataReader

    Dim QuestionID As Integer = 0
    Dim CurrentCycleDisplaying As Integer = 0

    Dim BLNFirst As Boolean


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load


        If Not Page.IsPostBack Then


            objConnect.Open()
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "List_Sections"
            objDR = Cmd.ExecuteReader()
            DDL_Sections.DataSource = objDR
            DDL_Sections.DataBind()
            objDR.Close()
            Cmd.Parameters.Clear()
            objConnect.Close()


            Dim BadId_NeedsToRedirect As Boolean = True

            If Test_RequestVar_IsPopulated(Request("qid")) = True Then
                If Test_RequestVar_IsNumeric(Request("qid")) = True Then
                    Cmd.CommandType = CommandType.StoredProcedure
                    Cmd.CommandText = "[Get_Question]"
                    Cmd.Parameters.Add("@PK_Question", SqlDbType.Int).Value = Request("qid")
                    objConnect.Open()
                    objDR = Cmd.ExecuteReader()
                    Do While objDR.Read()
                        BadId_NeedsToRedirect = False
                    Loop
                    objDR.Close()
                    objConnect.Close()
                    Cmd.Parameters.Clear()

                    QuestionID = Server.HtmlEncode(Request.QueryString("qid"))
                    'PreSelectDDL(DDL_Questions, Request("qid"))
                Else
                    Response.RedirectPermanent("/Default.aspx")
                End If
            End If

            If BadId_NeedsToRedirect = True Then
                Response.RedirectPermanent("/Default.aspx")
            End If



            CurrentCycleDisplaying = 0
            If Test_RequestVar_IsPopulated(Request("PK_Cycle")) = True Then
                If Test_RequestVar_IsNumeric(Request("PK_Cycle")) = True Then
                    Dim cnt As Integer
                    Cmd.CommandType = CommandType.StoredProcedure
                    objConnect.Open()
                    Cmd.CommandText = "Test_GoodCycle_And_Question"
                    Cmd.Parameters.Add("@FK_Question", SqlDbType.Int).Value = QuestionID
                    Cmd.Parameters.Add("@FK_Cycle", SqlDbType.Int).Value = Server.HtmlEncode(Request.QueryString("PK_Cycle"))
                    cnt = Cmd.ExecuteScalar()
                    Cmd.Parameters.Clear()
                    objConnect.Close()

                    If cnt = 0 Then
                        Response.RedirectPermanent("/Default.aspx")
                    Else
                        CurrentCycleDisplaying = Server.HtmlEncode(Request.QueryString("PK_Cycle"))
                    End If
                Else
                    Response.RedirectPermanent("/Default.aspx")
                End If
            End If

            If BadId_NeedsToRedirect = True Then
                Response.RedirectPermanent("/Default.aspx")
            End If

            'QuestionID = Server.HtmlEncode(Request.QueryString("qid")) ' Used for displaying breadcrumbs
            ViewState("QuestionID") = QuestionID



            objConnect.Open()

            ' Preselect the Section
            Dim TempSection As String = ""
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "Get_SectionID_ByQuestion"
            Cmd.Parameters.Add("@FK_Question", SqlDbType.Int).Value = QuestionID
            TempSection = CheckNull(Cmd.ExecuteScalar())
            Cmd.Parameters.Clear()
            PreSelectDDL(DDL_Sections, TempSection)
            ' Preselect the Section

            'Build Question DDL
            'Cmd.CommandType = CommandType.StoredProcedure
            'Cmd.CommandText = "[ListQuestions_By_FK_Section]"
            'Cmd.Parameters.Add("@FK_Section", SqlDbType.Int).Value = TempSection
            'objDR = Cmd.ExecuteReader()
            'DDL_Questions.DataSource = objDR
            'DDL_Questions.DataBind()
            'objDR.Close()
            'Cmd.Parameters.Clear()

            'PreSelectDDL(DDL_Questions, QuestionID)


            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "[Get_Question]"
            Cmd.Parameters.Add("@PK_Question", SqlDbType.Int).Value = ViewState("QuestionID")
            objDR = Cmd.ExecuteReader()
            Do While objDR.Read()
                LIT_QuestionText.Text = CheckNull(objDR("Question"))
                If IsDBNull(objDR("trendsnote")) Then
                    LIT_trendNotes.Text = "none"
                Else
                    LIT_trendNotes.Text = CheckNull(objDR("trendsnote"))
                End If

            Loop
            objDR.Close()
            Cmd.Parameters.Clear()


            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "List_Cycles_ForQuestion"
            Cmd.Parameters.Add("@FK_Question", SqlDbType.Int).Value = ViewState("QuestionID")
            objDR = Cmd.ExecuteReader()
            RPTR_CycleButtons.DataSource = objDR
            RPTR_CycleButtons.DataBind()
            objDR.Close()
            Cmd.Parameters.Clear()


            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "List_Articles_ByQuestion"
            Cmd.Parameters.Add("@FK_Question", SqlDbType.Int).Value = ViewState("QuestionID")
            Cmd.Parameters.Add("@FK_ArticleType", SqlDbType.Int).Value = 2 ' @typeid = 2 means brief

            If Cmd.ExecuteScalar() > 0 Then
                LIT_AllNoBriefs.Visible = False
                HYP_Briefs_ByAllQuestion.Visible = True
                HYP_Briefs_ByAllQuestion.NavigateUrl = "~/articles-by-question.aspx?ArtType=2&PK_Question=" & QuestionID
            Else
                HYP_Briefs_ByAllQuestion.Visible = False
                LIT_AllNoBriefs.Visible = True
            End If
            Cmd.Parameters.Clear()

            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "List_Articles_ByQuestion"
            Cmd.Parameters.Add("@FK_Question", SqlDbType.Int).Value = ViewState("QuestionID")
            Cmd.Parameters.Add("@FK_ArticleType", SqlDbType.Int).Value = 1 ' @typeid = 1 means articles
            If Cmd.ExecuteScalar() > 0 Then
                LIT_AllNoArticles.Visible = False
                HYP_articles_ByAllQuestion.Visible = True
                HYP_articles_ByAllQuestion.NavigateUrl = "~/articles-by-question.aspx?ArtType=1&PK_Question=" & ViewState("QuestionID")
            Else
                LIT_AllNoArticles.Visible = True
                HYP_articles_ByAllQuestion.Visible = False

            End If

            objDR.Close()
            Cmd.Parameters.Clear()


            Dim totalColumns As Integer = 0

            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "Get_Cycle_Count"
            totalColumns = CInt(Cmd.ExecuteScalar()) + 1
            Cmd.Parameters.Clear()

            Dim mainPercent As Integer = 100 / totalColumns
            LIT_BottomTableLeftColumnWidth.Text = mainPercent + 1



            Dim objDataSetTemp As New DataTable

            objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure
            objDataAdapter.SelectCommand.CommandText = "Get_Question_AND_Details_By_FK_Question"
            objDataAdapter.SelectCommand.Parameters.Add("@FK_Question", SqlDbType.NVarChar).Value = ViewState("QuestionID")
            objDataAdapter.Fill(objDataSetTemp)
            objDataAdapter.SelectCommand.Parameters.Clear()

            RPTR_AllDetails_BottomTable_Cycles.DataSource = objDataSetTemp
            RPTR_AllDetails_BottomTable_Cycles.DataBind()

            RPTR_AllDetails_BottomTable_Questions.DataSource = objDataSetTemp
            RPTR_AllDetails_BottomTable_Questions.DataBind()

            RPTR_AllDetails_BottomTable_QuestionSource.DataSource = objDataSetTemp
            RPTR_AllDetails_BottomTable_QuestionSource.DataBind()

            objConnect.Close()

            ' above is for table stuff
        End If
    End Sub


    Function CheckActive(pk_Cycle As String) As String
        If pk_Cycle = CurrentCycleDisplaying Then
            Return "active-year"
        Else
            Return ""
        End If
    End Function


    Protected Sub RPTR_All_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles RPTR_All.ItemDataBound

        If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then

            If IsDBNull(e.Item.DataItem("PK_QuestionDetails")) Then
                Exit Sub
            Else

                Dim QuestionDetailsID As Integer = e.Item.DataItem("PK_QuestionDetails")

                Dim RPTR_AllCriteria As New Repeater
                RPTR_AllCriteria = DirectCast(e.Item.FindControl("RPTR_AllCriteria"), Repeater)

                BLNFirst = True

                Cmd1.CommandType = CommandType.StoredProcedure
                Cmd1.CommandText = "List_Criteria_By_PK_QuestionDetails"
                Cmd1.Parameters.Add("@FK_QuestionDetails", SqlDbType.Int).Value = QuestionDetailsID
                objDR1 = Cmd1.ExecuteReader()
                RPTR_AllCriteria.DataSource = objDR1
                RPTR_AllCriteria.DataBind()
                objDR1.Close()
                Cmd1.Parameters.Clear()


            End If
        End If

    End Sub

    Function GetComma(tmpSTR As String) As String
        If BLNFirst = True Then
            BLNFirst = False
            Return tmpSTR
        Else
            Return ", " & tmpSTR
        End If
    End Function

    Function SetQuestionTextAllYears(Question_Num As Object, Question As Object) As String
        If IsDBNull(Question_Num) Then
            Return "Not Asked"
        Else
            Return "[" & Question_Num.ToString & "] " & Question.ToString
        End If
    End Function

    Function setCycleURL(FK_Question As Object, PK_Cycle As Integer, CycleDisplayName As String, DisplayYear As String) As String
        If IsDBNull(FK_Question) Then
            Return CycleDisplayName & "(" & DisplayYear & ")"
        End If
        Return "<a href='question-details.aspx?PK_Cycle=" & PK_Cycle & "&qid=" & FK_Question & "'>" & CycleDisplayName & "(" & DisplayYear & ")</a>"

    End Function

    Function Get_BottomTableRemainingColumnsWidth() As String
        Return (CInt(LIT_BottomTableLeftColumnWidth.Text) - 1).ToString
    End Function

End Class

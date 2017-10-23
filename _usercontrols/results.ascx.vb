Imports System.Data
Imports System.Data.SqlClient
Imports GenericHelper.GenericHelper
Imports CacheData.CacheData

Partial Class _usercontrols_results
    Inherits System.Web.UI.UserControl

    '********************************************************************
    '********************************************************************
    '********************************************************************
    ' must include the following field in the dataview passed in to the 
    ' BuildResults sub
    'FK_Section
    'SectionName
    'PK_Question
    'TotalArticles
    'TotalBriefs
    '********************************************************************
    '********************************************************************
    '********************************************************************

    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim objDataAdapter As New SqlDataAdapter("", objConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader
    Dim objDataSet As New System.Data.DataSet
    Dim objDataView As DataView
    Dim strPrevSection As Integer

    Dim strPrevQuestionID As Integer

    Dim objDataSetinner As New System.Data.DataSet
    Dim obj_AllCycles_DataView As DataView

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load


        If Not Page.IsPostBack Then


            objConnect.Open()
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "List_Cycles"
            objDR = Cmd.ExecuteReader()
            RPTR_CyclesLegend.DataSource = objDR
            RPTR_CyclesLegend.DataBind()
            objDR.Close()
            Cmd.Parameters.Clear()
            objConnect.Close()
        End If
    End Sub

    Public Sub BuildResults(ResultsDataview As DataView)

        strPrevSection = 0
        RPTR_Results.DataSource = ResultsDataview
        RPTR_Results.DataBind()

        LIT_Count.Text = RPTR_Results.Items.Count
        PLC_results.Visible = True

        If LIT_Count.Text = "0" Then
            PLC_Legend.Visible = False
        Else
            PLC_Legend.Visible = True
        End If

    End Sub

    Function ShowHideClass(intCount As Object) As String
        If CheckNull_Integer(intCount) = 0 Then
            Return "noshow"
        Else
            Return "yesshow"
        End If
    End Function

    Function LoopCyclesPerQuestion(PK_Question As Integer) As DataView
        objDataSetinner = Get_Cached_AllCyclesForQuestion()
        obj_AllCycles_DataView = objDataSetinner.Tables(0).DefaultView
        obj_AllCycles_DataView.RowFilter = " FK_Question =" & PK_Question
        Return obj_AllCycles_DataView
    End Function

    Function GetBriefsArticles(FK_Question As Integer, FK_ArticleType As Integer) As DataView
        objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure
        objDataAdapter.SelectCommand.CommandText = "List_Articles_ByQuestion"
        objDataAdapter.SelectCommand.Parameters.Add("@FK_Question", SqlDbType.Int).Value = FK_Question
        objDataAdapter.SelectCommand.Parameters.Add("@FK_ArticleType", SqlDbType.Int).Value = FK_ArticleType
        ' @typeid = 2 means brief

        Dim objDataSetinner As New System.Data.DataSet
        objDataAdapter.Fill(objDataSetinner, "newbrieflisting")
        objConnect.Close()
        objDataAdapter.SelectCommand.Parameters.Clear()
        Return objDataSetinner.Tables("newbrieflisting").DefaultView

    End Function

    Function CheckVisHeader(FK_Section As Integer) As Boolean
        If strPrevSection = FK_Section Then
            Return False
        Else
            strPrevSection = FK_Section
            Return True
        End If
    End Function



    Function getColorCSS(tmpObject As Object) As String
        If CheckNull(tmpObject) = "" Then
            Return "graycyle"
        Else
            Return "greencyle"
        End If
    End Function

    Function getColorCSSwide(tmpObject As Object) As String
        If CheckNull(tmpObject) = "" Then
            Return "graycylewide"
        Else
            Return "greencylewide"
        End If
    End Function

    Function getURL(PK_QuestionDetails As Object, FK_Question As Object, PK_Cycle As String) As String
        If CheckNull(PK_QuestionDetails) <> "" Then
            Return "/view-questions-topics/question-details.aspx?PK_Cycle=" & PK_Cycle & "&qid=" & FK_Question
        Else
            Return "javascript:void(0)"
        End If
    End Function


    Function Get_Cached_AllCyclesForQuestion() As DataSet
        Dim TempContextDS As DataSet
        If Cache("CachedDS_AllCyclesForQuestions") Is Nothing Then
            Cache("CachedDS_AllCyclesForQuestions") = GetDatasetFor_CachedDS_AllCyclesForQuestions()
            TempContextDS = Cache("CachedDS_AllCyclesForQuestions")
        Else
            TempContextDS = Cache("CachedDS_AllCyclesForQuestions")
        End If
        Return TempContextDS
    End Function

    Function SetURLForArticles(FK_Question As String, PK_ArticleType As Integer) As String
        Return "~/view-questions-topics/articles-by-question.aspx?PK_Question=" & Server.UrlEncode(FK_Question) & "&ArtType=" & PK_ArticleType
    End Function

    Function CheckAllYearsVis(TotalIncludeCount As Integer) As Boolean

        'Check to make sure there are results that are set to "include in chart" before adding All Years.
        '6/30/2015, it was decided to suppress certain qeustions from showing all years. This is being 
        'done by setting Include in chart to false for all question_details for that question
        If TotalIncludeCount > 1 Then
            'if there is zero or 1, do not show all years
            Return True
        Else
            Return False
        End If
    End Function
End Class

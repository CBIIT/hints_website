
Imports System.Data
Imports System.Data.SqlClient


Imports GenericHelper.GenericHelper
Imports CacheData.CacheData
Partial Class _getCache_resetcache
    Inherits System.Web.UI.Page



    'Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    'Dim objConnect As New SqlConnection(strConnect)
    'Dim objDataAdapter As New SqlDataAdapter("", objConnect)
    'Dim Cmd As New SqlCommand("", objConnect)
    'Dim objDR As SqlDataReader
    'Dim objDataSet As New System.Data.DataSet
    'Dim objDataView As DataView
    'Dim strPrevSection As Integer
    'Dim strPrevQuestionID As Integer

    'Dim objDataSetinner As New System.Data.DataSet
    'Dim obj_AllCycles_DataView As DataView

    Dim TempContextDS As New DataSet()

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Cache("CachedDS_AllCyclesForQuestions") Is Nothing Then
            Response.Write("<h1>Loading Cache</h1>")
            Cache("CachedDS_AllCyclesForQuestions") = GetDatasetFor_CachedDS_AllCyclesForQuestions()
            TempContextDS = Cache("CachedDS_AllCyclesForQuestions")
        Else
            Response.Write("<h1>Cache already Loaded</h1>")
            TempContextDS = Cache("CachedDS_AllCyclesForQuestions")
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Cache.Remove("CachedDS_AllCyclesForQuestions")
        Dim TempContextDS As DataSet
        If Cache("CachedDS_AllCyclesForQuestions") Is Nothing Then
            Response.Write("<h1>ReLoading Cache</h1>")
            Cache("CachedDS_AllCyclesForQuestions") = GetDatasetFor_CachedDS_AllCyclesForQuestions()
            TempContextDS = Cache("CachedDS_AllCyclesForQuestions")
        Else
            TempContextDS = Cache("CachedDS_AllCyclesForQuestions")
        End If
    End Sub
End Class

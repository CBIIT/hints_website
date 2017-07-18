Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports Newtonsoft.Json
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient

<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class QuestionDataService
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function Get_Question_AND_Details_By_Question(FK_Question As Integer) As String
        Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
        Dim objConnect As New SqlConnection(strConnect)
        Dim Cmd As New SqlCommand("", objConnect)
        Dim objDataAdapter As New SqlDataAdapter("", objConnect)
        Dim objDataSet As New DataSet()
        Dim objDataTable As DataTable



        objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure
        objDataAdapter.SelectCommand.CommandText = "Jquery_Get_Question_AND_Details_By_Question"
        objDataAdapter.SelectCommand.Parameters.Add("@FK_Question", SqlDbType.Int).Value = FK_Question
        objDataAdapter.Fill(objDataSet, "details_ds")
        objDataTable = objDataSet.Tables("details_ds")
        objConnect.Close()
        objDataAdapter.SelectCommand.Parameters.Clear()

        Return JsonConvert.SerializeObject(objDataTable)
    End Function

    <WebMethod()> _
    Public Function Get_Results_PerQuestion(FK_Question As Integer) As String
        Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
        Dim objConnect As New SqlConnection(strConnect)
        Dim Cmd As New SqlCommand("", objConnect)
        Dim objDataAdapter As New SqlDataAdapter("", objConnect)
        Dim objDataSet As New DataSet()
        Dim objDataTable As DataTable



        objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure
        objDataAdapter.SelectCommand.CommandText = "Jquery_List_Results_By_QID_SkipInvalidResponses"
        objDataAdapter.SelectCommand.Parameters.Add("@FK_Question", SqlDbType.Int).Value = FK_Question
        objDataAdapter.Fill(objDataSet, "results_ds")
        objDataTable = objDataSet.Tables("results_ds")
        objConnect.Close()
        objDataAdapter.SelectCommand.Parameters.Clear()

        Return JsonConvert.SerializeObject(objDataTable)
    End Function


    <WebMethod()> _
    Public Function List_Criteria_PerQuestion(FK_Question As Integer) As String
        Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
        Dim objConnect As New SqlConnection(strConnect)
        Dim Cmd As New SqlCommand("", objConnect)
        Dim objDataAdapter As New SqlDataAdapter("", objConnect)
        Dim objDataSet As New DataSet()
        Dim objDataTable As DataTable



        objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure
        objDataAdapter.SelectCommand.CommandText = "Jquery_List_Criteria_By_PK_QuestionDetails"
        objDataAdapter.SelectCommand.Parameters.Add("@FK_Question", SqlDbType.Int).Value = FK_Question
        objDataAdapter.Fill(objDataSet, "Criteria_ds")
        objDataTable = objDataSet.Tables("Criteria_ds")
        objConnect.Close()
        objDataAdapter.SelectCommand.Parameters.Clear()

        Return JsonConvert.SerializeObject(objDataTable)
    End Function





    <WebMethod()> _
    Public Function List_All_QuestionsAndSections() As String
        Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
        Dim objConnect As New SqlConnection(strConnect)
        Dim Cmd As New SqlCommand("", objConnect)
        Dim objDataAdapter As New SqlDataAdapter("", objConnect)
        Dim objDataSet As New DataSet()
        Dim objDataTable As DataTable



        objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure
        objDataAdapter.SelectCommand.CommandText = "List_All_QuestionsAndSections"
        objDataAdapter.Fill(objDataSet, "QuestionsAndSections_ds")
        objDataTable = objDataSet.Tables("QuestionsAndSections_ds")
        objConnect.Close()
        objDataAdapter.SelectCommand.Parameters.Clear()

        Return JsonConvert.SerializeObject(objDataTable)
    End Function

    '<WebMethod()> _
    'Public Function List_DataCollectionMethods_ByQuestion_Cycle(FK_Question As Integer, FK_Cycle As Integer) As String
    '    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    '    Dim objConnect As New SqlConnection(strConnect)
    '    Dim Cmd As New SqlCommand("", objConnect)
    '    Dim objDataAdapter As New SqlDataAdapter("", objConnect)
    '    Dim objDataSet As New DataSet()
    '    Dim objDataTable As DataTable



    '    objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure
    '    objDataAdapter.SelectCommand.CommandText = "List_DataCollectionMethods_ByQuestion_Cycle"
    '    objDataAdapter.SelectCommand.Parameters.Add("@FK_Question", SqlDbType.Int).Value = FK_Question
    '    objDataAdapter.SelectCommand.Parameters.Add("@FK_Cycle", SqlDbType.Int).Value = FK_Cycle
    '    objDataAdapter.Fill(objDataSet, "DC_methods_ds")
    '    objDataTable = objDataSet.Tables("DC_methods_ds")
    '    objConnect.Close()
    '    objDataAdapter.SelectCommand.Parameters.Clear()

    '    Return JsonConvert.SerializeObject(objDataTable)
    'End Function

End Class
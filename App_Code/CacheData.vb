
Imports System.Web
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports Microsoft.VisualBasic


Namespace CacheData

    Public Class CacheData


        Public Shared Function GetDatasetFor_CachedDS_AllCyclesForQuestions() As DataSet
            Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
            Dim objConnect As New SqlConnection(strConnect)
            Dim objDataAdapter As New SqlDataAdapter("", objConnect)
            Dim objDataSet As New System.Data.DataSet

            objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure
            objDataAdapter.SelectCommand.CommandText = "Cache_ListAllCyclesForQuestions"
            objDataAdapter.Fill(objDataSet, "NewCycleListAllPerQuestions")
            objConnect.Close()


            Return objDataSet
        End Function
    End Class
End Namespace

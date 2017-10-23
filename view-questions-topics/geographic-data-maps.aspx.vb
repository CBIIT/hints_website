Imports System.Data
Imports System.Data.SqlClient
Imports GenericHelper.GenericHelper

Partial Class questionsfolder_geographic_data_maps
    Inherits System.Web.UI.Page
    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then


            objConnect.Open()
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "List_KnowledgeMaps"
            objDR = Cmd.ExecuteReader()
            DL_AllMaps.DataSource = objDR
            DL_AllMaps.DataBind()
            objDR.Close()
            Cmd.Parameters.Clear()
            objConnect.Close()


        End If
    End Sub
End Class

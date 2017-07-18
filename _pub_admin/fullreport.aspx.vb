Imports System.Data
Imports System.Data.SqlClient

Partial Class _pub_admin_fullreport
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Response.AddHeader("Content-Disposition", "attachment; filename=Inform_Us_Full_Report.xls")

        Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
        Dim objConnect As New SqlConnection(strConnect)
        Dim objDataAdapter As New SqlDataAdapter("", objConnect)
        Dim Cmd As New SqlCommand("", objConnect)
        Dim objDataSet As New dataset()
        Dim objDR As SqlDataReader



        objConnect.Open()
        Cmd.CommandType = CommandType.StoredProcedure
        Cmd.CommandText = "List_InformUsForm_FullReport"
        objDR = Cmd.ExecuteReader()
        RPTR.DataSource = objDR
        RPTR.DataBind()
        objDR.Close()
        Cmd.Parameters.Clear()
        objConnect.Close()
    End Sub

    Function CheckVis(objfilename As Object) As Boolean
        If CheckNull(objfilename) = "" Then
            Return False
        Else
            Return True
        End If
    End Function



    Function CheckNull(TmpStr As Object) As String
        If TypeOf (TmpStr) Is dbnull Then
            Return ""
        Else
            Return TmpStr
        End If
    End Function
End Class
Imports System.Data
Imports System.Data.SqlClient
Imports GenericHelper.GenericHelper

Partial Class publicationsfolder_hints_briefs
    Inherits System.Web.UI.Page

    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader
    Dim objDataAdapter As New SqlDataAdapter("", objConnect)
    Dim objDataSet As New System.Data.DataSet
    Dim objDataView As DataView

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            ' Adding sections to dropdown list
            objConnect.Open()
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "List_Sections"
            objDR = Cmd.ExecuteReader()
            DDL_Section.DataSource = objDR
            DDL_Section.DataBind()
            objDR.Close()
            Cmd.Parameters.Clear()
            objConnect.Close()

            DDL_Section.Items.Insert(0, New ListItem("- Any -", "-1"))


            If Test_RequestVar_IsPopulated(Server.HtmlEncode(Request.QueryString("tpc"))) = True Then
                DDL_Section.SelectedValue = Server.HtmlEncode(Request.QueryString("tpc"))
            End If


            RunSearch()

        End If

    End Sub




    Sub RunSearch()

        objConnect.Open()

        If DDL_Section.SelectedValue = "-1" Then
            objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure
            objDataAdapter.SelectCommand.CommandText = "List_Briefs"
            objDataAdapter.Fill(objDataSet, "NewBriefsList")
            objDataView = objDataSet.Tables("NewBriefsList").DefaultView

        Else

            objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure
            objDataAdapter.SelectCommand.CommandText = "List_Briefs_By_Section"
            objDataAdapter.SelectCommand.Parameters.Add("@FK_Section", SqlDbType.Int).Value = DDL_Section.SelectedValue

            objDataAdapter.Fill(objDataSet, "NewBriefsList")
            objDataView = objDataSet.Tables("NewBriefsList").DefaultView
            objDataAdapter.SelectCommand.Parameters.Clear()

        End If

        objConnect.Close()

        objDataView.RowFilter = "FK_Language = 1 " 'FK_Language = 1 means English
        UC_Articles_English.BuildResults(objDataView)

        objDataView.RowFilter = "FK_Language = 2 " 'FK_Language = 2 means Spanish
        UC_Articles_Spanish.BuildResults(objDataView)

    End Sub

    Protected Sub DDL_Section_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL_Section.SelectedIndexChanged
        RunSearch()
    End Sub
End Class

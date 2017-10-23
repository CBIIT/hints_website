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
            MultiView1.SetActiveView(View_English)
        End If
    End Sub

    Protected Sub languageTabs_MenuItemClick(sender As Object, e As System.Web.UI.WebControls.MenuEventArgs) Handles languageTabs.MenuItemClick
        MultiView1.ActiveViewIndex = Int32.Parse(languageTabs.SelectedValue)
    End Sub

    Protected Sub DDL_Section_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDL_Section.SelectedIndexChanged
        RunSearch()
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

        UC_Articles.BuildResults(objDataView)
        UC_Articles.Visible = True

        objDataView.RowFilter = "FK_Language = 2 " 'FK_Language = 2 means Spanish

        UC_Articles1.BuildResults(objDataView)
        UC_Articles1.Visible = True

    End Sub

End Class

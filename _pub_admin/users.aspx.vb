Imports System.Data
Imports System.Data.SqlClient


Partial Class _pub_admin_users
    Inherits System.Web.UI.Page



    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim objDataAdapter As New SqlDataAdapter("", objConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDataSet As New DataSet()
    Dim objDR As SqlDataReader
    'Dim objDataSet As New DataSet
    'Dim objDataView As DataView


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            BindDataGrid()
        End If
    End Sub



    Protected Sub DuplicateUsername_INDG(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)
        Dim intCount As Integer


        Dim DataItem As DataListItem = CType(source, CustomValidator).NamingContainer
        Dim TXT_UserName_Update As TextBox = DataItem.FindControl("TXT_UserName_Inside")
        Dim Lit_ID As Literal = DataItem.FindControl("Lit_ID_Edit")

        objConnect.Open()
        Cmd.CommandType = CommandType.StoredProcedure
        Cmd.CommandText = "[Check_Duplicate_UserNames]"
        Cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = TXT_UserName_Update.Text
        Cmd.Parameters.Add("@PK_User", SqlDbType.Int).Value = Lit_ID.Text
        intCount = Cmd.ExecuteScalar()
        Cmd.Parameters.Clear()
        objConnect.Close()

        If intCount > 0 Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If
    End Sub


    Protected Sub BTN_Save_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTN_Save.Click
        If Page.IsValid Then
            objConnect.Open()
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "[Insert_Users]"
            Cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = TXT_UserName.Text
            Cmd.Parameters.Add("@PWD", SqlDbType.NVarChar).Value = TXT_PWD.Text
             Cmd.ExecuteNonQuery()
            Cmd.Parameters.Clear()
            objConnect.Close()
            TXT_UserName.Text = ""
            TXT_PWD.Text = ""
            BindDataGrid()
        End If
    End Sub


    Sub DataGrid_ItemCreated(ByVal Sender As Object, ByVal e As DataListItemEventArgs)
        Select Case e.Item.ItemType
            Case ListItemType.Item
                Dim myDeleteButton As LinkButton
                myDeleteButton = e.Item.FindControl("CMD_Delete")
                myDeleteButton.Attributes.Add("onclick", "return confirm('Are you Sure you want to delete this user?');")
            Case ListItemType.AlternatingItem
                Dim myDeleteButton As LinkButton
                myDeleteButton = e.Item.FindControl("CMD_Delete")
                myDeleteButton.Attributes.Add("onclick", "return confirm('Are you Sure you want to delete this user?');")
        End Select
    End Sub


    Sub DoItemEdit(ByVal objSource As Object, ByVal objArgs As DataListCommandEventArgs)
        MyDataList.EditItemIndex = objArgs.Item.ItemIndex
        BindDataGrid()
    End Sub

    Sub DoItemUpdate(ByVal objSource As Object, ByVal objArgs As DataListCommandEventArgs)
        If Page.IsValid Then
            objConnect.Open()
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = "[Update_Users]"
            Cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = CType(objArgs.Item.FindControl("TXT_UserName_Inside"), TextBox).Text
            Cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = CType(objArgs.Item.FindControl("TXT_Update_PWD_Inside"), TextBox).Text
            Cmd.Parameters.Add("@PK_User", SqlDbType.Int).Value = CType(objArgs.Item.FindControl("Lit_ID_Edit"), Literal).Text
            Cmd.ExecuteNonQuery()
            Cmd.Parameters.Clear()
            objConnect.Close()
            MyDataList.EditItemIndex = -1
            BindDataGrid()
        End If
    End Sub

    Sub DoItemCancel(ByVal objSource As Object, ByVal objArgs As DataListCommandEventArgs)
        MyDataList.EditItemIndex = -1
        BindDataGrid()
    End Sub

    Sub DoItemDelete(ByVal objSource As Object, ByVal objArgs As DataListCommandEventArgs)
        objConnect.Open()
        Cmd.CommandType = CommandType.StoredProcedure
        Cmd.CommandText = "[Delete_Users]"
        Cmd.Parameters.Add("@PK_User", SqlDbType.Int).Value = CType(objArgs.Item.FindControl("Lit_ID"), Literal).Text
        Cmd.ExecuteNonQuery()
        Cmd.Parameters.Clear()
        objConnect.Close()
        MyDataList.EditItemIndex = -1
        BindDataGrid()
    End Sub

    Sub BindDataGrid()
        objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure
        objDataAdapter.SelectCommand.CommandText = "[List_Users]"
        objDataAdapter.Fill(objDataSet, "DS_Users")
        objConnect.Close()
        MyDataList.DataSource = objDataSet.Tables("DS_Users").DefaultView
        MyDataList.DataBind()
    End Sub

    Protected Sub CustomValidator1_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator1.ServerValidate
        Dim intCount As Integer
        objConnect.Open()
        Cmd.CommandType = CommandType.StoredProcedure
        Cmd.CommandText = "[Check_Duplicate_UserNames]"
        Cmd.Parameters.Add("@Username", SqlDbType.NVarChar).Value = TXT_UserName.Text
        intCount = Cmd.ExecuteScalar()
        Cmd.Parameters.Clear()
        objConnect.Close()

        If intCount > 0 Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If
    End Sub
End Class

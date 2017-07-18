<%@ Page Language="VB" AutoEventWireup="false" CodeFile="users.aspx.vb" Inherits="_pub_admin_users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Modify Users</h1>
        <table>

            <tr>
                <td style="width: 96px">Username</td>
                <td>
                    <asp:TextBox ID="TXT_UserName" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TXT_UserName"
                        Display="Dynamic" ErrorMessage="UserName is Required" ValidationGroup="GRPAdd"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TXT_UserName"
                        Display="Dynamic" ErrorMessage="That Username is already in use." ValidationGroup="GRPAdd"></asp:CustomValidator></td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TXT_UserName"
                    Display="Dynamic" ErrorMessage="Must be a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="GRPAdd"></asp:RegularExpressionValidator>

            </tr>
            <tr>
                <td style="width: 96px">Password</td>
                <td>
                    <asp:TextBox ID="TXT_PWD" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TXT_PWD"
                        Display="Dynamic" ErrorMessage="Password is Required" ValidationGroup="GRPAdd"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator Display="dynamic" ID="RegularExpressionValidator3" runat="server" ControlToValidate="TXT_PWD"
                        ErrorMessage="Must have at least 1 number, 1 special character, 
        and more than 6 characters."
                        ValidationExpression="(?=^.{6,}$)(?=.*\d)(?=.*\W+)(?![.\n]).*$"></asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <asp:Button ID="BTN_Save" runat="server" Text="Save Changes" ValidationGroup="GRPAdd" /></td>
            </tr>
        </table>
        <hr />
        <h3>Modify an existing administrator</h3>
        <asp:DataList ID="MyDataList" runat="server" AlternatingItemStyle-BackColor="#DBDCD8"
            OnItemCreated="DataGrid_ItemCreated" OnEditCommand="DoItemEdit" OnUpdateCommand="DoItemUpdate"
            OnCancelCommand="DoItemCancel" OnDeleteCommand="DoItemDelete">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" Text="Edit" CausesValidation="False" CommandName="Edit"
                    runat="server" />&nbsp;&nbsp;
            <asp:LinkButton Text="Delete" ID="CMD_Delete" CausesValidation="False" CommandName="Delete"
                runat="server" /><br />
                <asp:Literal ID="Lit_ID" Visible="false" Text='<%# Eval("UserId")%>' runat="server" />
                <asp:Label ID="Label2" Width="250" Text='<%# Eval("UserName") %>' runat="server" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton2" Text="Update" CommandName="Update" ValidationGroup="GRPUPDATE"
                    CausesValidation="True" runat="server" />&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton3" Text="Cancel" CausesValidation="False" CommandName="Cancel"
                runat="server" /><br />


                <asp:Literal ID="Lit_ID_Edit" Visible="false" Text='<%# Eval("UserId")%>' runat="server" />
                <asp:Table ID="Table1" runat="server">





                    <asp:TableRow>
                        <asp:TableCell>UserName:</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox MaxLength="50" ID="TXT_UserName_Inside" Text='<%# Eval("UserName")%>' runat="server" />

                            <asp:RequiredFieldValidator ValidationGroup="GRPUPDATE" Display="dynamic" ID="RequiredUserNameedit"
                                ControlToValidate="TXT_UserName_Inside" ErrorMessage="*required" runat="server" />
                            <asp:CustomValidator ValidationGroup="GRPUPDATE" OnServerValidate="DuplicateUsername_INDG"
                                ID="CustomValidatorinside" runat="server" ControlToValidate="TXT_UserName_Inside" Display="Dynamic"
                                ErrorMessage="That Username address is already in use."></asp:CustomValidator>

                            <asp:RegularExpressionValidator ValidationGroup="GRPUPDATE" ID="RegularExpressionValidatoinsdideusername"
                                runat="server" ControlToValidate="TXT_UserName_Inside" Display="Dynamic" ErrorMessage="Must be a valid email address"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>


                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Password:</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox MaxLength="50" ID="TXT_Update_PWD_Inside" Text='<%# Eval("Password")%>' runat="server" />
                            <asp:RequiredFieldValidator ValidationGroup="GRPUPDATE" Display="dynamic" ID="RequiredFieldValidatorpwdinside"
                                ControlToValidate="TXT_Update_PWD_Inside" ErrorMessage="*required" runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>

                </asp:Table>

            </EditItemTemplate>
            <AlternatingItemStyle BackColor="#DBDCD8" />
        </asp:DataList>

    </form>
</body>
</html>

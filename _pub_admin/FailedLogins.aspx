<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FailedLogins.aspx.vb" Inherits="_pub_admin_FailedLogins" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="margin:4%;">
    <div>
     
    <h1>Failed Login Attempts</h1>
 
    <table border="1" style="height: 396px; width: 1058px;text-align:center ">
        <tr>
            <th>UserName</th>
            <th>Password</th>
            <th>Date and Time of Login Attempt</th>
            <th>Validate</th>
        </tr>


    <asp:Repeater ID="RPTR" runat="server">
        <ItemTemplate>
          
        <tr>
            <td><%# Eval("UserName")%>&nbsp;</td>
            <td><%# Eval("Password")%>&nbsp;</td>
            <td><%# Eval("TimeOfAttempt")%>&nbsp;</td>
            <td> <asp:Button ID="btnUnlock" runat="server" Text= "Unlock" CommandArgument='<%#Eval("UserName")%>' OnClick="MyButtonClick" />  </td>
         </tr>
        </ItemTemplate>
    </asp:Repeater>
        </table>
    </div>
    </form>
</body>
</html>

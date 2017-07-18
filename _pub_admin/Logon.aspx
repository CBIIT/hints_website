<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Logon.aspx.vb" Inherits="_pub_admin_Logon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="margin:2%">
<h3>
   <font face="Verdana">Logon Page</font>
</h3>
<form ID="login_form" runat="server">
<table>
   <tr>     
      <td>Email Address:</td>
      <td><input id="txtUserName" type="text" runat="server"></td> 
       <br/>
       <asp:RegularExpressionValidator ID="RegularExpressionValidator_txtUserName" runat="server" ControlToValidate="txtUserName"
                                Display="dynamic" ErrorMessage="Please enter a valid e-mail address." ForeColor="Red"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Width="250"></asp:RegularExpressionValidator>  
   </tr>

   <tr>
      <td >Password:</td>
      <td ><input id="txtUserPass" type="password" runat="server"></td>
   </tr>

</table>
    <br/>
<asp:button ID="btnLogin" runat="server" text="Submit" Autopostback="True"/>

    <asp:Button ID="BTN_Clear" CausesValidation="false" runat="server" Text="Clear" />

    <br/> <br/>
     Click the button to recover your password. Your password will be sent to your email address.
    <asp:button ID="btnPass" runat="server" text="Recover" Autopostback="True" />

</form>

<asp:Label id="lblFailMsg" ForeColor="red" runat="server"/>

<asp:Label id="lblLockMsg" ForeColor="red" runat="server" />

    <asp:Label ID="lblUname" ForeColor="Red" runat="server"></asp:Label>
    <p id="send_sucess_row" runat="server">
                        
                            <strong>Your password has been sent to your email address</strong>                                                                             
     </p>
                    <p id="send_unsucess_row" runat="server">
                        There has been a problem with your submission.  Please use the back button of your browser to re-enter your information and try again.  
                        If this error persists, please <a href="mailto:blakek@mail.nih.gov">contact the administrator directly</a>.
                    </p>

    </body>
</html>

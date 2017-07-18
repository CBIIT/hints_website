<%@ Control Language="VB" AutoEventWireup="false" CodeFile="sub_unsub.ascx.vb" Inherits="_usercontrols_sub_unsub" %>

         <p>Sign up to get updates on the latest HINTS data releases, publications, and website features.</p>

            <p>
                <asp:Label ID="Label1" runat="server" AssociatedControlID="txtemailTerms" Text="Please enter your email:"></asp:Label>
                <asp:TextBox ID="txtemailTerms" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtemailTerms"
                    Display="Dynamic" ErrorMessage="&lt;br/&gt;Please enter an email address." ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemailTerms"
                    Display="Dynamic" ErrorMessage="&lt;br/&gt;Please enter a valid email address."
                    ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </p>

            <p>
                <asp:RadioButton ID="rdSub" Text="Subscribe" TextAlign="Right" Checked="true" GroupName="listserv"
                    runat="server" />&nbsp;
                            <asp:RadioButton ID="rdUnsub" Text="Un-subscribe" TextAlign="Right" runat="server"
                                GroupName="listserv" />&nbsp;
            </p>

            <p>
                <asp:Button ID="btnSubmit" runat="server" Text="Accept" />
    
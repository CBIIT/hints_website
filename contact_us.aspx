<%@ Page Title="Contact Us" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="contact_us.aspx.vb" Inherits="contact_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>

        #page_wrapper_contact_us h1 {
    margin-left: 0px;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <div id="page_wrapper_contact_us" class="col-6">
            <h1>Contact Us</h1>
   <div id="contact_table" runat="server">
           <p>Please visit our <a href="faq.aspx">FAQ page</a> prior to submitting a request, as your question could already be addressed.</p>

      
           <div class="FormItemWrapper">
                <div class="FormLeftItem">
                     <asp:Label ID="FirstName"  AssociatedControlID="txtfname" runat="server" Text="*First Name:"></asp:Label>
                </div>
           <div class="FormRightItem">
                 <asp:TextBox ID="txtfname" runat="server" Rows="2" TextMode="SingleLine" CssClass="SingleLineTextBox"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtfname" runat="server" ControlToValidate="txtfname"
                    ErrorMessage="Required Field" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
           </div>
                 <br/>
           </div>
             

         <div class="FormItemWrapper">
                <div class="FormLeftItem">
                     <asp:Label ID="LastName"  AssociatedControlID="txtlname" runat="server" Text="*Last Name:"></asp:Label>
                </div>
           <div class="FormRightItem">
                 <asp:TextBox ID="txtlname" runat="server" Rows="2" TextMode="SingleLine" CssClass="SingleLineTextBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtlname" runat="server" ControlToValidate="txtlname"
                    ErrorMessage="Required Field" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
           </div>
                 <br/>
           </div>


      <div class="FormItemWrapper">
                <div class="FormLeftItem">
                     <asp:Label ID="Phone"  AssociatedControlID="txtphone" runat="server" Text="Phone:"></asp:Label>
                </div>
           <div class="FormRightItem">
                 <asp:TextBox ID="txtphone" runat="server" Rows="2" TextMode="SingleLine" CssClass="SingleLineTextBox"></asp:TextBox>
      
           </div>
                 <br/>
           </div>


        <div class="FormItemWrapper">
                <div class="FormLeftItem">
                     <asp:Label ID="Label2"  AssociatedControlID="txtemail" runat="server" Text="*Email Address:"></asp:Label>
                </div>
           <div class="FormRightItem">
                 <asp:TextBox ID="txtemail" runat="server" Rows="2" TextMode="SingleLine" CssClass="SingleLineTextBox"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtemail" runat="server" ControlToValidate="txtemail" 
                    ErrorMessage="Required Field" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator_txtemail" runat="server" ControlToValidate="txtemail"
                        Display="dynamic" ErrorMessage="Please enter a valid e-mail." ForeColor="Red"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Width="250"></asp:RegularExpressionValidator>
           </div>
                 <br/>
           </div>

       <div class="FormItemWrapper">
        <div class="FormLeftItem">
            <asp:Label ID="Year"  AssociatedControlID="ddlformsubject" runat="server" Text="Subject:"></asp:Label>
            </div>
        <div class="FormRightItem">
    <asp:DropDownList ID="ddlformsubject" runat="server">
         <asp:ListItem Value="">- Please select a subject -</asp:ListItem>
                    <asp:ListItem value="Using the interactive codebook">Using the interactive codebook</asp:ListItem>
                    <asp:ListItem  value="Please send login / password reminder">Please send login / password reminder</asp:ListItem>
                    <asp:ListItem value="Using HINTS data in my work">Using HINTS data in my work</asp:ListItem>
                    <asp:ListItem value="Current research with HINTS data">Current research with HINTS data</asp:ListItem>
                    <asp:ListItem value="Other">Other</asp:ListItem>
    </asp:DropDownList>                
    </div> <br/>
    </div>


            <div class="FormItemWrapper">
                <div class="FormLeftItem">
                     <asp:Label ID="Comments"  AssociatedControlID="txtcomments" runat="server" Text="Comments/Questions:"></asp:Label>
                </div>
           <div class="FormRightItem">
                 <asp:TextBox ID="txtcomments" runat="server" Rows="10" TextMode="MultiLine" CssClass="MultiLineTextBox"></asp:TextBox>
       
           </div>
                 <br/>
           </div>


        <div id="dv_controls">   
            <div id="dv_controlSubmit" style="margin-right:43%;">
                <asp:Button ID="btnSubmit" CausesValidation="true" runat="server" Text="Submit" /></div>
        </div>


 </div>

        <table border="0" cellpadding="8" cellspacing="0" id="contactresult_table" summary="Result of contact us form submission" runat="server">
          <tr id="send_sucess_row" runat="server">
			<td>
                <strong>The following has been sent to a HINTS contact person:</strong>
                <br /> <br />
                <asp:Literal ID="LIT_Body" runat="server"></asp:Literal>
                <br />
                <strong>Thank you for your submission.  Someone will contact you shortly.</strong>
           </td>
          </tr>
          <tr id="send_unsucess_row" runat="server">
			<td>There has been a problem with your submission.  Please use the back button of your browser to re-enter your information and try again.  If this error persists, please <a href="mailto:blakek@mail.nih.gov">contact the administrator directly</a>.</td>
          </tr>
        </table>
</div>

</asp:Content>


<%@ Page Title="Contact Us | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="contact-us.aspx.vb" Inherits="aboutfolder_contact_us" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="Contact Us | HINTS" />
    <meta name="Description" content="Contact us or visit our FAQ page to get information on the HINTS program." />

    <link rel="stylesheet" href="/css/hpot.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<div style="padding: 10px 20px; background: #1f7a21; color: #ffffff">
    <p>Because of a lapse in government funding, the information on this website may not be up to date, transactions submitted via the website may not be processed, and the agency may not be able to respond to inquiries until appropriations are enacted. The NIH Clinical Center (the research hospital of NIH) is open. For more details about its operating status, please visit <a href="https://cc.nih.gov" target="_blank" style="color: #ffffff">cc.nih.gov</a>. Updates regarding government operating status and resumption of normal operations can be found at <a href="https://www.opm.gov/policy-data-oversight/snow-dismissal-procedures/current-status/" target="_blank" style="color: #ffffff">opm.gov</a>.</p>
</div>


    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">

                    <div id="page_wrapper_contact_us">
                        <h1>Contact Us</h1>
                        <div id="contact_table" runat="server">
                            <p>Please visit our <a href="/about-hints/frequently-asked-questions.aspx">FAQ page</a> prior to submitting a request, as your question could already be addressed.</p>


                            <div class="FormItemWrapper">
                                <div class="FormLeftItem">
                                    <asp:Label ID="FirstName" AssociatedControlID="txtfname" runat="server" Text="*First Name:"></asp:Label>
                                </div>
                                <div class="FormRightItem">
                                    <asp:TextBox ID="txtfname" runat="server" Rows="2" TextMode="SingleLine" CssClass="SingleLineTextBox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtfname" runat="server" ControlToValidate="txtfname"
                                        ErrorMessage="Required Field" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <br />
                            </div>


                            <div class="FormItemWrapper">
                                <div class="FormLeftItem">
                                    <asp:Label ID="LastName" AssociatedControlID="txtlname" runat="server" Text="*Last Name:"></asp:Label>
                                </div>
                                <div class="FormRightItem">
                                    <asp:TextBox ID="txtlname" runat="server" Rows="2" TextMode="SingleLine" CssClass="SingleLineTextBox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtlname" runat="server" ControlToValidate="txtlname"
                                        ErrorMessage="Required Field" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <br />
                            </div>


                            <div class="FormItemWrapper">
                                <div class="FormLeftItem">
                                    <asp:Label ID="Phone" AssociatedControlID="txtphone" runat="server" Text="Phone:"></asp:Label>
                                </div>
                                <div class="FormRightItem">
                                    <asp:TextBox ID="txtphone" runat="server" Rows="2" TextMode="SingleLine" CssClass="SingleLineTextBox"></asp:TextBox>

                                </div>
                                <br />
                            </div>


                            <div class="FormItemWrapper">
                                <div class="FormLeftItem">
                                    <asp:Label ID="Label2" AssociatedControlID="txtemail" runat="server" Text="*Email Address:"></asp:Label>
                                </div>
                                <div class="FormRightItem">
                                    <asp:TextBox ID="txtemail" runat="server" Rows="2" TextMode="SingleLine" CssClass="SingleLineTextBox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtemail" runat="server" ControlToValidate="txtemail"
                                        ErrorMessage="Required Field" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_txtemail" runat="server" ControlToValidate="txtemail"
                                        Display="dynamic" ErrorMessage="Please enter a valid e-mail." ForeColor="Red"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Width="250"></asp:RegularExpressionValidator>
                                </div>
                                <br />
                            </div>

                            <div class="FormItemWrapper">
                                <div class="FormLeftItem">
                                    <asp:Label ID="Year" AssociatedControlID="ddlformsubject" runat="server" Text="Subject:"></asp:Label>
                                </div>
                                <div class="FormRightItem">
                                    <asp:DropDownList ID="ddlformsubject" runat="server">
                                        <asp:ListItem Value="">- Please select a subject -</asp:ListItem>
                                        <asp:ListItem Value="Using the interactive codebook">Using the interactive codebook</asp:ListItem>
                                        <asp:ListItem Value="Please send login / password reminder">Please send login / password reminder</asp:ListItem>
                                        <asp:ListItem Value="Using HINTS data in my work">Using HINTS data in my work</asp:ListItem>
                                        <asp:ListItem Value="Current research with HINTS data">Current research with HINTS data</asp:ListItem>
                                        <asp:ListItem Value="Other">Other</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <br />
                            </div>


                            <div class="FormItemWrapper">
                                <div class="FormLeftItem">
                                    <asp:Label ID="Comments" AssociatedControlID="txtcomments" runat="server" Text="Comments/Questions:"></asp:Label>
                                </div>
                                <div class="FormRightItem">
                                    <asp:TextBox ID="txtcomments" runat="server" Rows="10" TextMode="MultiLine" CssClass="MultiLineTextBox"></asp:TextBox>

                                </div>
                                <br />
                            </div>

                            <div class="rwbtrickery">
                                <asp:TextBox autocomplete="new-password" ID="rwbNotEmail" TabIndex="-1" Text="" runat="server" />
                                <label class="sr-only" for="rwbNotEmail">This is for bot prevention; leave this field blank</label>
                            </div>


                            <div id="dv_controls">
                                <div id="dv_controlSubmit" style="margin-right: 63%;">
                                    <asp:Button ID="btnSubmit" CausesValidation="true" runat="server" Text="Submit" />
                                </div>
                            </div>

                            <ul>
                                <li>You may also contact us directly at&nbsp;<a href="mailto:NCIhints@mail.nih.gov">NCIhints@mail.nih.gov</a>.</li>
                                <li>If you received a HINTS survey  and have questions or need another survey, please call Westat toll-free at <a href="tel:18887386805">1-888-738-6805</a>.</li>
                                <li>Si prefiere recibir la  encuesta en Español, por favor llame <a href="tel:18887386812">1-888-738-6812</a>. </li>
                            </ul>
                        </div>

                        <table border="0" cellpadding="8" cellspacing="0" id="contactresult_table" summary="Result of contact us form submission" runat="server">
                            <tr id="send_sucess_row" runat="server">
                                <td>
                                    <strong>The following has been sent to a HINTS contact person:</strong>
                                    <br />
                                    <br />
                                    <asp:Literal ID="LIT_Body" runat="server"></asp:Literal>
                                    <br />
                                    <strong>Thank you for your submission.  Someone will contact you shortly.</strong>
                                </td>
                            </tr>
                            <tr id="send_unsucess_row" runat="server">
                                <td class="required">There has been a problem with your submission.  Please use the back button of your browser to re-enter your information and try again.  If this error persists, please <a href="mailto:blakek@mail.nih.gov">contact the administrator directly</a>.</td>
                            </tr>

                        </table>
                    </div>


                </div>
            </div>
        </section>
    </div>




</asp:Content>



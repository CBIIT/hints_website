<%@ Page Title="Submit Publication | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="submit-hints-publication.aspx.vb" Inherits="publicationsfolder_submit_hints_publication" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="Submit Publication | HINTS" />
    <meta name="Description" content="In order to help cultivate a community of HINTS users, HINTS encourages users to submit articles so they can be posted on the HINTS website." />
    <script type="text/javascript" src='<%=Me.ResolveUrl("~/_scripts/ValidateFileSize.js")%>'></script>
    <link rel="stylesheet" href="/css/hpot.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">





    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">




                    <asp:Panel ID="PNL_Form" runat="server" DefaultButton="BTN_Submit">
                        <div id="page_wrapper_inform_us" class="container fullwidth">
                            <br />
                            <br />

                            <div id="title_wrapper" runat="server">

                                <h1>Submit Your Citation for a Publication</h1>
                                <br />
                                <p>
                                    In order to help cultivate a community of HINTS users, we are asking that you let us know about published HINTS-related articles so that these can be posted on the HINTS Web site. Please use the following form to submit this information.
                                </p>
                            </div>
                            <div class="row">
                                <div id="publications_search_wrapper" class="col-12">


                                    <asp:Literal ID="msgSuccess" runat="server" Visible="false"><h1>Thank you for your submission.</h1></asp:Literal>
                                    <br />
                                    <div id="informus_form" runat="server">

                                        <div class="FormItemWrapper">
                                            <div class="FormLeftItem">
                                                <span class="required">*</span>
                                                <asp:Label ID="Label2" AssociatedControlID="TXT_title" runat="server" Text="Title:"></asp:Label>
                                            </div>
                                            <div class="FormRightItem">
                                                <asp:TextBox ID="TXT_title" runat="server" Rows="2" TextMode="SingleLine" CssClass="SingleLineTextBox"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_txttitle" runat="server" ControlToValidate="TXT_title"
                                                    ErrorMessage="Required Field" Display="Dynamic" CssClass="required"></asp:RequiredFieldValidator>
                                            </div>
                                            <br />
                                        </div>

                                        <div class="FormItemWrapper">
                                            <div class="FormLeftItem">
                                                <asp:Label ID="Label3" AssociatedControlID="TXT_journal" runat="server" Text="Journal:"></asp:Label>
                                            </div>
                                            <div class="FormRightItem">
                                                <asp:TextBox ID="TXT_journal" runat="server" Rows="2" TextMode="SingleLine" CssClass="SingleLineTextBox"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>


                                        <div class="FormItemWrapper">
                                            <div class="FormLeftItem">
                                                <span class="required">*</span>
                                                <asp:Label ID="Label4" AssociatedControlID="TXT_author" runat="server" Text="Primary Author:"></asp:Label>
                                            </div>
                                            <div class="FormRightItem">
                                                <asp:TextBox ID="TXT_author" runat="server" Rows="2" TextMode="SingleLine" CssClass="SingleLineTextBox"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtauthor" runat="server" ControlToValidate="TXT_author"
                                                    ErrorMessage="Required Field" Display="Dynamic" CssClass="required"></asp:RequiredFieldValidator>
                                            </div>
                                            <br />
                                        </div>


                                        <div class="FormItemWrapper">
                                            <div class="FormLeftItem">
                                                <asp:Label ID="Label6" AssociatedControlID="TXT_Allauthors" runat="server" Text="All Authors:"></asp:Label>
                                            </div>
                                            <div class="FormRightItem">
                                                <asp:TextBox ID="TXT_Allauthors" runat="server" Rows="2" TextMode="SingleLine" CssClass="SingleLineTextBox"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>



                                        <div class="FormItemWrapper">
                                            <div class="FormLeftItem">
                                                <span class="required">*</span>
                                                <asp:Label ID="Label5" AssociatedControlID="TXT_authorEmail" runat="server" Text="Corresponding Author Email:"></asp:Label>
                                            </div>
                                            <div class="FormRightItem">
                                                <asp:TextBox ID="TXT_authorEmail" runat="server" Rows="2" TextMode="SingleLine" CssClass="SingleLineTextBox"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_TXT_authorEmail" runat="server" ControlToValidate="TXT_authorEmail"
                                                    Display="dynamic" ErrorMessage="Please enter a valid e-mail." CssClass="required"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Width="250"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="InformUs_Email" runat="server" ControlToValidate="TXT_authorEmail"
                                                    ErrorMessage="Required Field" Display="Dynamic" CssClass="required"></asp:RequiredFieldValidator>
                                            </div>
                                            <br />
                                        </div>


                                        <div class="FormItemWrapper">
                                            <div class="FormLeftItem">
                                                <asp:Label ID="Month" AssociatedControlID="DDL_month" runat="server" Text="Publish Month/Year"></asp:Label>
                                                <asp:Label Style="visibility: hidden;" ID="Year" CssClass="skipnav_hidden" AssociatedControlID="DDL_year" runat="server" Text="*Publish Month/Year"></asp:Label>
                                            </div>
                                            <div class="FormRightItem">
                                                <asp:DropDownList ID="DDL_month" runat="server">
                                                    <asp:ListItem Value="-1">- Month -</asp:ListItem>
                                                </asp:DropDownList>

                                                <asp:DropDownList ID="DDL_year" runat="server">
                                                    <asp:ListItem Value="-1">- Year -</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                            <br />
                                        </div>



                                        <div class="rwbtrickery">
                                            <asp:TextBox autocomplete="new-password" ID="rwbNotEmail" TabIndex="-1" Text="" runat="server" />
                                            <label class="sr-only" for="rwbNotEmail">This is for bot prevention; leave this field blank</label>
                                        </div>

                                        <div id="dv_controls">
                                            <div id="dv_controlSubmit">
                                                <asp:Button ID="BTN_Submit" ClientIDMode="Static" CausesValidation="true" runat="server" Text="Submit" />
                                            </div>
                                        </div>

                                    </div>

                                    <table border="0" cellpadding="8" cellspacing="0" id="contactresult_table" summary="Result of inform us form submission" runat="server">
                                        <tr id="send_unsucess_row" runat="server">
                                            <td>There has been a problem with your submission.  Please use the back button of your browser to re-enter your information and try again.  If this error persists, please <a href="mailto:blakek@mail.nih.gov">contact the administrator directly</a>.</td>
                                        </tr>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </asp:Panel>





                </div>
            </div>
        </section>
    </div>
</asp:Content>



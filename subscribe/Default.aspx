<%@ Page Title="Subscribe/Unsubscribe" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="subscribe_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="/css/hpot.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">



                    <h1>Subscribe to our listserv.</h1>


                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                        <asp:View ID="VW_Form" runat="server">
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
                            <div class="rwbtrickery">
                                <asp:TextBox autocomplete="new-password" ID="rwbNotEmail" TabIndex="-1" Text="" runat="server" />
                                <label class="sr-only" for="rwbNotEmail">This is for bot prevention; leave this field blank</label>
                            </div>
                            <p>
                                <asp:Button ID="btnSubmit" runat="server" Text="Accept" />
                            </p>
                        </asp:View>

                        <asp:View ID="VW_Subscribed" runat="server">
                            <p>Thank you for subscribing! You will begin receiving HINTS updates soon.</p>
                        </asp:View>
                        <asp:View ID="VW_UNSubscribed" runat="server">
                            <p>You have been unsubscribed from the HINTS email listserv</p>
                        </asp:View>
                    </asp:MultiView>



                </div>
            </div>
        </section>
    </div>
</asp:Content>

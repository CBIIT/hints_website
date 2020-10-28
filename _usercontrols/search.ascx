<%@ Control Language="VB" AutoEventWireup="false" CodeFile="search.ascx.vb" Inherits="_usercontrols_search" %>

<asp:Panel ID="Panel1" runat="server">
<p>
    <label for="search_TextBoxSearch"><asp:TextBox ID="TextBoxSearch" runat="server" CssClass="searchQuestionNumber"> </asp:TextBox></label>
    &nbsp;<asp:ImageButton ID="LinkButtonSearch" runat="server" ImageUrl="/images/go.png" ImageAlign="AbsBottom" AlternateText="Click Go to Search" />
    <asp:RequiredFieldValidator  name="Title" controlid="DropDownList1"ControlToValidate="TextBoxSearch" InitialValue="enter keyword..." Display="Dynamic" ForeColor="Red" Text="<br/>Please insert a keyword" runat="server" CssClass="searchQuestionNumber"  />
    </p>
    <p style="margin:10px;">
        <asp:HyperLink ID="HYP_Advanced" NavigateUrl="~/advanced.aspx?sf=1" runat="server">Advanced Search</asp:HyperLink></p>
</asp:Panel>
<script type="text/javascript">

    function 
    QuestionNumberFocus(txtElem, strWatermark)
    { if (txtElem.value == strWatermark) txtElem.value = ''; }

    function QuestionNumberBlur(txtElem, strWatermark)
    { if (txtElem.value == '') txtElem.value = strWatermark; } 

</script> 
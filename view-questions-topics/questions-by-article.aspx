<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="questions-by-article.aspx.vb" Inherits="questionsfolder_questions_by_article" %>



<%@ Register Src="~/_usercontrols/results.ascx" TagName="results" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="/_css/results.css?v=2017_11_13" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:PlaceHolder ID="PLC_PUb" Visible="false" runat="server">
            <h2>
        HINTS Questions Used in this Published Article</h2>
    <p><strong>
        <asp:Literal ID="LIT_Title" runat="server"></asp:Literal>,
        <asp:Literal ID="LIT_Author" runat="server"></asp:Literal>,
        <asp:Literal ID="LIT_Journal" runat="server"></asp:Literal>,
        <asp:Literal ID="LIT_PubDate" runat="server"></asp:Literal></strong>
    </p>

    </asp:PlaceHolder>

        <asp:PlaceHolder ID="PLC_Brief" Visible="false" runat="server">
            <h2>
        HINTS Questions Used in this Brief</h2>
    <p><strong>
        <asp:Literal ID="LIT_BriefTitle" runat="server"></asp:Literal>
        </strong>
    </p>

    </asp:PlaceHolder>

    <uc1:results ID="UC_Results" runat="server" />

    <script type="text/javascript">
            $("#breadcrumbs").hide();
    </script>

</asp:Content>


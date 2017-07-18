<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="briefsDetails.aspx.vb" Inherits="briefsDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1><asp:literal ID ="LIT_Title" runat="server"></asp:literal>
       <a ID="BriefLink" runat="server" target="_blank"> <img src="_images/icon_pdf.gif" alt="Download Brief in PDF Format"/> </a>
    </h1>
    <br />
    <div id="briefs_content">
    <asp:literal ID ="LIT_Content" runat="server"></asp:literal> </div>
    <br />
    <asp:literal ID ="LIT_Month" runat="server"></asp:literal>
    <asp:literal ID ="LIT_Year" runat="server"></asp:literal>

</asp:Content>


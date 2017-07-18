<%@ Page Title="Research Using HINTS Data" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="research.aspx.vb" Inherits="research" %>


<%@ Register Src="~/_usercontrols/articles.ascx" TagName="articles" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <h1>Research Using HINTS Data</h1>

    <h2>Resources:</h2>
    <ul id="jump">
        <li><a href="journals.aspx">Suggested Journals for Publishing HINTS Findings</a></li>
        <li><a href="inform_us.aspx">Submit your Publication</a></li>
    </ul>

    <h2 id="publications">Peer&#150;Reviewed Scientific Publications Using HINTS Data</h2>
    <div id="pub_pres_list">
        <uc1:articles ID="UC_Articles" blnDisplayYear="False" runat="server" />

        <br />
        <br />
        <a href="publications.aspx">See all publications...</a><br />
    </div>

</asp:Content>


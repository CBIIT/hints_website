<%@ Page Title="Geographic Maps | HINTS" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="map_details.aspx.vb" Inherits="questionsfolder_map_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<meta name="Title" content="Geographic Maps | HINTS"/>
    <meta name="Description" content="GIS maps using HINTS data provide a visual representation of possible geographic relationships in HINTS cancer-related knowledge variables. "/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>
        <asp:Literal ID="LIT_Question" runat="server"></asp:Literal></h2>
    <div id="knowledge_maps_wrapper">
    <div class="col_5">
        <img id="lblMap" runat="server" align='top' alt="Map" />
    </div>
    <div class="col_1">
        &nbsp; <a runat="server" id="hyp_brieflink" href='/view-questions-topics/articles-by-question.aspx?qdid=1&ArtType=2'>
            <img id="Img2" runat="server" src='~/_images/icon-brief.gif' alt='View related Briefs' title='View related Briefs'
                width='18' height='18' border='1'/></a>
    </div>
    <br/>
    <a id="lblDownloadMap" runat="server">Download map (TIF)</a>
        </div>
</asp:Content>


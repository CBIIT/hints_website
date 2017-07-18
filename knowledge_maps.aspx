<%@ Page Title="HINTS: View geographical map" Language="VB" MasterPageFile="~/Main.master"
    AutoEventWireup="false" CodeFile="knowledge_maps.aspx.vb" Inherits="knowledge_maps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>
        <asp:Literal ID="LIT_Question" runat="server"></asp:Literal></h2>
    <div id="knowledge_maps_wrapper">
    <div class="col_5">
        <img id="lblMap" runat="server" align='top' alt="Map" />
    </div>
    <div class="col_1">
        <a runat="server" id="hyp_publink">
            <img id="Img1" runat="server" src='~/_images/icon-pub.gif' alt='View related publications' title='View related publications'
                width='18' height='18' border='1' /></a>
        &nbsp; <a runat="server" id="hyp_brieflink" href='articles-by-question.aspx?qdid=1&ArtType=2'>
            <img id="Img2" runat="server" src='~/_images/icon-brief.gif' alt='View related Briefs' title='View related Briefs'
                width='18' height='18' border='1'/></a>
    </div>
    <br/>
    <a id="lblDownloadMap" runat="server">Download map (TIF)</a>
        </div>
</asp:Content>

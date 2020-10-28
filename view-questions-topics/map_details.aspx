<%@ Page Title="Geographic Maps | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="map_details.aspx.vb" Inherits="questionsfolder_map_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="Geographic Maps | HINTS" />
    <meta name="Description" content="GIS maps using HINTS data provide a visual representation of possible geographic relationships in HINTS cancer-related knowledge variables. " />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">


                    <h2>
                        <asp:Literal ID="LIT_Question" runat="server"></asp:Literal></h2>
                    <div id="knowledge_maps_wrapper" class="container">
                        <div class="row">
                            <div class="col-10">
                                <img id="lblMap" runat="server" align='top' alt="Map" />
                            </div>
                            <div class="col-2">
                                &nbsp; <a runat="server" id="hyp_brieflink" href='/view-questions-topics/articles-by-question.aspx?qdid=1&ArtType=2'>
                                    <img id="Img2" runat="server" src='~/_images/icon-brief.gif' alt='View related Briefs' title='View related Briefs'
                                        width='18' height='18' border='1' /></a>
                            </div>
                        </div>
                        <br />
                        <a id="lblDownloadMap" runat="server">Download map (TIF)</a>
                    </div>


                </div>
            </div>
        </section>
    </div>
</asp:Content>


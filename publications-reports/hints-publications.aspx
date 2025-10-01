<%@ Page Title="Publications Using HINTS Data | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="hints-publications.aspx.vb" Inherits="publicationsfolder_hints_publications" %>


<%@ Register Src="~/_usercontrols/articles.ascx" TagName="articles" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="Publications Using HINTS Data | HINTS" />
    <meta name="Description" content="A list of published articles using HINTS Data since 2004." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<div style="padding: 10px 20px; background: #1f7a21; color: #ffffff">
    <p>Because of a lapse in government funding, the information on this website may not be up to date, transactions submitted via the website may not be processed, and the agency may not be able to respond to inquiries until appropriations are enacted. The NIH Clinical Center (the research hospital of NIH) is open. For more details about its operating status, please visit <a href="https://cc.nih.gov" target="_blank" style="color: #ffffff">cc.nih.gov</a>. Updates regarding government operating status and resumption of normal operations can be found at <a href="https://www.opm.gov/policy-data-oversight/snow-dismissal-procedures/current-status/" target="_blank" style="color: #ffffff">opm.gov</a>.</p>
</div>


    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">
                    <h1>Published Articles Using HINTS Data</h1>
                    <p>You can find a list of all publications that have used HINTS data in the <a href="https://www.ncbi.nlm.nih.gov/myncbi/1p3IrapW7pgowc/bibliography/public/" target="_blank">HINTS PubMed Bibliography</a>. This bibliography is updated on a quarterly basis.</p>
                    <%--<p id="topTOC">Browse a list of published articles that analyze or make use of HINTS data. </p>

                    


                    <ul>
                        <asp:DataList ID="RPTR_PubJumplinks" CssClass="rwb_publication_Width" RepeatColumns="3" GridLines="None" runat="server">
                            <ItemTemplate>
                                <li><a href="#YR_<%# Eval("PubYear")%>"><%# Eval("PubYear")%></a></li>
                            </ItemTemplate>
                        </asp:DataList>
                    </ul>
                    <hr />

                    <div id="pub_pres_list">
                        <uc1:articles ID="UC_Articles" blnDisplayYear="True" runat="server" />
                        <p><a href="#topTOC">Return to Top</a></p>
                    </div>--%>




                </div>
            </div>
        </section>
    </div>
</asp:Content>



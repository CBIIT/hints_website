<%@ Page Title="" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="articles_by_questionDetails.aspx.vb" Inherits="questionsfolder_articles_by_questionDetails" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">


                    <h2>Published Articles that use this HINTS Question: <a runat="server" id="hyp_Question">
                        <asp:Literal ID="LIT_Question" runat="server"></asp:Literal></a></h2>
                    <asp:Repeater ID="RPTR_Pubs" runat="server">
                        <ItemTemplate>
                            <div class="list_wrapper">
                                <div>
                                    <%# Eval("Authors")%>&nbsp
                    <%# Eval("PubYear")%>&nbsp
                    <%# CheckifURLAvailable(Eval("Title"), Eval("LinkURL"))%>&nbsp <em>
                        <a id="BriefLink" runat="server" visible='<%# IsTypeBriefs(Eval("FK_ArticleType"))%>' href='<%# CheckImageURL(Eval("LinkURL"), Eval("PK_Article"))%>' target="_blank">
                            <img src="/_images/icon_pdf.gif" alt="Download Brief in PDF Format" />
                        </a>
                        <%# Eval("Journal")%></em> &nbsp
                    <%# Eval("Citation")%>
                                </div>
                                <div class="list_image_wrapper">
                                    <a href="/view-questions-topics/questions-by-article.aspx?PK_Article=<%# Server.UrlEncode(Eval("PK_Article")) %>">
                                        <img align="right" src="/_images/icon-quest.gif" alt="View related questions" title="View related questions" border="1" />
                                    </a>
                                </div>
                            </div>
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>





                </div>
            </div>
        </section>
    </div>
</asp:Content>

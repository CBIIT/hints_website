<%@ Page Title="Geographic Maps | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="geographic-data-maps.aspx.vb" Inherits="questionsfolder_geographic_data_maps" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="Geographic Maps | HINTS" />
    <meta name="Description" content="GIS maps using HINTS data provide a visual representation of possible geographic relationships in HINTS cancer-related knowledge variables. " />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">
                    <h1>HINTS Knowledge Maps</h1>



                    <p>New HINTS Knowledge Maps are currently being developed. This page will be updated in the near future.</p>
                 <%--   <p>
                        GIS isopleth maps visually represent a large number of data points in a “weather
            map” fashion. GIS maps using HINTS data provide a visual representation of possible
            geographic relationships in HINTS cancer-related knowledge variables. Because of
            instability in some state values from relatively small sample sizes, the maps are
            not intended to provide specific state-level estimates of HINTS variables; instead,
            they are meant to illustrate regional differences.
                    </p>
                    <asp:Repeater ID="DL_AllMaps" runat="server">
                        <ItemTemplate>
                            <asp:Label ID="SectionNameLabel" runat="server" Text='<%# Eval("SectionName") %>' Visible="false" />
                            <asp:Label ID="QuestionIDLabel" runat="server" Text='<%# Eval("PK_Question") %>' Visible="false" />
                            <asp:Label ID="QuestionDetailsIDLabel" runat="server" Text='<%# Eval("PK_QuestionDetails") %>' Visible="false" />
                            <asp:Label ID="KnowledgeMap1Label" runat="server" Text='<%# Eval("KnowledgeMap1") %>' Visible="false" />
                            <asp:Label ID="KnowledgeMap2Label" runat="server" Text='<%# Eval("KnowledgeMap2") %>' Visible="false" />
                            <asp:Label ID="MapAltTextLabel" runat="server" Text='<%# Eval("MapAltText") %>' Visible="false" />
                            <asp:Label ID="DatasetLabel" runat="server" Text='<%# Eval("FK_Cycle") %>' Visible="false" />
                            <asp:Label ID="Section_IDLabel" runat="server" Text='<%# Eval("PK_Section") %>' Visible="false" />

                            <div id="item_left">
                                <asp:HyperLink ID="lnkQuesNum" runat="server" Text='<%# Eval("Question_Num") %>'
                                    NavigateUrl='<%# Eval("PK_QuestionDetails", "/view-questions-topics/map_details.aspx?qdid={0}") %>' />
                            </div>

                            <div id="item_right" style="float: left">
                                <asp:Label ID="Question_Wording_ShortLabel" runat="server"
                                    Text='<%# Eval("Question") %>' />
                            </div>
                            <br style="clear: both; line-height: 2.5em;" />
                        </ItemTemplate>
                    </asp:Repeater>--%>


                </div>
            </div>
        </section>
    </div>
</asp:Content>



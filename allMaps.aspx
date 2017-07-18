<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="allMaps.aspx.vb" Inherits="allMaps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <h1>
            HINTS Knowledge Maps</h1>
        <p>
            GIS isopleth maps visually represent a large number of data points in a “weather
            map” fashion. GIS maps using HINTS data provide a visual representation of possible
            geographic relationships in HINTS cancer-related knowledge variables. Because of
            instability in some state values from relatively small sample sizes, the maps are
            not intended to provide specific state-level estimates of HINTS variables; instead,
            they are meant to illustrate regional differences.
        </p>
        <asp:repeater ID="DL_AllMaps" runat="server">
            <ItemTemplate>
                <asp:Label ID="SectionNameLabel" runat="server" Text='<%# Eval("SectionName") %>' Visible="false" />
                <asp:Label ID="QuestionIDLabel" runat="server" Text='<%# Eval("PK_Question") %>' Visible="false" />
                <asp:Label ID="QuestionDetailsIDLabel" runat="server" Text='<%# Eval("PK_QuestionDetails") %>' Visible="false" />
                <asp:Label ID="KnowledgeMap1Label" runat="server" Text='<%# Eval("KnowledgeMap1") %>' Visible="false" />
                <asp:Label ID="KnowledgeMap2Label" runat="server" Text='<%# Eval("KnowledgeMap2") %>' Visible="false" />
                <asp:Label ID="MapAltTextLabel" runat="server" Text='<%# Eval("MapAltText") %>' Visible="false" />
                <asp:Label ID="DatasetLabel" runat="server" Text='<%# Eval("FK_Cycle") %>' Visible="false" />
                <asp:Label ID="Section_IDLabel" runat="server" Text='<%# Eval("PK_Section") %>' Visible="false" />
                
                <div id = "item_left">
                <asp:HyperLink ID="lnkQuesNum" runat="server" Text='<%# Eval("Question_Num") %>' 
                        NavigateUrl='<%# Eval("PK_QuestionDetails", "knowledge_maps.aspx?qdid={0}") %>' />
                </div>

                <div id = "item_right" style="float:left">
                <asp:Label ID="Question_Wording_ShortLabel" runat="server" 
                        Text='<%# Eval("Question") %>' />
                </div>
                <br style="clear:both; line-height:2.5em;" />
            </ItemTemplate>
        </asp:repeater>
        
</asp:Content>


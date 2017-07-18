<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="sections.aspx.vb" Inherits="sections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script type="text/javascript" src='_scripts/faq_accordian.js'></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>What Does Hints Tell Us About... All Topics</h1>
        <asp:Repeater ID="rptTopics" runat="server">
              <HeaderTemplate>
                <div class="accordion">
                </HeaderTemplate>
        
                <ItemTemplate>
                    <div class="accordion-section">
                        <a class="accordion-section-title" href='#accordion-<%# Eval("PK_Section")%>'><%# EVAl("SectionName") %></a>
                       
                        <div id='accordion-<%# Eval("PK_Section")%>' class="accordion-section-content topics">

                            <!-- Link to HINTS Question Search page with Section Name selected by topic-->
                            <span><a href='advanced.aspx?tpc=<%# Eval("PK_Section")%>'>Read Related Questions</a> | </span> 
                            <!-- Link to HINTS Briefs page with Section Name selected by topic-->
                            <span><a href='briefs.aspx?tpc=<%# EVAl("PK_Section") %>'>Read Related Briefs</a></span> 
                            <!-- Link to HINTS Publications page with Section Name selected by topic-->
                            <span><a href='publications.aspx?tpc=<%# EVAl("PK_Section") %>'> | Read Related Publications</a></span> 

                        </div>
                        <!--end .accordion-section-content-->
                    </div>
                </ItemTemplate>
    
                <FooterTemplate>
                    </div>
                </FooterTemplate>
             </asp:Repeater>





</asp:Content>


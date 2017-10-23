<%@ Control Language="VB" AutoEventWireup="false" CodeFile="articles.ascx.vb" Inherits="_usercontrols_articles" %>
       
<div id ="results_wrapper" class=" col_6" runat="server">
    <div  id="PBResults" class="topic_list" runat="server">
       
 <asp:Repeater ID="RPTR_Pubs" runat="server">
        <ItemTemplate>

            <%# AddGroupingRowIfYearHasChanged(Eval("PubYear"))%>

            <div class="list_wrapper">
                <div id ="articles_list" class="col_3">
                            <asp:PlaceHolder ID="BriefsLink" Visible=<%# IsTypeBriefs(Eval("FK_ArticleType"))%> runat="server">
                               <strong>  <a runat="server" href='<%# "~/" & Eval("FileName")%>'>
                            <%# Eval("Title")%></a> 
                        <a ID="BriefLink" runat="server" href='<%# "~/" & Eval("LinkURL")%>' target ="_blank"> <img src="/_images/icon_pdf.gif" alt="Download Brief in PDF Format"/> </a>
                              <br/>  </strong> </asp:PlaceHolder>
                            
                            <asp:PlaceHolder ID="BriefsImage" Visible=<%# IsTypeBriefs(Eval("FK_ArticleType"))%> runat="server"> <img src='<%# "/" & Eval("ImageURL")%>' alt='<%#Eval("AltText")%>' class="briefsThumb" /> </asp:PlaceHolder>
                               
                            <asp:PlaceHolder ID="BriefsPurpose" Visible=<%# IsTypeBriefs(Eval("FK_ArticleType"))%> runat="server"><%#Eval("Purpose")%> <br /> </asp:PlaceHolder> 
                           <div id="briefs_year"> 
                           <asp:PlaceHolder ID="BriefsMonthYear" Visible=<%# IsTypeBriefs(Eval("FK_ArticleType"))%> runat="server"> <strong><%# Eval("PubMonth")%>&nbsp;<i><%# Eval("PubYear")%></i></strong> </asp:PlaceHolder>
                            </div>  
                            <asp:PlaceHolder ID="Authors" Visible=<%# IsTypePubOrPres(Eval("FK_ArticleType"))%> runat="server"><%# Eval("Authors")%>&nbsp</asp:PlaceHolder>
                            <asp:PlaceHolder ID="Year" Visible=<%# IsTypePubOrPres(Eval("FK_ArticleType"))%> runat="server"><%# Eval("PubYear")%>&nbsp </asp:PlaceHolder>
                            <asp:PlaceHolder ID="URL" Visible=<%# IsTypePubOrPres(Eval("FK_ArticleType"))%> runat="server">   <%# CheckifURLAvailable(Eval("Title"), Eval("LinkURL"))%>&nbsp</asp:PlaceHolder>
                            <asp:PlaceHolder ID="Journal" Visible=<%# IsTypePubOrPres(Eval("FK_ArticleType"))%> runat="server"> <em> <%# Eval("Journal")%></em> &nbsp </asp:PlaceHolder>
                            <asp:PlaceHolder ID="Citation" Visible=<%# IsTypePubOrPres(Eval("FK_ArticleType"))%> runat="server"> <%# Eval("Citation")%> <br/><br/></asp:PlaceHolder>
               </div>
                </div>
              
        </ItemTemplate>
        </asp:Repeater> 
        </div>
      <div id ="Noresult" runat="server">
            <h1> No results found. Please modify your search criteria.</h1>
          </div>

 </div>
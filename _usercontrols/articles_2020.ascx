<%@ Control Language="VB" AutoEventWireup="false" CodeFile="articles_2020.ascx.vb" Inherits="_usercontrols_articles_2020" %>


<asp:PlaceHolder ID="results_wrapper" runat="server">
    <asp:PlaceHolder ID="PBResults" runat="server">
        <div class="container fullwidth">
            <div class="row">


                <asp:Repeater ID="RPTR_Pubs" runat="server">
                    <ItemTemplate>



                        <div class="col-6 brieflistingbox">
                                <strong><a runat="server" href='<%# "~/" & Eval("FileName")%>'>
                                    <%# Eval("Title")%></a>
                                    <a id="BriefLink" runat="server" href='<%# "~/" & Eval("LinkURL")%>' target="_blank">
                                        <img src="/_images/icon_pdf.gif" alt="Download Brief in PDF Format" />
                                    </a>
                                    <br />
                                </strong>

                                <img src='<%# "/" & Eval("ImageURL")%>' alt='<%#Eval("AltText")%>' class="briefsThumb" />
                          

                          <%#Eval("Purpose")%>
                                <br />
                            <div id="briefs_year">
                              <strong><%# Eval("PubMonth")%>&nbsp;<i><%# Eval("PubYear")%></i></strong>
                            </div>
                            
                        </div>

                        
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

    </asp:PlaceHolder>
</asp:PlaceHolder>
<div id="Noresult" runat="server">
    <h1>No results found. Please modify your search criteria.</h1>
</div>


<%@ Control Language="VB" AutoEventWireup="false" CodeFile="results.ascx.vb" Inherits="_usercontrols_results" %>




<asp:PlaceHolder ID="PLC_results" Visible="false" runat="server">
    
    <div class="dv_countcontainer">
        <p style="font-size: 14px;margin-top:5px;"><strong style="font-size: 24px;"><asp:Literal ID="LIT_Count" runat="server"></asp:Literal></strong> Items found.</p>
    </div>
    <div class="clearfix"></div>

    <asp:PlaceHolder ID="PLC_Legend" runat="server" Visible="false">
        <div class="dv_question legend">
            <h2 style="margin-top:0px">Legend</h2>
            <asp:Repeater ID="RPTR_CyclesLegend" runat="server">
                <ItemTemplate>
                    <div>
                        <p><span class="btn green"><%# Eval("CycleName")%></span> = <%# Eval("DisplayName")%> (<%# Eval("DisplayYear")%>)</p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <div>
                <p><span class="btn grey">&nbsp;&nbsp;&nbsp;</span> Response not available</p>
            </div>
        </div>
    </asp:PlaceHolder>
    
    <div class="col_3">
        <p><strong>*Select from the green boxes below to view survey responses.</strong></p>
    </div>

    <div class="dv_question results" style="clear: both;">

        <asp:Repeater ID="RPTR_Results" runat="server">
            <ItemTemplate>
                <asp:PlaceHolder ID="PLC_header" Visible='<%# CheckVisHeader(Eval("FK_Section"))%>'
                    runat="server">
                    <div class="dv_resultsheader">
                        <strong><%# Eval("SectionName")%></strong>
                    </div>
                </asp:PlaceHolder>

                <div class="dv_questionwrapper">
                    <div class="results_leftcolumn">
                        <%# Eval("Question")%>
                    </div>
                    <div class="results_rightcolumn">
                        <asp:Repeater ID="RPTR_Cycles" DataSource='<%# LoopCyclesPerQuestion(Eval("PK_Question")) %>'
                            runat="server">
                            <ItemTemplate>
                                <div class='<%# getColorCSS(Eval("PK_QuestionDetails"))%>'>
                                    <a href='<%# getURL(Eval("PK_QuestionDetails"),Eval("FK_Question"),Eval("PK_Cycle"))%>'>
                                        <%# Eval("Cyclename")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:PlaceHolder ID="PLC_AllYearsDiv" Visible='<%# CheckAllYearsVis(Eval("TotalIncludeCount"))%>' runat="server">
                        <div class='allyearcycle'>
                            <a href="question-details.aspx?qid=<%# (Eval("PK_Question"))%>">All</a>
                        </div>
                            </asp:PlaceHolder>
                    </div>

                    <div class="col_6">
                        <a href="javascript:void(0)" onclick="myJsFunc('#dvarticlelisting<%# Eval("PK_Question")%>');"
                            class='<%# ShowHideClass(Eval("TotalArticles"))%>'>Read Related Articles</a>
                        <div id='dvarticlelisting<%# Eval("PK_Question")%>' class="dvadvancedlistingbriefs">
                            <asp:Repeater ID="Repeater1" DataSource='<%# GetBriefsArticles(Eval("PK_Question"),1) %>'
                                runat="server">
                                <ItemTemplate>
                                    <a href='<%# Eval("LinkURL")%>' target="_blank">
                                        <%# Eval("Title")%></a>

                                    <a href="questions-by-article.aspx?PK_Article=<%# Server.UrlEncode(Eval("PK_Article")) %>">
                                        <img src="_images/icon-quest.gif" alt="View questions related to this article" title="View questions related to this article" border="0" />
                                    </a>

                                    <br />
                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <br />
                        <br />
                        <a href="javascript:void(0)" onclick="myJsFunc('#dvbrieflisting<%# Eval("PK_Question")%>');"
                            class='<%# ShowHideClass(Eval("TotalBriefs"))%>'>Read HINTS Briefs</a>
                        <div id='dvbrieflisting<%# Eval("PK_Question")%>' class="dvadvancedlistingbriefs">
                            <asp:Repeater ID="Repeater2" DataSource='<%# GetBriefsArticles(Eval("PK_Question"),2) %>'
                                runat="server">
                                <ItemTemplate>

                                    <a runat="server" href='<%# "~/" & Eval("FileName")%>'>
                                        <%# Eval("Title")%>  </a>

                                    <a id="BriefLink" runat="server" href='<%# "~/" & Eval("LinkURL")%>' target="_blank">
                                        <img src="_images/icon_pdf.gif" alt="Download Brief in PDF Format" />
                                    </a>
                                                 <a href="questions-by-article.aspx?PK_Article=<%# Server.UrlEncode(Eval("PK_Article")) %>">
                                        <img src="_images/icon-quest.gif" alt="View questions related to this article" title="View questions related to this brief" border="0" />
                                    </a> <br />
                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>


                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>
</asp:PlaceHolder>

<script language="javascript" type="text/javascript">

    function myJsFunc(divid) {
        $(divid).toggle();
    }
</script>

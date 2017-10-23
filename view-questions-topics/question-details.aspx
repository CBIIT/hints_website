<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="question-details.aspx.vb" Inherits="questionsfolder_question_details" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="/Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="/Content/buttons.css" rel="stylesheet" />
    <link href="/Content/app.css" rel="stylesheet" />
    <script type="text/javascript" src='/_scripts/detailspage/ws_jsdetails_2017_09_06.js'></script>
    <style type="text/css">
        body {
            font-size: 1.2em !important;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>

    <div class="flex-container">
        <div class="flex" id="cycle-sidebar">
            <input onclick="ChangeCycleClicked(0)" type="button" id="btn_AllCycles" value="All Years" />
            <asp:Repeater ID="RPTR_CycleButtons" runat="server">
                <ItemTemplate>
                    <input id='BTN_Cycle_<%# Eval("PK_Cycle")%>' type="button" class='<%# CheckActive(Eval("PK_Cycle")) %>' onclick='ChangeCycleClicked(<%# Eval("PK_Cycle") %>)' value="<%# Eval("DDLDisplay") %>" />
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div class="flex cycle-main" id="content">
            <div class="main response">
                <%--<h1 id="lbl_question" class="question"></h1>--%>
                <div class="question-section">
                    <h2 class="question"><asp:Literal ID="LIT_QuestionText" runat="server"></asp:Literal></h2>
                    <a href="javascript:void(0)" id="question-trigger" class="btn-updated-dark">Select a New Question</a>
                </div>
                <div class="question-modal">
                    <div class="question-modal-inner">
                        Select Section: <br/>
                        <asp:DropDownList ID="DDL_Sections" runat="server" DataValueField="PK_Section" DataTextField="SectionName"></asp:DropDownList>
                        
                        Select Question: <br/>
                        <select id="DDL_Questions"></select> 

                        <div id="question-label">Change Question to:</div>
                        <div id="question-filler"></div>
                        
                        <input id="BTN_GotoNewQuestion" type="button" onclick="GoToNewQuestion()" value="Go To New Question" />
                        <a href="javascript:void(0)" class="btn-updated-dark close-modal-question">Cancel</a>
                    </div>
                </div>
                <div id="allcycles_placeholdertext">
                    <p style="font-size:1.3em;">You are viewing All Cycles. There is no data table available for all years, but please see the visualization below.</p>
                </div>

                <div id="charts" style="display:none;">

                    <div class="table-responsive">
                        <table class="table" id="table_data">
                            <colgroup>
                                <col span="1" />
                                <col span="1" />
                                <col span="2" />
                                <col span="2" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col" colspan="2"><span class="emptyClass">Responses</span></th>
                                    <th scope="col" colspan="2">ESTIMATED US ADULT POPULATION</th>
                                    <th scope="col" colspan="2">SURVEY RESPONDENTS</th>
                                </tr>
                                <tr>
                                    <th scope="col"><span class="emptyClass">Display Order</span></th>
                                    <th scope="col" class="leftAlign">Response</th>
                                    <th scope="col">Number</th>
                                    <th scope="col">Percentage</th>
                                    <th scope="col">Responses</th>
                                    <th scope="col">Percentage</th>
                                </tr>
                            </thead>
                            <!--tfoot>
                            </tfoot-->
                            <tbody id="tbdy_results">
                        
                        
                                <asp:PlaceHolder ID="PLC_InvalidResponses" runat="server" Visible="false">
                                    <tr>
                                        <td class="col-1">&nbsp;</td>
                                        <td class="col-2 leftAlign">Invalid Responses</td>
                                        <td class="col-3">&nbsp;</td>
                                        <td class="col-4">&nbsp;</td>
                                        <td class="col-4">
                                            <asp:Literal ID="LIT_InvalidResponses" runat="server"></asp:Literal></td>
                                        <td class="col-4">&nbsp;</td>
                                    </tr>
                                </asp:PlaceHolder>
                        
                            </tbody>
                        </table>
                    </div>

                </div>
                <!--  <div id="charts"> -->

            </div>
            <!--<div class="main response">-->

        </div>
    <!--<div id="content">-->
    </div>

    <br/>
    <br/>

    <div class="chart-options-row">
        <div class="chart-options-trigger" tabindex="0">
            <div class="chart-options-container">
                <span class="select-chart-type">Select Chart Type</span>
                <ul class="chart-options chart-list">
                    <!-- DO NOT BREAK LI'S TO A NEW LINE, NEEDED FOR FORMATTING REASONS -->
                    <li id="bar-chart-li" class="active-chart"><input type="button" id="btn_BarChartType" onclick='ChangeChartTypeClicked("bar2d")' value="Bar" /></li><li id="pie-chart-li"><input type="button" id="btn_PieChartType" onclick='    ChangeChartTypeClicked("pie3d")' value="Pie" /></li><li id="line-chart-li"><input type="button" id="btn_LineChartType" onclick='    ChangeChartTypeClicked("msline")' value="Line" /></li>
                </ul>
                <ul class="chart-options percentages-list">
                    <!-- DO NOT BREAK LI'S TO A NEW LINE, NEEDED FOR FORMATTING REASONS -->
                    <li id="btn_Est_LI" class="active-percentage"><input type="button" onclick='ChangeSummaryTypeClicked(1)' value="Estimated Percentage" /></li><li  id="btn_SAMPLE_LI"><input type="button" onclick='    ChangeSummaryTypeClicked(2)' value="Sample Percentage" /></li>
                </ul>
            </div>
        </div>
    </div>



    <div class="row">
         <div class="col-sm-12 chart-pane">
            <div id="chart-container"></div>

            <div class="modal fade" id="exportModalPopup">
                <div class="modal-dialog">
                    <div class="modal-content jumbo-dropdown-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
                            <h3 class="modal-title">Export Chart</h3>
                        </div>
                        <div class="modal-body">
                            <div id="chart-container-export-only"></div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group dropup">
                                <button id="exportSelector" type="button" role="group" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Export <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a id="exportToPdfLink" href="#">PDF</a></li>
                                    <li><a id="exportToJpegLink" href="#">JPEG</a></li>
                                    <li><a id="exportToPngLink" href="#">PNG</a></li>
                                    <li><a id="exportToSvgLink" href="#">SVG</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-12">            
            <div class="export-pane text-center">
                <div class="btn-group">
                    <button id="exportModalPopupButton" type="button" class="btn btn-default btn-updated-dark" data-toggle="modal" data-target="#exportModalPopup">Export</button>
                </div>
            </div>
        </div>
    </div>





    <!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-->
    <div id="div_surveynotes" class="notes" style="clear: both; display:none;">
        <div class="note-head">
            Survey Notes
        </div>
        <div class="note-line">
            <div class="shim-a">Download:</div>
            <div class="shim-b">
                <span id="LIT_SurveyNotesText"></span>
                (English):
                                <a id="HYP_SurveyNotes" target="_blank">PDF</a>
            </div>
        </div>
        <div class="note-line">
            <div class="shim-a">Who was asked:</div>
            <div class="shim-b">
                <span id="LIT_Criteria_DESC"></span>
            </div>
        </div>

        <div class="note-line">
            <div class="shim-a">Data collection method:</div>
            <div class="shim-b">
                <span id="LIT_DataCollectionMethod" />
            </div>
        </div>

        <div class="note-line">
            <div class="shim-a">Question source:</div>
            <div class="shim-b">
                <div id="LIT_QuestionSource" ></div>
            </div>
        </div>
        <div class="note-line">
            <div class="shim-a">Dataset:</div>
            <div class="shim-b">
                <span id="LIT_CycleDisplay" />
            </div>
        </div>


        <div class="note-line" id="dv_LIT_Notes_wrapper">
            <div class="shim-a">Additional Notes:</div>
            <div class="shim-b">
                <asp:Literal ID="LIT_Notes" runat="server"></asp:Literal>
            </div>
        </div>


        <div class="note-line">
            <div class="shim-a">Briefs that use this question:</div>
            <div class="shim-b">

                <span id="LIT_NoBriefs">None</span>
                <a target="_blank" id="HYP_Briefs_ByQuestion">View related briefs</a>

            </div>
        </div>

        <div class="note-line">
            <div class="shim-a">Articles that use this question:</div>
            <div class="shim-b">
                <span id="LIT_NoArticles">None</span>
                <a target="_blank" id="HYP_articles_ByQuestion">View related articles</a>
            </div>
        </div>
        <div class="note-line">
            <div class="shim-a">U.S. map from this question: </div>
            <div class="shim-b">
                <span id="LIT_NoMap">None</span>
                <a id="HYP_KnowledgeMap">View Map</a>
            </div>
        </div>

        <a class="back-to-top" href="#"><img src="/_images/back-to-top.png" alt="back to top">Back to top</a>
    </div>
    <!--<div id="div_surveynotes" -->

    <!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-->





    <div id="dv_AllYears" style="display:none;">
        <div class="notes">
            <div class="note-head">
                <a name="Surveynote">Survey Notes (All Years)</a>
            </div>
            <div class="note-line">
                <div class="shim-a">Trend Notes: </div>
                <div class="shim-b">
                    <asp:Literal ID="LIT_trendNotes" runat="server"></asp:Literal>
                </div>
            </div>
            <div class="table-responsive">
                <table class="survey">
                
                    <thead>
                        <tr>
                
                            <th class="shim-a" style='width: <asp:Literal id="LIT_BottomTableLeftColumnWidth" runat="server"></asp:Literal>%'>Dataset(s):</th>
                            <asp:Repeater ID="RPTR_AllDetails_BottomTable_Cycles" runat="server">
                                <ItemTemplate>
                                    <th>
                                        <asp:Literal ID="LitCycleName_Link" Text='<%# setCycleURL(Eval("FK_Question"), Eval("PK_Cycle"), Eval("CycleDisplayName"), Eval("DisplayYear"))%>' runat="server"></asp:Literal>
                                    </th>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tr>
                    </thead>
                
                
                    <tbody>
                        <tr>
                            <td class="shim-a">Question text:</td>
                            <asp:Repeater ID="RPTR_AllDetails_BottomTable_Questions" runat="server">
                                <ItemTemplate>
                                    <td><%# SetQuestionTextAllYears(Eval("Question_Num"), Eval("Question"))%></td>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tr>
                        <tr>
                            <td class="shim-a">Who was asked: </td>
                            <asp:Repeater ID="RPTR_All" runat="server" OnItemDataBound="RPTR_All_ItemDataBound">
                                <ItemTemplate>
                                    <td>
                                        <asp:Repeater ID="RPTR_AllCriteria" runat="server">
                                            <ItemTemplate>
                                                <%# GetComma(Eval("Criteria_DESC"))%>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </td>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tr>
                        <tr>
                            <td class="shim-a">Question source:</td>
                            <asp:Repeater ID="RPTR_AllDetails_BottomTable_QuestionSource" runat="server">
                                <ItemTemplate>
                                    <td><%# Eval("Source")%></td>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tr>
                    </tbody>
                </table>
            </div>


            <div class="note-line">
                <div class="shim-a">Related briefs:</div>
                <div class="shim-b">
                    <asp:Literal ID="LIT_AllNoBriefs" Visible="false" runat="server">None</asp:Literal>
                    <asp:HyperLink ID="HYP_Briefs_ByAllQuestion" Visible="false" runat="server">View related articles</asp:HyperLink>
                </div>
            </div>


            <div class="note-line">
                <div class="shim-a">Related articles:</div>
                <div class="shim-b">
                    <asp:Literal ID="LIT_AllNoArticles" Visible="false" runat="server">None</asp:Literal>
                    <asp:HyperLink ID="HYP_articles_ByAllQuestion" Visible="false" runat="server">View related articles</asp:HyperLink>
                </div>
            </div>
        </div>


    </div>

    <script type="text/javascript" src="/_scripts/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="/_scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/_scripts/fusioncharts.js"></script>
    <script type="text/javascript" src="/_scripts/fusioncharts.charts.js"></script>
    <script type="text/javascript" src="/_scripts/fusioncharts.theme.fint.js"></script>




</asp:Content>





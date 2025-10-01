<%@ Page Title="" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="question-detail.aspx.vb" Inherits="view_questions_question_detail" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="/Content/bootstrap-theme.min.css?v=2017_11_13" rel="stylesheet" />
    <link href="/Content/buttons.css?v=2017_11_13" rel="stylesheet" />
    <link href="/Content/app.css?v=2017_11_13" rel="stylesheet" />
    <script type="text/javascript" src='/_scripts/detailspage/ws_jsdetails_2023_07_08.js'></script>
    <script type="text/javascript" src='/_scripts/detailspage/question-detail.js'></script>

    <link rel="stylesheet" href="/css/questions.css?v=2020_05_28">
    <script type="text/javascript" src='/_scripts/jquery-3.7.1.min.js'></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<div style="padding: 10px 20px; background: #1f7a21; color: #ffffff">
    <p>Because of a lapse in government funding, the information on this website may not be up to date, transactions submitted via the website may not be processed, and the agency may not be able to respond to inquiries until appropriations are enacted. The NIH Clinical Center (the research hospital of NIH) is open. For more details about its operating status, please visit <a href="https://cc.nih.gov" target="_blank" style="color: #ffffff">cc.nih.gov</a>. Updates regarding government operating status and resumption of normal operations can be found at <a href="https://www.opm.gov/policy-data-oversight/snow-dismissal-procedures/current-status/" target="_blank" style="color: #ffffff">opm.gov</a>.</p>
</div>


        <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">

                                        <div id="sitewide-alert" class="alert alert-danger text-center" role="alert">
                        <p>Data visualization exports for HINTS items are temporarily not available. We are working to upgrade the system now and do not expect an extended disruption.</p>
                    </div>


    <asp:PlaceHolder runat="server" Visible="true">


    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
    <div class="container fullwidth">
        <div class="row">
            <div class="col-12 col-3" id="cycle-sidebar">
                <input onclick="ChangeCycleClicked(0)" type="button" id="btn_AllCycles" value="All Years" />
                <asp:Repeater ID="RPTR_CycleButtons" runat="server">
                    <ItemTemplate>
                        <input id='BTN_Cycle_<%# Eval("PK_Cycle")%>' type="button" class='<%# CheckActive(Eval("PK_Cycle")) %>' onclick='ChangeCycleClicked(<%# Eval("PK_Cycle") %>)' value="<%# Eval("DDLDisplay") %>" />
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="col-12 col-9 cycle-main" id="content">
                <div class="main response">
                    <%--<h1 id="lbl_question" class="question"></h1>--%>
                    <div class="question-section">
                        <h2 class="question">
                            <asp:Literal ID="LIT_QuestionText" runat="server"></asp:Literal></h2>
                        <a href="javascript:void(0)" id="question-trigger" class="btn-updated-dark">Select a New Question</a>
                    </div>
                    <div class="question-modal">
                        <div class="question-modal-inner">
                            Select Section:
                            <br />
                            <asp:DropDownList ID="DDL_Sections" runat="server" DataValueField="PK_Section" DataTextField="SectionName"></asp:DropDownList>

                            Select Question:
                            <br />
                            <select id="DDL_Questions"></select>

                            <div id="question-label">Change Question to:</div>
                            <div id="question-filler"></div>

                            <input id="BTN_GotoNewQuestion" type="button" onclick="GoToNewQuestion()" value="Go To New Question" />
                            <a href="javascript:void(0)" class="btn-updated-dark close-modal-question">Cancel</a>
                        </div>
                    </div>
                    <div id="allcycles_placeholdertext">
                        <p style="font-size: 1.3em;">You are viewing All Cycles. There is no data table available for all years, but please see the visualization below.</p>
                    </div>

                    <div id="charts" style="display: none;">

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
    </div>
    <br />
    <br />

    <div class="chart-options-row">
        <div class="chart-options-trigger" tabindex="0">
            <div class="chart-options-container">
                <span class="select-chart-type">Select Chart Type</span>
                <ul class="chart-options chart-list">
                    <!-- DO NOT BREAK LI'S TO A NEW LINE, NEEDED FOR FORMATTING REASONS -->
                    <li id="bar-chart-li" class="active-chart">
                        <input type="button" id="btn_BarChartType" onclick='ChangeChartTypeClicked("bar2d")' value="Bar" /></li>
                    <li id="pie-chart-li">
                        <input type="button" id="btn_PieChartType" onclick='    ChangeChartTypeClicked("pie3d")' value="Pie" /></li>
                    <li id="line-chart-li">
                        <input type="button" id="btn_LineChartType" onclick='    ChangeChartTypeClicked("msline")' value="Line" /></li>
                </ul>
                <ul class="chart-options percentages-list">
                    <!-- DO NOT BREAK LI'S TO A NEW LINE, NEEDED FOR FORMATTING REASONS -->
                    <li id="btn_Est_LI" class="active-percentage">
                        <input type="button" onclick='ChangeSummaryTypeClicked(1)' value="Estimated Percentage" /></li>
                    <li id="btn_SAMPLE_LI">
                        <input type="button" onclick='    ChangeSummaryTypeClicked(2)' value="Sample Percentage" /></li>
                </ul>
            </div>
        </div>
    </div>



    <div class="row">
        <div class="col-sm-12 chart-pane">
            <div id="allchart_instructions">Click response options in key to remove or add elements to the chart</div>
            <div id="piechart_instructions">Click and drag pie chart to rotate</div>
            <div id="chart-container"></div>

            <div class="modal fade" id="exportModalPopup" aria-labelledby="exportModalPopupLabel">
                <div class="modal-dialog">
                    <div class="modal-content jumbo-dropdown-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">&times;</button>
                            <h3 class="modal-title">Export Chart</h3>
                        </div>
                        <div class="modal-body">
                            <div id="chart-container-export-only"></div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group dropup">
                                <button id="exportSelector" type="button" role="group" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                    <button id="exportModalPopupButton" type="button" class="btn btn-default btn-updated-dark" data-bs-toggle="modal" data-bs-target="exportModalPopup">Export</button>
                </div>
            </div>
        </div>
    </div>





    <!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-->
    <div id="div_surveynotes" class="notes" style="clear: both; display: none;">
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
                <div id="LIT_QuestionSource"></div>
            </div>
        </div>
        <div class="note-line">
            <div class="shim-a">Dataset:</div>
            <div class="shim-b">
                <span id="LIT_CycleDisplay" />
            </div>
        </div>


        
        <div class="note-line" id="dv_LIT_variablename_wrapper">
            <div class="shim-a">Variable Name:</div>
            <div class="shim-b">

                <span id="LIT_variablename">variablename</span>

            </div>
        </div>

        <div class="note-line" id="dv_LIT_Notes_wrapper">
            <div class="shim-a">Additional Notes:</div>
            <div class="shim-b">

                <span id="LIT_Notes">None</span>

            </div>
        </div>




<!--         <div class="note-line">
            <div class="shim-a">U.S. map from this question: </div>
            <div class="shim-b">
                <span id="LIT_NoMap">None</span>
                <a id="HYP_KnowledgeMap">View Map</a>
            </div>
        </div> -->

        <a class="back-to-top" href="#">
            <img src="/_images/back-to-top.png" alt="back to top" />Back to top</a>
    </div>
    <!--<div id="div_surveynotes" -->

    <!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-->





    <div id="dv_AllYears" style="display: none;">
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

                            <th class="shim-a" style='width: <asp:Literal id="LIT_BottomTableLeftColumnWidth" runat="server"></asp:Literal>%'>Data-set(s):</th>
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


         


        </div>


    </div>

    <script type="text/javascript" src="/_scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/_scripts/fusioncharts.js"></script>
    <script type="text/javascript" src="/_scripts/fusioncharts.charts.js"></script>
    <script type="text/javascript" src="/_scripts/fusioncharts.theme.fint.js"></script>



    </asp:PlaceHolder>






                </div>
            </div>
        </section>
    </div>
</asp:Content>




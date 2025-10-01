<%@ Page Title="View HINTS questions | HINTS"  Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="all-hints-questions.aspx.vb" Inherits="view_questions_all_hints_questions" %>


<%@ Register Src="~/_usercontrols/results.ascx" TagName="results" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="View HINTS questions | HINTS" />
    <meta name="Description" content="View estimated U.S. population values, charts and data visualizations, and trends over time for each HINTS question and browse HINTS questions by topic." />



    <link rel="stylesheet" href="/css/questions.css?v=2025_05_19">
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

                    <h1>All HINTS Questions</h1>
                    <p>
                        This section provides summary data from
                        <asp:Literal ID="LIT_CycleList" runat="server"></asp:Literal>
                        surveys including summary sample data and estimated U.S. population values, charts, and trends.
       <a href="/data/survey-instruments.aspx">Click here to view all Survey Instruments. </a>


                    </p>

                    <p><strong>Select one or more below. Please leave all the boxes unchecked if you want to see results for all sections. </strong></p>
                    <div class="dv_question">
                        <asp:CheckBoxList summary="Layout for Categories" RepeatColumns="4" ID="CKList_Categories" DataValueField="PK_Section"
                            DataTextField="SectionName" runat="server">
                        </asp:CheckBoxList>
                    </div>

                    <p><strong>Select one or more below. Please leave all the boxes unchecked if you want to see results for all cycles. </strong></p>

                    <div class="dv_question">
                        <asp:CheckBoxList summary="Layout for Cycles" ID="CKLIst_Cyle" DataTextField="DisplayName" DataValueField="PK_Cycle"
                            runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
                        </asp:CheckBoxList>
                    </div>

                    <div class="dv_controls">
                        <div>
                            <asp:Button ID="BTN_Search_page" CausesValidation="false" class="btn-updated-dark" runat="server" Text="Search" /></div>
                        <div>
                            <asp:Button ID="BTN_Clear" CausesValidation="false" class="btn-updated-dark" runat="server" Text="Clear" /></div>
                    </div>
                    <uc1:results ID="UC_Results" runat="server" />


                </div>
            </div>
        </section>
    </div>
</asp:Content>


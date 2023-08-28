<%@ Page Title="View HINTS questions | HINTS"  Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="all-hints-questions.aspx.vb" Inherits="view_questions_all_hints_questions" %>


<%@ Register Src="~/_usercontrols/results.ascx" TagName="results" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="View HINTS questions | HINTS" />
    <meta name="Description" content="View estimated U.S. population values, charts and data visualizations, and trends over time for each HINTS question and browse HINTS questions by topic." />



    <link rel="stylesheet" href="/css/questions.css?v=2022_02_11">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">
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


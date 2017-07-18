<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="false"
    CodeFile="questions.aspx.vb" Inherits="questions" %>

<%@ Register Src="~/_usercontrols/results.ascx" TagName="results" TagPrefix="uc1" %>
<%@ Register Src="~/_usercontrols/sub_unsub.ascx" TagPrefix="uc1" TagName="sub_unsub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    
    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            //Hide modal box
            $('#closeModal_SubUnSub').click(
                function () { $('.modalDialog_SubUnSub').hide(); }
            );
        });

        function OpenModalSubUnSub()
        {
            $('.modalDialog_SubUnSub').show();
        }
    </script>
    

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="openModal" class="modalDialog_SubUnSub">
        <div>
            <a href="javascript:void(0)" title="Close" id="closeModal_SubUnSub">X</a>
            <uc1:sub_unsub runat="server" ID="sub_unsub" />
        </div>
    </div>

    <h1>All HINTS Questions</h1>
    <p><a href="javascript:void(0)" onclick="javascript:OpenModalSubUnSub();">Subscribe for latest announcments.</a></p>
    <p>This section provides summary data from HINTS 1, HINTS 2, HINTS 3, HINTS 4 Cycle 1, HINTS 4 Cycle 2, HINTS 4 Cycle 3, HINTS 4 Cycle 4, and HINTS-FDA surveys including summary sample data and estimated U.S. population values, charts, and trends.
       <a href="/instrument.aspx" > Click here to view all Survey Instruments. </a>
    </p>
   
    <p><strong>Select one or more below. Please leave all the boxes unchecked if you want to see results for all sections. </strong></p>
      <div class="dv_question">
        <asp:CheckBoxList summary="Layout for Categories" RepeatColumns="4" ID="CKList_Categories" DataValueField="PK_Section"
            DataTextField="SectionName" runat="server">
        </asp:CheckBoxList>
    </div>
    
    <p><strong>Select one or more below. Please leave all the boxes unchecked if you want to see results for all cycles. </strong></p>
        
    <div class="dv_question">
        <asp:CheckBoxList summary="Layout for Cycles"  ID="CKLIst_Cyle" DataTextField="DisplayName" DataValueField="PK_Cycle"
            runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
        </asp:CheckBoxList>
    </div>

    <div class="dv_controls">
        <div><asp:Button ID="BTN_Search" CausesValidation="false" class="btn-updated-dark" runat="server" Text="Search" /></div>
        <div><asp:Button ID="BTN_Clear" CausesValidation="false" class="btn-updated-dark" runat="server" Text="Clear" /></div>
    </div>
    <uc1:results ID="UC_Results" runat="server" />
</asp:Content>

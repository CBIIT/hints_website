<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false"
    CodeFile="advanced.aspx.vb" Inherits="advanced" %>
    

<%@ Register src="~/_usercontrols/results.ascx" tagname="results" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="_css/results.css" type="text/css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" language="javascript"
        type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <a id="top"></a>
    <asp:Panel ID="PNL_Form" DefaultButton="BTN_advancedSearch" runat="server">
        <h1>
            Advanced Search</h1>
        <div id="dv_advancedsearchTitle">
            <p>
                <strong>Find Content With...</strong>
            </p>
        </div>
        <div class="FormItemWrapper">
            <div class="FormLeftItem">
                <asp:Label ID="LBL_SearchLabel"  AssociatedControlID="TXT_Searchbox" runat="server" Text="All these words:"></asp:Label>
            </div>
            <div class="FormRightItem">
                <asp:TextBox ID="TXT_SearchBox"  runat="server"></asp:TextBox>
            </div>
        </div>
        <p id="filterlinks">
            <asp:Button CssClass="ButtonLink" ID="bTN_ShowOptions" runat="server" Text="More Options..." />
            <asp:Button CssClass="ButtonLink" ID="BTN_HideOptions" runat="server" Text="Hide Options" />
        </p>
        <asp:PlaceHolder ID="PLC_Filter" runat="server">
            <div id="dvAllFilters">
                <div class="FormItemWrapper">
                    <p>
                        <strong>Then narrow your results by... </strong>
                    </p>
                </div>
                <div class="FormItemWrapper">
                    <div class="FormLeftItem">
                        <asp:Label ID="Label1" AssociatedControlID="DDL_Section" runat="server" Text="Section Name:"></asp:Label>
                    </div>
                    <div class="FormRightItem">
                        <asp:DropDownList ID="DDL_Section" DataValueField="PK_Section" DataTextField="SectionName"
                            runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
                <div id="dvadvancedCycleList" class="FormItemWrapper">
                    <div class="FormLeftItem">
                        Cycle:
                    </div>
                    <div class="FormRightItem">
                        <asp:CheckBoxList summary="Layout for Cycles" ID="CKLIst_Cyle" DataTextField="DisplayName" DataValueField="PK_Cycle"
                            runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
                        </asp:CheckBoxList>
                    </div>
                </div>
                <div class="FormItemWrapper">
                    <div class="FormLeftItem">
                        <asp:Label ID="Label2" AssociatedControlID="CK_ArticleAttached" runat="server" Text="Article(s) attached:"></asp:Label>
                    </div>
                    <div class="FormRightItem">
                        <asp:CheckBox ID="CK_ArticleAttached" runat="server" />
                    </div>
                </div>
                <div class="FormItemWrapper">
                    <div class="FormLeftItem">
                        <asp:Label ID="Label3" AssociatedControlID="CK_BriefsAttached" runat="server" Text="Brief(s) attached:"></asp:Label>
                    </div>
                    <div class="FormRightItem">
                        <asp:CheckBox ID="CK_BriefsAttached" runat="server" />
                    </div>
                </div>
                <div class="FormItemWrapper">
                    <div class="FormLeftItem">
                        <asp:Label ID="Label4" AssociatedControlID="DDL_WhoAsked" runat="server" Text="Who was asked:"></asp:Label>
                    </div>
                    <div class="FormRightItem">
                        <asp:DropDownList CssClass="DDL_WhoAskedstyle" ID="DDL_WhoAsked" DataValueField="Criteria_DESC"
                            DataTextField="Criteria_DESCShort" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </asp:PlaceHolder>
        <div id="dv_controls">
            <div id="dv_controlClear">
                <asp:Button ID="BTN_Clear" CausesValidation="false" runat="server" Text="Clear" /></div>
            <div id="dv_controlSubmit">
                <asp:Button ID="BTN_advancedSearch" CausesValidation="false" runat="server" Text="Search" /></div>
        </div>
    </asp:Panel>
  
  <uc1:results ID="UC_Results" runat="server" />


</asp:Content>


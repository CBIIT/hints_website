﻿<%@ Page Title="" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false"
    CodeFile="advanced.aspx.vb" Inherits="advanced" %>


<%@ Register Src="~/_usercontrols/results.ascx" TagName="results" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="/css/results.css?v=2017_11_13" type="text/css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" language="javascript"
        type="text/javascript"></script>
    <link rel="stylesheet" href="/css/questions.css?v=2020_05_28">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">
                    <a id="top"></a>


                    <asp:Panel ID="PNL_Form" DefaultButton="BTN_advancedSearch" runat="server">
                                                                                                                                                   
                        <h1>Advanced Search</h1>
                        <div id="dv_advancedsearchTitle">
                            <p>
                                <strong>Find Content With...</strong>
                            </p>
                        </div>
                        <div class="FormItemWrapper">
                            <div class="FormLeftItem">
                                <asp:Label ID="LBL_SearchLabel" AssociatedControlID="TXT_Searchbox" runat="server" Text="All these words:"></asp:Label>
                            </div>
                            <div class="FormRightItem">
                                <asp:TextBox ID="TXT_SearchBox" runat="server"></asp:TextBox>
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
                                        <asp:Label ID="Label4" AssociatedControlID="DDL_WhoAsked" runat="server" Text="Who was asked:"></asp:Label>
                                    </div>
                                    <div class="FormRightItem">
                                        <asp:DropDownList CssClass="DDL_WhoAskedstyle" ID="DDL_WhoAsked" DataValueField="Criteria_DESC"
                                            DataTextField="Criteria_DESCShort" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div><br /><br />
                        </asp:PlaceHolder>
                        <div id="dv_controls">
                            <div id="dv_controlClear">
                                <asp:Button ID="BTN_Clear" CausesValidation="false" runat="server" Text="Clear" />
                            </div>
                            <div id="dv_controlSubmit">
                                <asp:Button ID="BTN_advancedSearch" CausesValidation="false" runat="server" Text="Search" />
                            </div>
                        </div>
                    </asp:Panel>

                    <uc1:results ID="UC_Results" runat="server" />


                </div>
            </div>
        </section>
    </div>
</asp:Content>

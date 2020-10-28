<%@ Page Title="HINTS Briefs | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="hints-briefs.aspx.vb" Inherits="publicationsfolder_hints_briefs" %>

<%@ Register Src="~/_usercontrols/articles_2020.ascx" TagName="articles" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">

                    <h1>HINTS Briefs</h1>
                    <p>
                        HINTS <i>Briefs</i> provide a snapshot of noteworthy,
        data-driven research findings. They introduce population-level estimates for specific
        questions in the survey and summarize significant research findings that are a result
        of analyzing how certain demographic characteristics influence specific outcomes.
        Many <i>Briefs</i> summarize research findings
        from recent peer-reviewed journal articles using HINTS data.
                    </p>

                    <div class="FormItemWrapper">
                        <p>
                            <strong>Narrow your results by section... </strong>
                        </p>
                    </div>
                    <div class="FormItemWrapper">

                        <asp:Label ID="Label1" AssociatedControlID="DDL_Section" runat="server" Text="Section Name:"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DDL_Section" DataValueField="PK_Section" DataTextField="SectionName"
                            AutoPostBack="true" runat="server">
                        </asp:DropDownList>

                    </div>
                    <br />
                    <br />

                    <!-- https://bootsnipp.com/snippets/exE6D -->
                    <div class="container fullwidth">
                        <div class="row">
                            <div class="col-xs-12 ">
                                <nav>
                                    <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                        <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">View English Briefs</a>
                                        <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">View Spanish Briefs</a>
                                    </div>
                                </nav>
                                <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">


                                        <h3>English Briefs</h3>
                                        <uc1:articles ID="UC_Articles_English" blnDisplayYear="False" runat="server" />

                                    </div>
                                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                        <h3>Breves espa&#241;ol</h3>
                                        <uc1:articles ID="UC_Articles_Spanish" blnDisplayYear="False" runat="server" />

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>






                </div>
            </div>
        </section>
    </div>
</asp:Content>


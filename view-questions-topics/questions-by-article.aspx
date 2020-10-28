<%@ Page Title="" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="questions-by-article.aspx.vb" Inherits="questionsfolder_questions_by_article" %>



<%@ Register Src="~/_usercontrols/results.ascx" TagName="results" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="/css/results.css?v=2017_11_13" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/questions.css?v=2020_05_28">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">




                    <asp:PlaceHolder ID="PLC_PUb" Visible="false" runat="server">
                        <h2>HINTS Questions Used in this Published Article</h2>
                        <p>
                            <strong>
                                <asp:Literal ID="LIT_Title" runat="server"></asp:Literal>,
        <asp:Literal ID="LIT_Author" runat="server"></asp:Literal>,
        <asp:Literal ID="LIT_Journal" runat="server"></asp:Literal>,
        <asp:Literal ID="LIT_PubDate" runat="server"></asp:Literal></strong>
                        </p>

                    </asp:PlaceHolder>

                    <asp:PlaceHolder ID="PLC_Brief" Visible="false" runat="server">
                        <h2>HINTS Questions Used in this Brief</h2>
                        <p>
                            <strong>
                                <asp:Literal ID="LIT_BriefTitle" runat="server"></asp:Literal>
                            </strong>
                        </p>

                    </asp:PlaceHolder>

                    <uc1:results ID="UC_Results" runat="server" />

                    <script type="text/javascript">
                        $("#breadcrumbs").hide();
                    </script>




                </div>
            </div>
        </section>
    </div>
</asp:Content>

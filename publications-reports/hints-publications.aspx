<%@ Page Title="Publications Using HINTS Data | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="hints-publications.aspx.vb" Inherits="publicationsfolder_hints_publications" %>


<%@ Register Src="~/_usercontrols/articles.ascx" TagName="articles" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="Publications Using HINTS Data | HINTS" />
    <meta name="Description" content="A list of published articles using HINTS Data since 2004." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">
                    <h1>Published Articles Using HINTS Data</h1>

                    <div id="pub_pres_list">
                        <uc1:articles ID="UC_Articles" blnDisplayYear="True" runat="server" />
                    </div>




                </div>
            </div>
        </section>
    </div>
</asp:Content>



<%@ Page Title="Search Resources" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="publication-search.aspx.vb" Inherits="publication_search" %>


<%@ Register src="~/_usercontrols/articles.ascx" tagname="articles" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page_wrapper_publication_search" class="grid">
       <br/><br/> <h1>Search Resources</h1>
        <br/>
                <strong>Find Content With...</strong>

        <br/><br/>
   <div class="FormItemWrapper">
       
        <div class="FormLeftItem">          
         <asp:Label ID="LabelSearchTerm"  AssociatedControlID="TXT_SearchTerm" runat="server" Text="All these words:"></asp:Label>
         </div>

         <div class="FormRightItem">
        <asp:TextBox ID="TXT_SearchTerm" runat="server" ></asp:TextBox>
        </div>
    </div>

          <p id="filterlinks">
            <asp:Button CssClass="ButtonLink" ID="bTN_ShowOptions" runat="server" Text="More Options..." />
            <asp:Button CssClass="ButtonLink" ID="BTN_HideOptions" runat="server" Text="Hide Options" />
        </p>

           
 <div id="publications_search_wrapper" class="col-6" runat="server">

    <div class="FormItemWrapper">
         <p>
                        <strong>Then narrow your results by... </strong>
                    </p>
        <div class="FormLeftItem">
    <asp:Label ID="LabelResource"  AssociatedControlID="DDL_articletype" runat="server" Text="Resource Type:"></asp:Label>
        </div>
        <div class="FormRightItem">
            <asp:DropDownList ID="DDL_articletype" DataValueField="PK_ArticleType" DataTextField="AticleType" runat="server"> </asp:DropDownList>
        </div>
    <br/>
    </div>

    <div class="FormItemWrapper">
        <div class="FormLeftItem">
    <asp:Label ID="LabelMonth"  AssociatedControlID="DDL_month" runat="server" Text="Month:"></asp:Label>
            </div>
        <div class="FormRightItem">
    <asp:DropDownList ID="DDL_month" runat="server"></asp:DropDownList>
    </div>
        <br/>
    </div>

    <div class="FormItemWrapper">
        <div class="FormLeftItem">
    <asp:Label ID="LabelYear"  AssociatedControlID="DDL_year" runat="server" Text="Year:"></asp:Label>
            </div>
        <div class="FormRightItem">
    <asp:DropDownList ID="DDL_year" runat="server"></asp:DropDownList>
    </div>
        <br/>
    </div>
    <br/> <br />
     </div>

        
     <div id="dv_controls">   
        <div id="dv_controlClear">
                <asp:Button ID="BTN_Clear" CausesValidation="false" runat="server" Text="Clear" /></div>
         <div id="dv_controlSubmit">
                <asp:Button ID="BTN_Search" CausesValidation="false" runat="server" Text="Search" /></div>
      </div>


         <div id="result_type"><h2><asp:Literal ID="LIT_ResType" runat="server"></asp:Literal></h2></div>

        <div id="pub_pres_list">
        <uc1:articles ID="UC_Articles" blnDisplayYear=True runat="server" />
            </div>
    </div>
</asp:Content>
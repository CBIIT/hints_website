<%@ Page Title="Publications Using HINTS Data | HINTS" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="hints-publications.aspx.vb" Inherits="publicationsfolder_hints_publications" %>


<%@ Register src="~/_usercontrols/articles.ascx" tagname="articles" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<meta name="Title" content="Publications Using HINTS Data | HINTS"/>
    <meta name="Description" content="A list of published articles using HINTS Data since 2004."/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div id="page_wrapper" class="grid">
        <div class="col-6">
            <h1>Published Articles Using HINTS Data</h1>

            
         <div class="FormItemWrapper">
                    <p>
                        <strong> Narrow your results by section... </strong>
                    </p>
                </div>
                <div class="FormItemWrapper">
                    
                        <asp:Label ID="SectionName" AssociatedControlID="DDL_Section" runat="server" Text="Section Name:" ></asp:Label>
                         &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DDL_Section" DataValueField="PK_Section" DataTextField="SectionName"
                          AutoPostBack="true"  runat="server">
                        </asp:DropDownList>
                    
                </div>



            <div id="pub_pres_list">
                    <uc1:articles ID="UC_Articles"  blnDisplayYear=True  runat="server" />
                </div>
        </div>
        </div>
</asp:Content>



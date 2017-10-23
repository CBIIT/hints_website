<%@ Page Title="HINTS Briefs | HINTS" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="hints-briefs.aspx.vb" Inherits="publicationsfolder_hints_briefs" %>


<%@ Register src="~/_usercontrols/articles.ascx" tagname="articles" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<meta name="Title" content="HINTS Briefs | HINTS"/>
    <meta name="Description" content="HINTS Briefs provide a snapshot of noteworthy, data-driven research findings. "/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="briefs_list">
    <h1>HINTS Briefs</h1>
    <p>
        HINTS <i>Briefs</i> provide a snapshot of noteworthy,
        data-driven research findings. They introduce population-level estimates for specific
        questions in the survey and summarize significant research findings that are a result
        of analyzing how certain demographic characteristics influence specific outcomes.
        Many <i>Briefs</i> summarize research findings
        from recent peer-reviewed journal articles using HINTS data.</p>

         <div class="FormItemWrapper">
                    <p>
                        <strong> Narrow your results by section... </strong>
                    </p>
                </div>
                <div class="FormItemWrapper">
                    
                        <asp:Label ID="Label1" AssociatedControlID="DDL_Section" runat="server" Text="Section Name:" ></asp:Label>
                         &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DDL_Section" DataValueField="PK_Section" DataTextField="SectionName"
                          AutoPostBack="true"  runat="server">
                        </asp:DropDownList>
                    
                </div>
        <br/> <br/>

    <!-- language tab -->
    <asp:Menu ID="languageTabs" runat="server" Orientation="Horizontal" CssClass="bottomLine">
        <Items>
            <asp:MenuItem Text="View English Briefs" Value="0" Selected="true" />
            <asp:MenuItem Text="View Spanish Briefs" Value="1" />
        </Items>
        <StaticItemTemplate>
            <%# Eval("Text") %>
        </StaticItemTemplate>
    </asp:Menu>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View_English" runat="server">
            <h3>
                English Briefs</h3>
            <uc1:articles ID="UC_Articles" blnDisplayYear="False" runat="server" />
        </asp:View>
        <asp:View ID="View_Spanish" runat="server">
            <h3>
                Breves espa&#241;ol</h3>
             <uc1:articles ID="UC_Articles1" blnDisplayYear="False" runat="server" />
        </asp:View>
    </asp:MultiView>
      </div>
</asp:Content>


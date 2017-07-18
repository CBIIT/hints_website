<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false"
    CodeFile="problem.aspx.vb" Inherits="problem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
    <p>
        <strong>We're sorry. The page you’re looking for is not currently available.</strong></p>
    <p>
        It’s possible that the page is temporarily unavailable, has been removed or renamed,
        or no longer exists.</p>
    <p>
        Please <a href="default.aspx">return to the home page</a> to find the information
        you were looking for.</p>

    <%--Hiding breadcrumbs on homepage--%>
        <script type="text/javascript">
            $("#breadcrumbs").hide();
        </script>

</asp:Content>

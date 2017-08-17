<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PubCounts.aspx.vb" Inherits="_pub_admin_PubCounts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <h1>Publication Counts</h1>
        <ul>
            <li><strong>
                <asp:Literal ID="LIT_TotalArticles" runat="server"></asp:Literal></strong>: Total "Articles"</li>
            <li><strong>
                <asp:Literal ID="LIT_TotalPublications" runat="server"></asp:Literal></strong>: Total Publications</li>
            <li><strong>
                <asp:Literal ID="LIT_TotalBriefs" runat="server"></asp:Literal></strong>: Total Briefs
                     <ul>
                         <li><strong>
                             <asp:Literal ID="LIT_TotalEnglishBriefs" runat="server"></asp:Literal></strong>: Total English Briefs</li>
                         <li><strong>
                             <asp:Literal ID="LIT_TotalSpanishBriefs" runat="server"></asp:Literal></strong>: Total Spanish Briefs</li>
                     </ul>
            </li>

        </ul>
    </form>
</body>
</html>

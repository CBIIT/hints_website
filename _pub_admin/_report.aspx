<%@ Page Language="VB" AutoEventWireup="false" CodeFile="_report.aspx.vb" Inherits="_pub_admin_report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form runat="server">
        
    <h1>Publication List</h1>

       <asp:Button ID="BTN_Excel1" runat="server" Text="Send To Excel" />
 
    <table border="1">
        <tr>
            <td>PK_Submission</td>
            <td>Title</td>
            <td>Journal</td>
            <td>PrimaryAuthor</td>
            <td>AllAuthors</td>
            <td>AuthorEmail</td>
            <td>PublishMonth</td>
            <td>PublishYear</td>
            <td>FileName</td>
            <td>CreationDate</td>
            <td>Processed</td>
            <td>Delete</td>
        </tr>


    <asp:Repeater ID="RPTR" runat="server">
        <ItemTemplate>

            
        <tr>
            <td><%# Eval("PK_Submission")%>&nbsp;</td>
            <td><%# Eval("Title")%>&nbsp;</td>
            <td><%# Eval("Journal")%>&nbsp;</td>
            <td><%# Eval("PrimaryAuthor")%>&nbsp;</td>
            <td><%# Eval("AllAuthors")%>&nbsp;</td>
            <td><%# Eval("AuthorEmail")%>&nbsp;</td>
            <td><%# Eval("PublishMonth")%>&nbsp;</td>
            <td><%# Eval("PublishYear")%>&nbsp;</td>
            <td>
                <asp:HyperLink Visible='<%# CheckVis(Eval("FileName"))%>' NavigateUrl='<%# "~/ViewFile.aspx?PK_Submission=" & Eval("PK_Submission").ToString%>' ID="HyperLink1" runat="server"><%# Eval("FileName")%></asp:HyperLink></td>
            <td><%# Eval("CreationDate")%>&nbsp;</td>
             
             <td> <asp:Button ID="btnProcessed" runat="server" Text= "Processed" CommandArgument='<%# Eval("PK_Submission")%>' OnClick="btnProcessedClick" OnClientClick="return confirm('Are you sure you want to mark this item as processed?');" />  </td>
             <td> <asp:Button ID="btnDelete" runat="server" Text= "Delete" CommandArgument='<%# Eval("PK_Submission")%>' OnClick="btnDeleteClick" OnClientClick="return confirm('Are you sure you want to permanently delete the item?');" />  </td>
             </tr>

        </ItemTemplate>
    </asp:Repeater>
        

    </table>

    </form>
</body>
</html>

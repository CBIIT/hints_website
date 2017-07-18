<%@ Page Language="VB" AutoEventWireup="false" EnableViewState="false" CodeFile="_reportXLS.aspx.vb" Inherits="_pub_admin_reportXLS" %>

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
        </tr>

        </ItemTemplate>
    </asp:Repeater>
        

    </table>

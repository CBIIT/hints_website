<%@ Page Title="Journals Using HINTS | HINTS" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="hints-journals.aspx.vb" Inherits="publicationsfolder_hints_journals" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<meta name="Title" content="Journals Using HINTS | HINTS"/>
    <meta name="Description" content="Browse all of the journals that have accepted manuscripts using HINTS data and the number of published articles for each journal."/>
     <style type="text/css">
        p {
            padding-bottom: 0px !important;
        }

        .journaltable {
            margin-left: auto;
            margin-right: auto;
        }

        .tr_Header {
            background-color: #2d73a1;
            color: #fff;
            font-size: 1.2em;
        }

        .tr_even {
            background-color: #e0f0cb;
        }




        .tr_odd {
            background-color: #f7f7f7;
        }


        td {
            text-align: center;
            color: #000;
            padding: 5px;
        }

        th {
            text-align: center;
            color: #ffffff;
            padding: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="grid">
        <div class="col_6 ">

            <h1>Where have HINTS data been published?</h1>




            <p>HINTS data has been featured in <asp:Literal ID="LIT_ArticleCount" runat="server"></asp:Literal> articles and <asp:Literal ID="LIT_JournalCount" runat="server"></asp:Literal> peer reviewed journals since data was first released in 2003. This page lists all of the journals that have accepted manuscripts using HINTS data and the number of published articles for each journal. Journal titles are hyperlinked and will bring you to the home page for each journal.</p>

            <br />
            <br />

        </div>
    </div>

    <div class="grid">
        <div class="col_3 ">
            <table class="journaltable" border="1" cellspacing="0" cellpadding="0" align="center">
                <tr class="tr_Header">
                    <th width="60%">
                        <p><strong>Journal</strong></p>
                    </th>
                    <th width="20%">
                        <p><strong># of HINTS Pubs</strong></p>
                    </th>
                    <th width="20%">
                        <p><strong>Impact Score</strong></p>
                    </th>
                </tr>
                <asp:Repeater ID="RPTR_Col1" runat="server">
                    <ItemTemplate>

                        <asp:PlaceHolder ID="PLC_column1" Visible="<%# CheckVis_Col1()%>" runat="server">
                        
                        <tr class='<%# SET_BG()%>'>
                            <td>
                                <p><a target="_blank" href="<%# Eval("JournalURL") %>"><%# Eval("Journal")%></a></p>
                            </td>
                            <td>
                                <p><%# Eval("numberofPubs")%></p>
                            </td>
                            <td>
                                <p><%# Eval("ImpactScore")%></p>
                            </td>
                        </tr>

                        </asp:PlaceHolder>
                    </ItemTemplate>
                </asp:Repeater>
            </table>

        </div>
       

        
        <div class="col_3 ">
            <table class="journaltable" border="1" cellspacing="0" cellpadding="0" align="center">
                <tr class="tr_Header">
                  <th width="60%">
                        <p><strong>Journal</strong></p>
                    </th>
                    <th width="20%">
                        <p><strong># of HINTS Pubs</strong></p>
                    </th>
                    <th width="20%">
                        <p><strong>Impact Score</strong></p>
                    </th>
                </tr>
                <asp:Repeater ID="RPTR_Col2" runat="server">
                    <ItemTemplate>

                        
                        <asp:PlaceHolder ID="PLC_column2" Visible="<%# CheckVis_Col2()%>" runat="server">
                        
                        <tr class='<%# SET_BG()%>'>
                            <td>
                                <p><a target="_blank" href="<%# Eval("JournalURL") %>"><%# Eval("Journal")%></a></p>
                            </td>
                            <td>
                                <p><%# Eval("numberofPubs")%></p>
                            </td>
                            <td>
                                <p><%# Eval("ImpactScore")%></p>
                            </td>
                        </tr>

                        </asp:PlaceHolder>


                    </ItemTemplate>
                </asp:Repeater>
            </table>

        </div>

        
    </div>


</asp:Content>


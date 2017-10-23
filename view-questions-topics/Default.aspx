<%@ Page Title="View HINTS questions | HINTS" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="questionsfolder_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<meta name="Title" content="View HINTS questions | HINTS"/>
    <meta name="Description" content="View estimated U.S. population values, charts and data visualizations, and trends over time for each HINTS question and browse HINTS questions by topic."/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>View Questions/Topics</h1>

    <p>View estimated U.S. population values, charts and data visualizations, and trends over time for each HINTS question and browse HINTS questions by topic.</p>

    <div class="col_6">
        <div class="col_3 landingPageDiv">
            <div class="landingPageDivHeader">

                <h2>View Questions</h2>
            </div>
            <div class="landingPageDiv_subtext">
                <p>Search or browse HINTS questions and data across all survey iterations.</p>
                <p><a href="/view-questions-topics/all-hints-questions.aspx">Read More</a></p>

            </div>
        </div>
        <div class="col_3 landingPageDiv">
            <div class="landingPageDivHeader">
                <h2>View Topics</h2>

            </div>
            <div class="landingPageDiv_subtext">
                <p>Find related questions, briefs and publications on topics covered in HINTS research.</p>
                <p><a href="/view-questions-topics/hints-topics.aspx">Read More</a></p>

            </div>
        </div>
    </div>

    <div class="col_6">
        <div class="col_3 landingPageDiv">
            <div class="landingPageDivHeader">
                <h2>Geographic Maps</h2>
            </div>
            <div class="landingPageDiv_subtext">
                <p>Illustrate regional similarities and differences by viewing HINTS data points in a “weather map” fashion.</p>
                <p><a href="/view-questions-topics/geographic-data-maps.aspx">Read More</a></p>

            </div>
        </div>
    </div>
</asp:Content>


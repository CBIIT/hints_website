<%@ Page Title="HINTS Data Merging Code Tool | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="data-merging-tool.aspx.vb" Inherits="data_data_merging_tool" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="HINTS Data Merging Code Tool | HINTS" />
    <meta name="Description" content="Use this interactive tool to develop SAS code to merge multiple iterations of HINTS data. " />

    <script src="/_scripts/datamergingcode/gencode_20230803.js"></script>
    <link rel="stylesheet" href="/css/datamergingcode.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">

                    <h1>HINTS Data Merging Code Tool</h1>

                    <p>Use this interactive tool to develop SAS (version 9.3 or higher) and Stata code to merge multiple iterations of HINTS data, as well as generate example/template analysis code for frequencies/cross-tabulations and logistic and linear regressions. </p>
                    <h2>Why would you want to merge two or more sets of HINTS data? </h2>
                    <p>Combining multiple iterations of HINTS data can help to fulfill two key goals:</p>
                    <ol>
                        <li><strong>Examining trends over time</strong>. Because of common sampling procedures used across the repeated, cross-sectional HINTS surveys, each HINTS iteration can be considered as an independent sample of the non-institutionalized US adult population 18 and older. Thus, iterations can be merged together to look at patterns over time. </li>
                        <li><strong>Yielding a larger sample size.</strong> This can be useful specifically when a particular subgroup is of interest (e.g., racial or ethnic subgroups), but there aren&rsquo;t enough respondents in one HINTS iteration to provide stable outcome estimates. This technique assumes that the outcome of interest does not have significant changes over time and requires that the merged dataset be analyzed as a whole.</li>
                    </ol>
                    <h2>Additional Resources</h2>
                    <p>A <a href="/meetings-trainings/how-to-merge-hints-data.aspx">series of videos</a> demonstrating how to merge data from HINTS iterations is available on the HINTS website. Examples of Stata and SPSS codes for merging HINTS data can be found in the <em>Survey Overview &amp; Data Analysis Recommendations</em> file included in the <a href="/data/download-data.aspx">publicly available HINTS data packages</a>.</p>


                    <h3>Merging Tool</h3>

                    <p>
                        Select Your Data Format:<br />
                        <input id="RD_SAS" name="gp_codetype" checked="checked" type="radio" value="SAS" /> <label for="RD_SAS">SAS</label><br />
                        <input id="RD_STATA" name="gp_codetype" type="radio" value="Stata" /> <label for="RD_STATA">Stata</label>
                        <%-- STATA is V2 --%>
                    </p>

                    <div class="datamergeouter">
                        <div class="datamergecolumn">
                            <p>Select what cycles you want.</p>
                            <input id="ck_Cycle-43" type="checkbox" value="HINTS 4 CYCLE 3" />
                            <label for="ck_Cycle-43">HINTS 4 CYCLE 3 (2013)</label><br />
                            <input id="ck_Cycle-44" type="checkbox" value="HINTS 4 CYCLE 4" />
                            <label for="ck_Cycle-44">HINTS 4 CYCLE 4 (2014)</label><br />
                            <input id="ck_Cycle-51" type="checkbox" value="HINTS 5 CYCLE 1" />
                            <label for="ck_Cycle-51">HINTS 5 CYCLE 1 (2017)</label><br />
                            <input id="ck_Cycle-52" type="checkbox" value="HINTS 5 CYCLE 2" />
                            <label for="ck_Cycle-52">HINTS 5 CYCLE 2 (2018)</label><br />
                            <input id="ck_Cycle-53" type="checkbox" value="HINTS 5 CYCLE 3" />
                            <label for="ck_Cycle-53">HINTS 5 CYCLE 3 (2019)</label><br />

                            <div id="dv_Pnl53" class="dv_Pnl53_Hide">
                                &nbsp;&nbsp;&nbsp;<input id="RD_All" name="53_type" aria-selected="true" checked value="all" type="radio" />
                                <label for="RD_All">ALL</label><br />

                                &nbsp;&nbsp;&nbsp;<input id="RD_Paper" name="53_type" value="paper" type="radio" />
                                <label for="RD_Paper">Paper Only</label><br />

                                &nbsp;&nbsp;&nbsp;<input id="RD_Web" name="53_type" value="web" type="radio" />
                                <label for="RD_Web">Web</label><br />

                                &nbsp;&nbsp;&nbsp;<input id="RD_Bonus" name="53_type" value="bonus" type="radio" />
                                <label for="RD_Bonus">Web Bonus</label><br />

                            </div>



                            

                            <input id="ck_Cycle-54" type="checkbox" value="HINTS 5 CYCLE 4" />
                            <label for="ck_Cycle-54">HINTS 5 CYCLE 4 (2020)</label><br />

                            <input id="ck_Cycle-6" type="checkbox" value="HINTS 6" />
                            <label for="ck_Cycle-6">HINTS 6 (2022)</label><br />
                        </div>







                        <div class="datamergecolumn">
                            <p>Select what analyses you want.</p>
                            <input id="ck_OptionsFrequencies" type="checkbox" value="Frequencies/Crosstab" />
                            <label for="ck_OptionsFrequencies">Frequencies/Crosstab</label><br />
                            <input id="ck_OptionsLogistic" type="checkbox" value="Logistic Regression" />
                            <label for="ck_OptionsLogistic">Logistic Regression</label><br />
                            <input id="ck_OptionsLinear" type="checkbox" value="Linear Regression" />
                            <label for="ck_OptionsLinear">Linear Regression</label><br />
                        </div>
                    </div>
















                    <hr />
                    <input id="btn_copy" type="button" value="Copy Code to clipboard" />

                    <hr />
                    <textarea aria-disabled="true" disabled id="TXT_Results" cols="120" rows="20">Select at least 2 or more checkboxes</textarea>




                </div>
            </div>
        </section>
    </div>
</asp:Content>

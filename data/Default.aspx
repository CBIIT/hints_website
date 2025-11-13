<%@ Page Title="HINTS data | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="datafolder_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="HINTS data | HINTS" />
    <meta name="Description" content="HINTS nationally representative data is publicly available for researchers and health professionals to use for their own analyses." />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">









    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <h1 class="pl-3 pr-3 col-12">Data</h1>
                        <p class="pl-3 pr-3">HINTS nationally representative data is publicly available for researchers and health professionals to use for their own analyses.</p>
                        <div class="card-deck mb-4 mr-0 ml-0">
                            <div class="card">
                                <div class="card-body p-4">
                                    <h5 class="card-title">Download Data</h5>
                                    <p class="card-text">Quickly access HINTS data, in SAS, SPSS, and STATA formats, and supporting documents</p>
                                    <p class="card-text">
                                        <asp:HyperLink NavigateUrl="~/data/download-data.aspx" ID="HYP_Download_landingPage" runat="server">Read More</asp:HyperLink>
                                    </p>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body p-4">
                                    <h5 class="card-title">Survey Instruments</h5>
                                    <p class="card-text">Review survey instruments used to collect HINTS data.</p>
                                    <p class="card-text"><a href="/data/survey-instruments.aspx">Read More</a></p>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body p-4">
                                    <h5 class="card-title">Methodology Reports</h5>
                                    <p class="card-text">Find out more about the procedures used to collect and analyze HINTS data.</p>
                                    <p class="card-text"><a href="/data/methodology-reports.aspx">Read More</a></p>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body p-4">
                                    <h5 class="card-title">Summary Findings by Item</h5>
                                    <p class="card-text">View summary data for each HINTS question across all HINTS survey administrations.</p>
                                    <p class="card-text"><a href="/view-questions/all-hints-questions.aspx?all=1">Read More</a></p>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-body p-4">
                                    <h5 class="card-title">HINTS Data Errors, Remediation, and Recommendations</h5>
                                    <p class="card-text">Access important information about HINTS data errors, remediation procedures, and resultant recommendations</p>
                                    <p class="card-text"><a href="/data/data-remediation.aspx">Read More</a></p>
                                </div>
                            </div>


                            <div class="card">
                                <div class="card-body p-4">
                                    <h5 class="card-title">HINTS Data Merging Code Tool</h5>
                                    <p class="card-text">Use this interactive tool to develop SAS code to merge multiple iterations of HINTS data. </p>
                                    <p class="card-text"><a href="/data/data-merging-tool.aspx">Read More</a></p>
                                </div>
                            </div>



                            
<%--                            <div class="card">
                                <div class="card-body p-4">
                                    <h5 class="card-title">Request Restricted HINTS Datasets</h5>
                                    <p class="card-text">Request restricted-use HINTS datasets that contain geocodes and suppressed variables or restricted-use-only datasets using the form found on this page.</p>
                                    <p class="card-text"><a href="/data/restricted-data.aspx">Read More</a></p>
                                </div>
                            </div>--%>

                            <div class="card">
                                <div class="card-body p-4">
                                    <h5 class="card-title">PRICSSA Information</h5>
                                    <p class="card-text">Access the HINTS Preferred Reporting Items for Complex Sample Survey Analysis (PRICSSA) checklist.</p>
                                    <p class="card-text"><a href="/data/pricssa.aspx">Read More</a></p>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

<%@ Page Title="HINTS Data Errors, Remediation, and Recommendations | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="data-remediation.aspx.vb" Inherits="data_data_remediation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="HINTS Data Errors, Remediation, and Recommendations  | HINTS" />
    <meta name="Description" content="Details for HINTS 5, Cycle 3 and HINTS 4, Cycles 3 and 4 data remediation that took place in Spring 2021." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">

                    <h1>HINTS Data Errors, Remediation, and Recommendations</h1>

                    <p>This page details HINTS data errors, remediation procedures, and resultant recommendations. More details about these issues are found in associated documentation that is contained in data files found on the <a href="/data/download-data.aspx">data downloads page</a>, and if you have questions, please don&rsquo;t hesitate to <a href="/about-hints/contact-us.aspx">contact us</a> and we would be happy to assist you. </p>
                    <h2><strong>HINTS 5 Cycle 3 (2019) Web Respondent Sample</strong></h2>
                    <p>An update to this dataset and supporting documentation was posted to the HINTS Web site <a href="/data/download-data.aspx">data downloads section</a> in March 2021 after it was discovered that 35 variables were affected by coding errors associated with missing values for data from participants who completed the survey online as part of the push-to-web pilot study. For some of the open-ended questions in the survey, invalid skips (-9) were coded to 0 instead of -9, and other related, derived variables required minor revisions to missing value assignments. In addition, for the four-item N6 matrix items (&ldquo;How much do you think that each of the following can influence whether or not a person will develop cancer?&rdquo;), web respondents who chose &ldquo;Don&rsquo;t Know&rdquo; should have been assigned a corresponding value of 4 but were incorrectly set to missing (-9). Variables impacted by the former issue are corrected in the newly posted HINTS 5 Cycle 3 data; the latter issue with N6 is not correctable and remains in the revised dataset. We strongly encourage HINTS 5 Cycle 3 data users to consult the H5C3 Survey Overview &amp; Data Analysis Recommendations document, contained in the data file, for guidance on how to revise analyses to address the issues with the data. Updated variable formats now alert data users to this issue. See the <a href="/docs/Instruments/HINTS5_Cycle3_MethodologyReport.pdf">HINTS 5 Cycle 3 methodology report</a> Section 4.2 and Appendices I and J for further information and guidance.</p>
                    <h2><strong>HINTS 4 Cycle 3 (2013) and HINTS 4 Cycle 4 (2014)</strong></h2>
                    <p>An error occurred where 5-year American Community Survey (ACS) estimates were used as the source of the population totals used in the calibration step of the weighting. The correct population should have been the 1-year ACS estimates. The 5-year estimates are based on an average of the ACS for the previous 5 years, while the 1-year estimates are based on the results of the ACS for that particular year. The HINTS estimates affected most by this error are population totals or counts (e.g., the total number of adults who have searched for information about cancer from any source). These totals will be, on average, about 2 percent lower for the 5-year estimates than if the 1-year estimates were used.</p>
                    <p>Linear and logistic regressions using the incorrect weights will be affected less than population totals because the error is in both the numerator and the denominator, which will tend to cancel the error out. We have run several different types of analyses which compare results using the weights with the error and a corrected set of weights. These involved looking at percentages, regression estimates, and trends. None of these analyses were substantively different when using the corrected weights. Virtually all resulted in percentages, regression coefficients, and significance tests that did not differ at the first decimal place.</p>
                    <p>Our advice to users who have completed analyses using HINTS 4 Cycle 3 or HINTS 4 Cycle 4 but not published yet is to rerun the analyses with the correct weights found on the <a href="/data/download-data.aspx">updated datasets</a> on the HINTS website. For results that have already been published, we do not advise doing anything except in two scenarios:</p>
                    <ol start="1" type="1">
                        <li>If the results rely on reporting population counts or totals.</li>
                        <li>If a small change in the statistical significance of a result would affect your conclusions. For example, if the result is based on a result that is significant close to a 5% level (if that is the criteria used in the analysis).</li>
                    </ol>

                    <p>In both cases, we advise re-running the analysis and deciding if the results differ enough to merit reporting an erratum to the journal.</p>
                    <p>Additionally, the final weighted distribution for HINTS 4 Cycle 4 (2014) had a disproportionate number of males in the higher education groups. This issue arose because the raking step involving gender and education was carried out differently in H4C4 than in prior HINTS cycles. Raking involves forcing the distributions for several different demographic breakouts to the national totals. In the interest of maintaining a distribution of education for males that is closer to the national population, new weights were created that enforced tighter controls on these two variables.</p>
                    <p>Several different types of analyses were run to compare results using the prior weights (distributed with the original dataset) and the revised weights (corrected in June 2021). These analyses involved examining percentages, regression estimates, and trends. The results that differed were those based on small sample sizes (e.g., a those age 90 and over) or effects of education that were close to statistical significance at the p&lt;0.05 level.</p>
                    <p>HINTS data users who have completed, or are currently conducting, analyses using HINTS 4, Cycle 4 (2014) data should re-run final analyses using the revised weights in the data files that were updated in June 2021. Results are not likely to change for effects not related to education; however, it is best to be sure that results based on small sample sizes or results that were/are close to or marginally significant do not change when the revised weights are used.</p>
                </div>
            </div>
        </section>
    </div>
</asp:Content>


<%@ Page Title="HINTS Data Errors, Remediation, and Recommendations | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="data-remediation.aspx.vb" Inherits="data_data_remediation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="HINTS Data Errors, Remediation, and Recommendations | HINTS" />
    <meta name="Description" content="Details for HINTS 5, Cycle 3 and HINTS 4, Cycles 3 and 4 data remediation that took place in Spring 2021." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">

                    <h1>HINTS Data Errors, Remediation, and Recommendations</h1>


                    <p>This page details HINTS data errors, remediation procedures, and resultant recommendations. More details about these issues are found in associated documentation that is contained in the respective data files found on the <a href="/data/download-data.aspx">data downloads page</a>. If you have questions, please don&rsquo;t hesitate to <a href="/about-hints/contact-us.aspx">contact us</a> and we would be happy to assist you. </p>
                    <p><strong>HINTS 5, Cycle 4 (2020) </strong></p>
                    <ul>
                        <li>No errors identified.</li>
                    </ul>
                    <p><strong>HINTS 5, Cycle 3 (2019) </strong></p>
                    <ul>
                        <li>Identified March 2021. An update to this dataset and supporting documentation was posted to the HINTS Web site <a href="/data/download-data.aspx">data downloads section</a> in March 2021 after it was discovered that 35 variables were affected by coding errors associated with missing values for data from participants who completed the survey online as part of the push-to-web pilot study. Errors are only associated with Web respondents. For some of the open-ended questions in the survey, invalid skips (-9) were coded to 0 instead of -9, and other related, derived variables required minor revisions to missing value assignments. In addition, for the four-item N6 matrix items (&ldquo;How much do you think that each of the following can influence whether or not a person will develop cancer?&rdquo;), web respondents who chose &ldquo;Don&rsquo;t Know&rdquo; should have been assigned a corresponding value of 4 but were incorrectly set to missing (-9). Variables impacted by the former issue are corrected in the HINTS 5 Cycle 3 dataset that was updated and posted to the HINTS Web site in March 2021; the latter issue with N6 is not correctable and remains in the revised dataset. We strongly encourage HINTS 5 Cycle 3 data users to consult the H5C3 Survey Overview &amp; Data Analysis Recommendations document, contained in the data file, for guidance on how to revise analyses to address the issues with the data. Updated variable formats now alert data users to this issue. See the <a href="/docs/Instruments/HINTS5_Cycle3_MethodologyReport.pdf">HINTS 5 Cycle 3 methodology report</a> Section 4.2 and Appendices I and J for further information and guidance.</li>
                    </ul>
                    <p><strong>HINTS 5, Cycle 2 (2018) </strong></p>
                    <ul>
                        <li>No errors identified.</li>
                    </ul>
                    <p><strong>HINTS 5, Cycle 1 (2017) </strong></p>
                    <ul>
                        <li>No errors identified.</li>
                    </ul>
                    <p><strong>HINTS-FDA, Cycle 2 (2017) </strong></p>
                    <ul>
                        <li>No errors identified.</li>
                    </ul>
                    <p><strong>HINTS-FDA (2015) </strong></p>
                    <ul>
                        <li>No errors identified.</li>
                    </ul>
                    <p><strong>HINTS 4, Cycle 4 (2014) </strong></p>
                    <ul>
                        <li>Identified July 2021. A separate error with the weights arose from the process called raking, which is used to adjust the sampling weights for HINTS 4 Cycle 4 so the marginal values of a table sum to those known totals. These adjustment variables include demographic variables like gender and education, and it was found that the final weighted distribution had a disproportionate number of males in the higher education groups. In the interest of maintaining a distribution of education for males that is closer to the national population, new weights were created that enforced tighter controls on these two variables and have been included in this updated data release. These new weights, released in July 2021, also correct the March 2021 weighing error, described below.  It is advised that HINTS data users rerun weighted analyses that used HINTS 4 Cycle 4 (2014) to decide if the results differ enough to merit reporting an erratum to the journal where the work was published. </li>
                        <li>Identified March 2021. An error occurred where 5-year American Community Survey (ACS) estimates were used as the source of the population totals used in the calibration step of the weighting. The correct population should have been the 1-year ACS estimates. The 5-year estimates are based on an average of the ACS for the previous 5 years, while the 1-year estimates are based on the results of the ACS for that particular year. The HINTS estimates affected most by this error are population totals or counts (e.g., the total number of adults who have searched for information about cancer from any source). These totals will be, on average, about 2 percent lower for the 5-year estimates than if the 1-year estimates were used. Linear and logistic regressions using the incorrect weights will be affected less than population totals because the error is in both the numerator and the denominator, which will tend to cancel the error out. We have run several different types of analyses which compare results using the weights with the error and a corrected set of weights. These involved looking at percentages, regression estimates, and trends. None of these analyses were substantively different when using the corrected weights. Virtually all resulted in percentages, regression coefficients, and significance tests that did not differ at the first decimal place. Our advice to users who have completed analyses using HINTS 4 Cycle 3 or HINTS 4 Cycle 4 but not published yet is to rerun the analyses with the correct weights found on the <a href="/data/download-data.aspx">updated datasets</a> on the HINTS website. For results that have already been published, we do not advise doing anything except in two scenarios: (1) If the results rely on reporting population counts or totals. (2) If a small change in the statistical significance of a result would affect your conclusions. For example, if the result is based on a result that is significant close to a 5% level (if that is the criteria used in the analysis). In both cases, we advise re-running the analysis and deciding if the results differ enough to merit reporting an erratum to the journal where the work was published.</li>
                    </ul>
                    <p><strong>HINTS 4, Cycle 3 (2013)</strong></p>
                    <ul>
                        <li>Identified March 2021. An error occurred where 5-year American Community Survey (ACS) estimates were used as the source of the population totals used in the calibration step of the weighting. The correct population should have been the 1-year ACS estimates. The 5-year estimates are based on an average of the ACS for the previous 5 years, while the 1-year estimates are based on the results of the ACS for that particular year. The HINTS estimates affected most by this error are population totals or counts (e.g., the total number of adults who have searched for information about cancer from any source). These totals will be, on average, about 2 percent lower for the 5-year estimates than if the 1-year estimates were used. Linear and logistic regressions using the incorrect weights will be affected less than population totals because the error is in both the numerator and the denominator, which will tend to cancel the error out. We have run several different types of analyses which compare results using the weights with the error and a corrected set of weights. These involved looking at percentages, regression estimates, and trends. None of these analyses were substantively different when using the corrected weights. Virtually all resulted in percentages, regression coefficients, and significance tests that did not differ at the first decimal place. Our advice to users who have completed analyses using HINTS 4 Cycle 3 or HINTS 4 Cycle 4 but not published yet is to rerun the analyses with the correct weights found on the <a href="/data/download-data.aspx">updated datasets</a> on the HINTS website. For results that have already been published, we do not advise doing anything except in two scenarios: (1) If the results rely on reporting population counts or totals. (2) If a small change in the statistical significance of a result would affect your conclusions. For example, if the result is based on a result that is significant close to a 5% level (if that is the criteria used in the analysis). In both cases, we advise re-running the analysis and deciding if the results differ enough to merit reporting an erratum to the journal where the work was published.</li>
                    </ul>
                    <p><strong>HINTS 4, Cycle 2 (2012) </strong></p>
                    <ul>
                        <li>No errors identified.</li>
                    </ul>
                    <p><strong>HINTS 4, Cycle 1 (2011) </strong></p>
                    <ul>
                        <li>No errors identified.</li>
                    </ul>
                    <p><strong>HINTS Puerto Rico (2009) </strong></p>
                    <ul>
                        <li>No errors identified.</li>
                    </ul>
                    <p><strong>HINTS 3 (2007) </strong></p>
                    <ul>
                        <li>No errors identified.</li>
                    </ul>
                    <p><strong>HINTS 2 (2005) </strong></p>
                    <ul>
                        <li>No errors identified.</li>
                    </ul>
                    <p><strong>HINTS 1 (2003)</strong></p>
                    <ul>
                        <li>No errors identified.</li>
                    </ul>

                </div>
            </div>
        </section>
    </div>
</asp:Content>


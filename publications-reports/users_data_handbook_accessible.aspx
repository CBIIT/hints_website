<%@ Page Title="HINTS Users Data Handbook | HINTS" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="users_data_handbook_accessible.aspx.vb" Inherits="publicationsfolder_users_data_handbook_accessible" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="HINTS Users Data Handbook | HINTS" />
    <meta name="Description" content="Analytic Methods to Examine Changes Across Years Using HINTS 2003 & 2005 Data" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div id="page_wrapper" class="grid">
        <div class="col-6">
            <h1>Analytic Methods to Examine Changes Across Years Using HINTS 2003 & 2005 Data</h1>
            <p>
                Division of Cancer Control and Population Sciences<br />
                National Cancer Institute<br />
                U.S. Department of Health and Human Services
            </p>

            <p>
                Lou Rizzo, Ph.D.<sup>1</sup><br />
                Richard P. Moser, Ph.D.<sup>2</sup><br />
                William Waldron, B.S.<sup>3</sup><br />
                Zhuoqiao Wang, M.S.<sup>3</sup><br />
                William W. Davis, Ph.D.<sup>2</sup>
            </p>

            <p class="small">
                <sup>1</sup>Westat Inc.;<br />
                <sup>2</sup>Division of Cancer Control and Population Sciences, National Cancer Institute;<br />
                <sup>3</sup>Information Management Services, Inc.
            </p>

            <hr />

            <p>
                <a href="#1">1. Introduction</a><br />
                <a href="#2">2. Three Types of Anaylses Using Multiple Biennial HINTS Surveys</a><br />
                <a href="#3">3. Goal 1&#8212;Estimating Changes Without Controlling for Other Factors</a><br />
                <a href="#4">4. Combining the Data Files</a><br />
                <a href="#5">5. Goal 2&#8212;Estimating Changes Controlling for Other Factors</a><br />
                <a href="#6">6. Goal 3&#8212; Estimating Averages by Combining 2003 and 2005 Data</a><br />
                <a href="#7">7. Other Analyses</a><br />
                <a href="#ref">References</a><br />
                <a href="#a">Appendix A. SAS/SUDAAN Code for Carrying Out the Calculations</a><br />
                <a href="#b">Appendix B. STATA Code for carrying out the Calcuations</a><br />
                <a href="#c">Appendix C. Computing Degrees of Freedom</a><br />
                <a href="#cir">Cancer Information and Resources</a>
            </p>

            <hr />

            <h3><a name="1"></a>1. INTRODUCTION</h3>

            <p>The Health Information National Trends Survey (HINTS) is a national, biennial survey designed to collect nationally representative data on the American public's need for, access to, and use of cancer-related information. The primary task of HINTS is to monitor changes in the rapidly evolving field of health communication. This survey is sponsored and directed by the National Cancer Institute's Division of Cancer Control and Population Sciences. The baseline year is 2003, and data from the first follow-up sample in 2005 are also available (see <a href="/default.aspx">https://hints.cancer.gov</a>). A second follow-up sample (for 2007) is currently being implemented.</p>

            <p>Each biennial sample is drawn using a random-digitdial (RDD) sample design to produce a representative sample of telephone households in the country. Exchanges with high percentages of Blacks and Hispanics were oversampled in 2003, in order to provide a larger yield of these important subgroups. In a second stage of selection, one adult was randomly selected among all adults living in the sampled household. This adult was recruited to complete the main survey instrument by telephone interview<sup><a href="#foot4">4</a></sup>.</p>

            <p>
                Weights are assigned to account for all of the stages of selection (from the RDD sampling frame and within the household), and for attrition from noncontacts, screener nonresponse, and interview nonresponse. These weights are designed to provide approximately unbiased estimators of population totals using a modified Horvitz-Thompson estimator (see for example Cochran 1977, Section 9A.7)<sup><a href="#foot5">5</a></sup>. Replicate weights are also provided to allow for consistent variance estimation. The replicate weights for all of the biennial HINTS surveys are based on the jackknife replication method, with R = 50 replicate weights for each survey year. The replicate weights are formed by deleting a carefully selected portion of the original sample (roughly 1/50 of the original sample), and reweighting the remaining sample as if the complement set was the full sample. Estimates are computed using each set of replicate weights, generating a set of parallel replicate estimates to the estimate of interest. The sum of squares of the deviations between the replicate estimates and the &#8216;full-sample&#8217; estimate, with appropriate adjustment, provides consistent estimators of the variance. For example, suppose
                <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" />
                is an estimator (a percentage within a subgroup, for example) using the &#8216;fullsample&#8217; weights. We generate replicate estimators
                <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>r</sub> in parallel, doing the calculation in the same way, but using each set of replicate weights in place of the original full-sample weights. The jackknife variance estimator of
                <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" />
                is
            </p>
            <p align="center">
                <img src="/_images/scientific_equations.jpg" alt="v sub r of theta hat equals R minus 1 divided by R times the summation over r from 1 to R of theta hat sub r minus theta hat, quantity squared" width="173" height="47" />
            </p>

            <p>Final methodology reports are available for both HINTS 2003 and HINTS 2005 and are accessible online at no cost on <a href="https://hints.cancer.gov">https://hints.cancer.gov</a>. These reports provide details of the sampling and weighting for the respective surveys. This methodology paper is closely based on a similar methodology paper (Lee, et al. 2007) for the California Health Information Survey (CHIS).</p>

            <p class="small">
                <a id="foot4"></a><sup>4</sup>In HINTS 2005, a small number of persons completed interviews via the Internet, as part of an experimental study nested within the main HINTS survey.<br />
                <a id="foot5"></a><sup>5</sup>Nonresponse is viewed as a further &#8216;pseudo&#8217; stage of sampling, in which it is assumed that respondents are a simple random sample from all sampled persons within carefully defined response cells (the &#8216;pseudo-randomization paradigm&#8217;: see for example Oh and Scheuren 1983).
            </p>

            <p align="right"><a href="#">Back to top</a></p>

            <hr />

            <h3><a name="2"></a>2. THREE TYPES OF ANALYSES USING MULTIPLE BIENNIAL HINTS SURVEYS</h3>

            <p>Throughout this document, we will provide examples of HINTS analyses, using as our primary outcome for each example an estimate from HINTS of the percentage of respondents who ever looked for cancer information using the Internet<sup><a href="#foot6">6</a></sup>. Table 2 below presents the estimates from HINTS 2003 and HINTS 2005 for the overall population and for sociodemographic subgroups of general interest, as well as standard errors (the square roots of the jackknife variance estimates).</p>

            <p>Research based on a series of cross-sectional surveys often emphasizes the results of the new survey but also includes testing for changes between survey iterations, i.e., examining trends in responses to a given survey item over time. This document focuses on three general goals and provides SAS/SUDAAN and STATA syntax examples for each when making inferences from multiple cross-sectional surveys:</p>

            <p><strong>Table 2 Estimates of percentages of adults who have ever looked for cancer information online.</strong></p>

            <table class="tblStyle">
                <thead>
                    <tr>
                        <th headers="blank" id="h1" rowspan="2" valign="bottom" align="left">&nbsp;<br />
                            <strong>SUBGROUP</strong></th>
                        <th headers="blank" id="h2" colspan="2">2003</th>
                        <th headers="blank" id="h3" colspan="2">2005</th>
                    </tr>
                    <tr>
                        <th headers="blank" id="h_t1">Weighted %</th>
                        <th headers="blank" id="h_t2">Standard Error</th>
                        <th headers="blank" id="h_t3">Weighted %</th>
                        <th headers="blank" id="h_t4">Standard Error</th>
                    </tr>

                </thead>
                <tr>
                    <th style="text-align: left; font-weight: normal" id="sh1">ALL</th>
                    <td headers="sh1 h2 h_t1">19.7%</td>
                    <td headers="sh1 h2 h_t2">0.6%</td>
                    <td headers="sh1 h3 h_t3">28.3%</td>
                    <td headers="sh1 h3 h_t4">0.7%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="5">&nbsp;</td>
                </tr>
                <tr>
                    <th style="text-align: left; font-weight: normal" id="sh2"><strong>Age</strong><br />
                        18&#8211;34</th>

                    <td headers="sh2 h2 h_t1">&nbsp;<br />
                        23.5%</td>
                    <td headers="sh2 h2 h_t2">&nbsp;<br />
                        1.3%</td>
                    <td headers="sh2 h3 h_t3">&nbsp;<br />
                        32.6%</td>
                    <td headers="sh2 h3 h_t4">&nbsp;<br />
                        1.5%</td>
                </tr>
                <tr>
                    <!--- ------------------------>
                    <th style="text-align: left; font-weight: normal" id="sh3">35&#8211;49</th>
                    <!--- ------------------------>

                    <td headers="sh3 h2 h_t1">23.3%</td>
                    <td headers="sh3 h2 h_t2">1.2%</td>
                    <td headers="sh3 h3 h_t3">32.5%</td>
                    <td headers="sh3 h3 h_t4">1.6%</td>
                </tr>
                <tr>
                    <!--- ------------------------>
                    <th style="text-align: left; font-weight: normal" id="sh4">50&#8211;64</th>
                    <!--- ------------------------>

                    <td headers="sh4 h2 h_t1">20.6%</td>
                    <td headers="sh4 h2 h_t2">1.2%</td>
                    <td headers="sh4 h3 h_t3">30.0%</td>
                    <td headers="sh4 h3 h_t4">1.4%</td>
                </tr>
                <tr>
                    <!--- ------------------------>
                    <th style="text-align: left; font-weight: normal" id="sh5">65+</th>
                    <!--- ------------------------>
                    <td headers="sh5 h2 h_t1">4.2%</td>
                    <td headers="sh5 h2 h_t2">0.5%</td>
                    <td headers="sh5 h3 h_t3">9.6%</td>
                    <td headers="sh5 h3 h_t4">0.8%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="5">&nbsp;</td>
                </tr>
                <tr>
                    <!--- ------------------------>
                    <th style="text-align: left; font-weight: normal" id="sh6"><strong>Education Level</strong><br />
                        Less than high school</th>
                    <!--- ------------------------>
                    <td headers="sh6 h2 h_t1">&nbsp;<br />
                        6.5%</td>
                    <td headers="sh6 h2 h_t2">&nbsp;<br />
                        1.4%</td>
                    <td headers="sh6 h3 h_t3">&nbsp;<br />
                        6.4%</td>
                    <td headers="sh6 h3 h_t4">&nbsp;<br />
                        1.1%</td>
                </tr>
                <tr>
                    <!--- ------------------------>
                    <th style="text-align: left; font-weight: normal" id="sh7">High school graduate</th>
                    <!--- ------------------------>


                    <td headers="sh7 h2 h_t1">12.0%</td>
                    <td headers="sh7 h2 h_t2">0.9%</td>
                    <td headers="sh7 h3 h_t3">19.9%</td>
                    <td headers="sh7 h3 h_t4">1.6%</td>

                </tr>
                <tr>
                    <!--- ------------------------>
                    <th style="text-align: left; font-weight: normal" id="sh8">Some college</th>
                    <!--- ------------------------>


                    <td headers="sh8 h2 h_t1">23.9%</td>
                    <td headers="sh8 h2 h_t2">1.3%</td>
                    <td headers="sh8 h3 h_t3">34.7%</td>
                    <td headers="sh8 h3 h_t4">1.9%</td>
                </tr>
                <tr>
                    <!--- ------------------------>
                    <th style="text-align: left; font-weight: normal" id="sh9">College graduate or more</th>
                    <!--- ------------------------>


                    <td headers="sh9 h2 h_t1">36.0%</td>
                    <td headers="sh9 h2 h_t2">1.3%</td>
                    <td headers="sh9 h3 h_t3">46.5%</td>
                    <td headers="sh9 h3 h_t4">1.6%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="5">&nbsp;</td>
                </tr>
                <tr>
                    <!--- ------------------------>
                    <th style="text-align: left; font-weight: normal" id="sh10"><strong>Race</strong><br />
                        Non-Hispanic White</th>
                    <!--- ------------------------>



                    <td headers="sh10 h2 h_t1">&nbsp;<br />
                        23.1%</td>
                    <td headers="sh10 h2 h_t2">&nbsp;<br />
                        0.8%</td>
                    <td headers="sh10 h3 h_t3">&nbsp;<br />
                        33.3%</td>
                    <td headers="sh10 h3 h_t4">&nbsp;<br />
                        1.1%</td>
                </tr>
                <tr>
                    <!--- ------------------------>
                    <th style="text-align: left; font-weight: normal" id="sh11">Non-Hispanic Black</th>
                    <!--- ------------------------>

                    <td headers="sh11 h2 h_t1">13.6%</td>
                    <td headers="sh11 h2 h_t2">1.7%</td>
                    <td headers="sh11 h3 h_t3">23.3%</td>
                    <td headers="sh11 h3 h_t4">3.4%</td>
                </tr>
                <tr>
                    <!--- ------------------------>
                    <th style="text-align: left; font-weight: normal" id="sh12">Hispanic</th>
                    <!--- ------------------------>

                    <td headers="sh12 h2 h_t1">7.2%</td>
                    <td headers="sh12 h2 h_t2">1.0%</td>
                    <td headers="sh12 h3 h_t3">11.2%</td>
                    <td headers="sh12 h3 h_t4">2.0%</td>
                </tr>
                <tr>
                    <!--- ------------------------>
                    <th style="text-align: left; font-weight: normal" id="sh13">Non-Hispanic Other</th>
                    <!--- ------------------------>
                    <td headers="sh13 h2 h_t1">22.1%</td>
                    <td headers="sh13 h2 h_t2">2.4%</td>
                    <td headers="sh13 h3 h_t3">28.2%</td>
                    <td headers="sh13 h3 h_t4">3.7%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="5">&nbsp;</td>
                </tr>
                <tr>
                    <!--- ------------------------>
                    <th style="text-align: left; font-weight: normal" id="sh14"><strong>Gender</strong><br />
                        Male</th>
                    <!--- ------------------------>

                    <td headers="sh14 h2 h_t1">&nbsp;<br />
                        16.7%</td>
                    <td headers="sh14 h2 h_t2">&nbsp;<br />
                        0.8%</td>
                    <td headers="sh14 h3 h_t3">&nbsp;<br />
                        25.3%</td>
                    <td headers="sh14 h3 h_t4">&nbsp;<br />
                        1.4%</td>
                </tr>
                <tr>
                    <!--- ------------------------>
                    <th style="text-align: left; font-weight: normal" id="sh15">Female</th>
                    <!--- ------------------------>

                    <td headers="sh15 h2 h_t1">22.4%</td>
                    <td headers="sh15 h2 h_t2">0.9%</td>
                    <td headers="sh15 h3 h_t3">31.0%</td>
                    <td headers="sh15 h3 h_t4">0.9%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="5">&nbsp;</td>
                </tr>
                <tr>
                    <!--- ------------------------>
                    <th style="text-align: left; font-weight: normal" id="sh16"><strong>Annual Income</strong><br />
                        Less than $25,000</th>
                    <!--- ------------------------>

                    <td headers="sh16 h2 h_t1">&nbsp;<br />
                        10.1%</td>
                    <td headers="sh16 h2 h_t2">&nbsp;<br />
                        0.9%</td>
                    <td headers="sh16 h3 h_t3">&nbsp;<br />
                        18.0%</td>
                    <td headers="sh16 h3 h_t4">&nbsp;<br />
                        1.5%</td>
                </tr>
                <tr>
                    <!--- ------------------------>
                    <th style="text-align: left; font-weight: normal" id="sh17">$25,000 to $49,999</th>
                    <!--- ------------------------>

                    <td headers="sh17 h2 h_t1">16.6%</td>
                    <td headers="sh17 h2 h_t2">1.2%</td>
                    <td headers="sh17 h3 h_t3">25.6%</td>
                    <td headers="sh17 h3 h_t4">1.9%</td>
                </tr>
                <tr>
                    <!--- ------------------------>
                    <th style="text-align: left; font-weight: normal" id="sh18">$50,000 to $74,999</th>
                    <!--- ------------------------>

                    <td headers="sh18 h2 h_t1">27.3%</td>
                    <td headers="sh18 h2 h_t2">1.6%</td>
                    <td headers="sh18 h3 h_t3">30.4%</td>
                    <td headers="sh18 h3 h_t4">2.0%</td>
                </tr>
                <tr>
                    <!--- ------------------------>
                    <th style="text-align: left; font-weight: normal" id="sh19">$75,000 or more</th>
                    <!--- ------------------------>


                    <td headers="sh19 h2 h_t1">36.3%</td>
                    <td headers="sh19 h2 h_t2">1.8%</td>
                    <td headers="sh19 h3 h_t3">44.6%</td>
                    <td headers="sh19 h3 h_t4">2.1%</td>
                </tr>
            </table>

            <ul>
                <li><strong>Goal 1:</strong> Estimating a change in a characteristic such as a mean or a percentage and testing the statistical significance of the change (across and within subgroups):
            <ul>
                <li>Example 1: Has the percentage of persons who have ever looked for cancer information online changed between 2003 and 2005? What is the estimate of the change?</li>
                <li>Example 2: Has the percentage of Black persons who have ever looked for cancer information online changed between 2003 and 2005? What is the estimate of the change?</li>
            </ul>
                </li>
                <li><strong>Goal 2:</strong> Estimating a change in a characteristic while controlling for covariates (across and within subgroups):
            <ul>
                <li>Example 1: Has the percentage of persons who have ever looked for cancer information online changed in the last two years, after controlling for age, education level, and gender?</li>
                <li>Example 2: Has the percentage of college graduates who have ever looked for cancer information online changed in the last two years, after controlling for age and gender?</li>
            </ul>
                </li>
                <li><strong>Goal 3:</strong> Estimating the average using data from multiple survey years assuming that the mean has not changed between those years:
            <ul>
                <li>What is the average percentage of persons who have ever looked for cancer information Online over the period 2003&#150;2005?</li>
            </ul>
                </li>
            </ul>

            <p>Note that Goals 1 and 2 are relevant to test for differences or change in responses to survey items that are identical (or comparable) across years, while Goal 3 would be used to combine across years to obtain one larger sample size.</p>

            <p class="small">
                <a id="foot6"></a><sup>6</sup>The exact derivation of the example percentage from the HINTS questionnaire items is given in Appendix A.
            </p>

            <p align="right"><a href="#">Back to top</a></p>

            <hr />

            <h3><a name="3"></a>3. GOAL 1&#8211;ESTIMATING CHANGES WITHOUT CONTROLLING FOR OTHER FACTORS</h3>

            <p>
                It is easy to produce an estimate of change in characteristics between 2003 and 2005 and its corresponding variance estimate, because HINTS samples are drawn independently. Here we will label HINTS 2003 &#34;year 1&#34; and HINTS 2005 &#34;year 2,&#34; and consider estimating a characteristic <em>&#952;</em> (e.g., a mean, percentage, regression coefficient, population standard deviation) in year s. We label the true value in year <em>s</em> as <em>&#952;</em><sub>s</sub>, the estimated value as
                <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>s</sub>, and the estimated variance (the square of the standard error) as <em>&#957;(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>s</sub>)</em>.  The true change between years is &#916;=<em>&#952;</em><sub>2</sub>-<em>&#952;</em><sub>1</sub>, with consistent estimator
                <img src="/_images/deltahat.jpg" alt="delta-hat" width="7" height="12" />=<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>2</sub>-<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>1</sub>
            </p>

            <p>Because the samples are independent, the variance is the sum of the two variances, and a consistent variance estimator is</p>
            <p align="center"><em>&#957;</em>(<img src="/_images/deltahat.jpg" alt="delta-hat" width="7" height="12" />)=<em>&#957;</em>(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>1</sub>)+<em>&#957;</em>(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>2</sub>)</p>

            <p>Table 3-1 provides a summary of this information.</p>

            <p><strong>Table 3-1 Summary of Estimating Changes Using Two Independent Surveys.</strong></p>

            <table class="tbl3-1Style">

                <thead>
                    <tr>
                        <th id="th1" align="left" width="13%" headers="blank">Year</th>
                        <th id="th2" align="left" width="13%" headers="blank">True Value</th>
                        <th id="th3" align="left" width="13%" headers="blank">Estimated Value</th>
                        <th id="th4" align="left" width="21%" headers="blank">Variance of Estimate</th>
                    </tr>
                </thead>
                <tr>
                    <th style="text-align: left; font-weight: normal" id="sh1" headers="blank">1</th>
                    <td headers="sh1 th2"><em>&#952;</em><sub>1</sub></td>
                    <td headers="sh1 th3">
                        <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>1</sub></td>
                    <td headers="sh1 th4"><em>&#957;</em>(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>1</sub>)</td>
                </tr>
                <tr>
                    <th style="text-align: left; font-weight: normal" id="sh2" headers="blank">2</th>
                    <td headers="sh2 th2"><em>&#952;</em><sub>2</sub></td>
                    <td headers="sh2 th3">
                        <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>2</sub></td>
                    <td headers="sh2 th4"><em>&#957;</em>(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>2</sub>)</td>
                </tr>
                <tr>
                    <th style="text-align: left; font-weight: normal" id="sh3" headers="blank">Change</th>
                    <td headers="sh3 th2">&#916;=<em>&#952;</em><sub>2</sub>-<em>&#952;</em><sub>1</sub></td>
                    <td headers="sh3 th3">
                        <img src="/_images/deltahat.jpg" alt="delta-hat" width="7" height="12" />=<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>2</sub>-<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>1</sub></td>
                    <td headers="sh3 th4"><em>&#957;</em>(<img src="/_images/deltahat.jpg" alt="delta-hat" width="7" height="12" />)=<em>&#957;</em>(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>1</sub>)-<em>&#957;</em>(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>2</sub>)</td>
                </tr>
            </table>

            <p>A hypothesis test for the null hypothesis of no change (<em>&#952;</em><sub>1</sub> = <em>&#952;</em><sub>2</sub>) can be tested against a one-sided (<em>&#952;</em><sub>1</sub> < <em>&#952;</em><sub>2</sub>) or two-sided (<em>&#952;</em><sub>1</sub> &#8800; <em>&#952;</em><sub>2</sub>) alternative. The one-sided alternative may be more appropriate when any change that occurs is expected to be positive change (such as in the degree of Internet usage). The test statistic is</p>
            <p align="center">
                <img src="/_images/scientific_equations-2.jpg" alt="d hat equals delta hat divided by the square root of the estimated variance of delta hat" width="85" height="63" />
            </p>

            <p>For national estimates (in contrast to subgroups) this can be referred to a t-distribution, using either the one-sided t<sub><em>&#945;,df</em></sub> or the two-sided t<sub><em>&#945;/2,df</em></sub>. Finding the correct number of degrees of freedom is not a trivial task. Appendix C provides a method (Welch's method) for approximating the number of degrees of freedom, and shows why the t distribution on 49 degrees of freedom will be the most conservative (i.e., giving the widest confidence intervals), thereby reducing the likelihood of committing a Type I error. Using Welch's method, the number of degrees of freedom will be something between 49 and 98. It should be noted that all of these t-distributions are close to each other, and close to the standard normal distribution (i.e., the corresponding percentiles are nearly equal).</p>

            <p>For most applications for HINTS, the Welch approximation assuming 49 degrees of freedom for each year will be reasonable. The degrees of freedom for the chi-square distribution can be no larger than the set of independent nonzero squares that underlies the variance estimator. Suppose for example that a particular estimate is restricted to a limited subgroup of the sample, so that many of the replicate squared deviations are negligibly close to zero (see the equation for vr(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" />) at the end of Section 1). In this case, a smaller number of degrees of freedom should be used<sup><a href="#foot7">7</a></sup>. SAS/SUDAAN does allow the user to specify degrees of freedom if the user wishes to overrule the software's choice. It should be noted that without manual specification the SAS/SUDAAN program uses as degrees of freedom the total number of replicates, and the STATA software uses as degrees of freedom: the total number of replicates minus 1 respectively. STATA doesn&#8217;t appear to allow for any re-specification of degrees of freedom. These degrees of freedom are &#8216;liberal&#8217; (just beyond the high end of the &#8216;acceptable&#8217; range as per the Welch method).</p>

            <p>Table 3-2 on the next page presents one-sided and two-sided p-values for the null hypothesis of no change between 2003 and 2005 in percentages of adults who had ever looked for cancer information online, both for all adults and for a number of socioeconomic subgroups. Table 3-3 presents corresponding confidence intervals. The Table 3-2 and 3-3 values were computed separate from the two HINTS data sets (using STATA and SAS/SUDAAN to do these separate-year computations), with differences, standard errors, p-values, and confidence intervals computed in Excel, using a t-distribution on 98 degrees of freedom. If the p-value percentage in the table is more than 5% (for example), one would not reject the hypothesis at the 5% significance level. The table shows that for all but four groups (less than high school, Hispanic, non-Hispanic other, and $50,000&#8211;$74,999) we would reject the two-sided test of no change at the 5% significance level. Note that the results for &#8216;all&#8217; and for &#8216;non-Hispanic Black&#8217; can be used to test the hypotheses for Goal 1: Examples 1 and 2 respectively.</p>

            <p>The rows of the table allow the test of 19 hypotheses. If we wish to control the Type I error to 5% over all these hypotheses, we should use a significance level smaller than 5% for each individual test. The most conservative approach is the Bonferroni approach, in which the cutoff p-value is 5% / 19, or 0.26% as a cutoff. Many of the p-values in Table 3-2 pass this most conservative test. These can be confidently viewed as significant results. There are many other multiple comparisons tests that are less conservative than the Bonferroni approach; these are available in the current versions of both SAS and STATA for example.</p>

            <p>
                <strong>Table 3-2 Estimates of differences of percentages of adults who have ever looked for cancer information online,
between 2003 and 2005.</strong>
            </p>

            <table class="tblStyle">
                <thead>
                    <tr>
                        <th headers="blank" id="th1" width="20%" valign="bottom" align="left"><strong>SUBGROUP</strong></th>
                        <th headers="blank" id="th2" width="10%">2003 Weighted Estimate<br />
                            <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="9" height="17" /><sub>1</sub></th>
                        <th headers="blank" id="th3" width="10%">Standard Error<br />
                            <img src="/_images/scientific_equations-3.jpg" alt="square root of the estimated variance of theta hat 1" width="44" height="24" /></th>
                        <th headers="blank" id="th4" width="10%">2005 Weighted Estimate<br />
                            <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="9" height="17" /><sub>2</sub></th>
                        <th headers="blank" id="th5" width="10%">Standard Error<br />
                            <img src="/_images/scientific_equations-4.jpg" alt="square root of the estimated variance of theta hat 2" width="44" height="24" /></th>
                        <th headers="blank" id="th6" width="10%">Estimate of 2003 to 2005 Change<br />
                            <img src="/_images/deltahat-lg.jpg" alt="delta-hat" width="10" height="15" /></th>
                        <th headers="blank" id="th7" width="10%">Standard Error<br />
                            <img src="/_images/scientific_equations-5.jpg" alt="square root of estimated variance of delta hat" width="44" height="24" /></th>
                        <th headers="blank" id="th8" width="10%">Two-sided p-value of Test of No Change<sup><a href="#foot8">8</a></sup></th>
                        <th headers="blank" id="th9" width="10%">One-sided p-value of Test of No Change<sup><a href="#foot8">8</a></sup></th>
                    </tr>
                </thead>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh1" headers="th1">ALL</th>
                    <!--  ------------------------------------------->

                    <td headers="sh1 th2">19.7%</td>
                    <td headers="sh1 th3">0.6%</td>
                    <td headers="sh1 th4">28.3%</td>
                    <td headers="sh1 th5">0.7%</td>
                    <td headers="sh1 th6">8.6%</td>
                    <td headers="sh1 th7">0.9%</td>
                    <td headers="sh1 th8">0.0000%</td>
                    <td headers="sh1 th9">0.0000%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="9">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh2" headers="th1"><strong>Age</strong><br />
                        18&#8211;34</th>
                    <!--  ------------------------------------------->

                    <td headers="sh2 th2">&nbsp;<br />
                        23.5%</td>
                    <td headers="sh2 th3">&nbsp;<br />
                        1.3%</td>
                    <td headers="sh2 th4">&nbsp;<br />
                        32.6%</td>
                    <td headers="sh2 th5">&nbsp;<br />
                        1.5%</td>
                    <td headers="sh2 th6">&nbsp;<br />
                        9.1%</td>
                    <td headers="sh2 th7">&nbsp;<br />
                        2.0%</td>
                    <td headers="sh2 th8">&nbsp;<br />
                        0.0013%</td>
                    <td headers="sh2 th9">&nbsp;<br />
                        0.0007%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh3" headers="th1">35&#8211;49</th>
                    <!--  ------------------------------------------->


                    <td headers="sh3 th2">23.3%</td>
                    <td headers="sh3 th3">1.2%</td>
                    <td headers="sh3 th4">32.5%</td>
                    <td headers="sh3 th5">1.6%</td>
                    <td headers="sh3 th6">9.3%</td>
                    <td headers="sh3 th7">2.0%</td>
                    <td headers="sh3 th8">0.0014%</td>
                    <td headers="sh3 th9">0.0007%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh4" headers="th1">50&#8211;64</th>
                    <!--  ------------------------------------------->


                    <td headers="sh4 th2">20.6%</td>
                    <td headers="sh4 th3">1.2%</td>
                    <td headers="sh4 th4">30.0%</td>
                    <td headers="sh4 th5">1.4%</td>
                    <td headers="sh4 th6">9.4%</td>
                    <td headers="sh4 th7">1.8%</td>
                    <td headers="sh4 th8">0.0001%</td>
                    <td headers="sh4 th9">0.0001%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh5" headers="th1">65+</th>
                    <!--  ------------------------------------------->

                    <td headers="sh5 th2">4.2%</td>
                    <td headers="sh5 th3">0.5%</td>
                    <td headers="sh5 th4">9.6%</td>
                    <td headers="sh5 th5">0.8%</td>
                    <td headers="sh5 th6">5.4%</td>
                    <td headers="sh5 th7">0.9%</td>
                    <td headers="sh5 th8">0.0000%</td>
                    <td headers="sh5 th9">0.0000%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="9">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh6" headers="th1"><strong>Education Level</strong><br />
                        Less than high school</th>
                    <!--  ------------------------------------------->

                    <td headers="sh6 th2">&nbsp;<br />
                        6.5%</td>
                    <td headers="sh6 th3">&nbsp;<br />
                        1.4%</td>
                    <td headers="sh6 th4">&nbsp;<br />
                        6.4%</td>
                    <td headers="sh6 th5">&nbsp;<br />
                        1.1%</td>
                    <td headers="sh6 th6">&nbsp;<br />
                        -0.1%</td>
                    <td headers="sh6 th7">&nbsp;<br />
                        1.7%</td>
                    <td headers="sh6 th8">&nbsp;<br />
                        96.77%</td>
                    <td headers="sh6 th9">&nbsp;<br />
                        48.39%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh7" headers="th1">High school graduate</th>
                    <!--  ------------------------------------------->

                    <td headers="sh7 th2">12.0%</td>
                    <td headers="sh7 th3">0.9%</td>
                    <td headers="sh7 th4">19.9%</td>
                    <td headers="sh7 th5">1.6%</td>
                    <td headers="sh7 th6">8.0%</td>
                    <td headers="sh7 th7">1.8%</td>
                    <td headers="sh7 th8">0.0033%</td>
                    <td headers="sh7 th9">0.0016%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh8" headers="th1">Some college</th>
                    <!--  ------------------------------------------->


                    <td headers="sh8 th2">23.9%</td>
                    <td headers="sh8 th3">1.3%</td>
                    <td headers="sh8 th4">34.7%</td>
                    <td headers="sh8 th5">1.9%</td>
                    <td headers="sh8 th6">10.7%</td>
                    <td headers="sh8 th7">2.4%</td>
                    <td headers="sh8 th8">0.0014%</td>
                    <td headers="sh8 th9">0.0007%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh9" headers="th1">College graduate or more</th>
                    <!--  ------------------------------------------->

                    <td headers="sh9 th2">36.0%</td>
                    <td headers="sh9 th3">1.3%</td>
                    <td headers="sh9 th4">46.5%</td>
                    <td headers="sh9 th5">1.6%</td>
                    <td headers="sh9 th6">10.5%</td>
                    <td headers="sh9 th7">2.1%</td>
                    <td headers="sh9 th8">0.0002%</td>
                    <td headers="sh9 th9">0.0001%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="9">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh10" headers="th1"><strong>Race</strong><br />
                        Non-Hispanic White</th>
                    <!--  ------------------------------------------->
                    <td headers="sh10 th2">&nbsp;<br />
                        23.1%</td>
                    <td headers="sh10 th3">&nbsp;<br />
                        0.8%</td>
                    <td headers="sh10 th4">&nbsp;<br />
                        33.3%</td>
                    <td headers="sh10 th5">&nbsp;<br />
                        1.1%</td>
                    <td headers="sh10 th6">&nbsp;<br />
                        10.1%</td>
                    <td headers="sh10 th7">&nbsp;<br />
                        1.3%</td>
                    <td headers="sh10 th8">&nbsp;<br />
                        0.0000%</td>
                    <td headers="sh10 th9">&nbsp;<br />
                        0.0000%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh11" headers="th1">Non-Hispanic Black</th>
                    <!--  ------------------------------------------->

                    <td headers="sh11 th2">13.6%</td>
                    <td headers="sh11 th3">1.7%</td>
                    <td headers="sh11 th4">23.3%</td>
                    <td headers="sh11 th5">3.4%</td>
                    <td headers="sh11 th6">9.6%</td>
                    <td headers="sh11 th7">3.8%</td>
                    <td headers="sh11 th8">1.22%</td>
                    <td headers="sh11 th9">0.61%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh12" headers="th1">Hispanic</th>
                    <!--  ------------------------------------------->

                    <td headers="sh12 th2">7.2%</td>
                    <td headers="sh12 th3">1.0%</td>
                    <td headers="sh12 th4">11.2%</td>
                    <td headers="sh12 th5">2.0%</td>
                    <td headers="sh12 th6">4.1%</td>
                    <td headers="sh12 th7">2.2%</td>
                    <td headers="sh12 th8">7.36%</td>
                    <td headers="sh12 th9">3.68%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh13" headers="th1">Non-Hispanic Other</th>
                    <!--  ------------------------------------------->

                    <td headers="sh13 th2">22.1%</td>
                    <td headers="sh13 th3">2.4%</td>
                    <td headers="sh13 th4">28.2%</td>
                    <td headers="sh13 th5">3.7%</td>
                    <td headers="sh13 th6">6.1%</td>
                    <td headers="sh13 th7">4.4%</td>
                    <td headers="sh13 th8">16.58%</td>
                    <td headers="sh13 th9">8.29%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="9">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh14" headers="th1"><strong>Gender</strong><br />
                        Male</th>
                    <!--  ------------------------------------------->
                    <td headers="sh14 th2">&nbsp;<br />
                        16.7%</td>
                    <td headers="sh14 th3">&nbsp;<br />
                        0.8%</td>
                    <td headers="sh14 th4">&nbsp;<br />
                        25.3%</td>
                    <td headers="sh14 th5">&nbsp;<br />
                        1.4%</td>
                    <td headers="sh14 th6">&nbsp;<br />
                        8.6%</td>
                    <td headers="sh14 th7">&nbsp;<br />
                        1.7%</td>
                    <td headers="sh14 th8">&nbsp;<br />
                        0.0001%</td>
                    <td headers="sh14 th9">&nbsp;<br />
                        0.0001%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh15" headers="th1">Female</th>
                    <!--  ------------------------------------------->

                    <td headers="sh15 th2">22.4%</td>
                    <td headers="sh15 th3">0.9%</td>
                    <td headers="sh15 th4">31.0%</td>
                    <td headers="sh15 th5">0.9%</td>
                    <td headers="sh15 th6">8.6%</td>
                    <td headers="sh15 th7">1.2%</td>
                    <td headers="sh15 th8">0.0000%</td>
                    <td headers="sh15 th9">0.0000%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="9">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh16" headers="th1"><strong>Annual Income</strong><br />
                        Less than $25,000</th>
                    <!--  ------------------------------------------->

                    <td headers="sh16 th2">&nbsp;<br />
                        10.1%</td>
                    <td headers="sh16 th3">&nbsp;<br />
                        0.9%</td>
                    <td headers="sh16 th4">&nbsp;<br />
                        18.0%</td>
                    <td headers="sh16 th5">&nbsp;<br />
                        1.5%</td>
                    <td headers="sh16 th6">&nbsp;<br />
                        7.9%</td>
                    <td headers="sh16 th7">&nbsp;<br />
                        1.8%</td>
                    <td headers="sh16 th8">&nbsp;<br />
                        0.0021%</td>
                    <td headers="sh16 th9">&nbsp;<br />
                        0.0011%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh17" headers="th1">$25,000 to $49,999</th>
                    <!--  ------------------------------------------->
                    <td headers="sh17 th2">16.6%</td>
                    <td headers="sh17 th3">1.2%</td>
                    <td headers="sh17 th4">25.6%</td>
                    <td headers="sh17 th5">1.9%</td>
                    <td headers="sh17 th6">9.0%</td>
                    <td headers="sh17 th7">2.2%</td>
                    <td headers="sh17 th8">0.0101%</td>
                    <td headers="sh17 th9">0.0051%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh18" headers="th1">$50,000 to $74,999</th>
                    <!--  ------------------------------------------->

                    <td headers="sh18 th2">27.3%</td>
                    <td headers="sh18 th3">1.6%</td>
                    <td headers="sh18 th4">30.4%</td>
                    <td headers="sh18 th5">2.0%</td>
                    <td headers="sh18 th6">3.1%</td>
                    <td headers="sh18 th7">2.5%</td>
                    <td headers="sh18 th8">22.85%</td>
                    <td headers="sh18 th9">11.42%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh19" headers="th1">$75,000 or more</th>
                    <!--  ------------------------------------------->

                    <td headers="sh19 th2">36.3%</td>
                    <td headers="sh19 th3">1.8%</td>
                    <td headers="sh19 th4">44.6%</td>
                    <td headers="sh19 th5">2.1%</td>
                    <td headers="sh19 th6">8.3%</td>
                    <td headers="sh19 th7">2.8%</td>
                    <td headers="sh19 th8">0.34%</td>
                    <td headers="sh19 th9">0.17%</td>
                </tr>
            </table>

            <p>
                One can compute one-sided or two-sided confidence intervals of the difference using similar considerations. The two-sided confidence interval will be<br />
                <div align="center">
                    <img src="/_images/scientific_equations-6.jpg" alt="delta hat plus or minus t sub [{alpha divided by two} comma degrees of freedom] times the square root of the estimated variance of theta hat; square root of the estimated variance of delta hat" width="119" height="33" />
                </div>
            </p>

            <p><em>t<sub>&#945;/2,df</sub></em> is the two-sided cutoff point using a <em>t</em> distribution on <em>df</em> degrees of freedom. Checking whether this confidence interval contains zero is equivalent to the two-sided test of the null hypothesis of no change using the corresponding <em>t-</em>distribution. Table 3-3 presents two-sided confidence intervals using the <em>t-</em>distribution for the change in percentage of adults who have ever looked for cancer information online (note that the first two columns of Table 3-3 give the same difference estimates as Table 3-2: they are included here as well as they are the center values of the confidence intervals from the two-sided test). Again, the table shows that for all but four groups (less than high school, Hispanic, non-Hispanic other, and $50,000&#8211;$74,999) we would reject the two-sided test of no change at the 5% significance level (since the confidence intervals include zero for these four groups).</p>

            <p><strong>Table 3-3 Confidence intervals for differences in percentages of adults who have ever looked for cancer information online, between 2003 and 2005.</strong></p>

            <table class="tblStyle">

                <thead>
                    <tr>
                        <th headers="blank" id="th1" valign="bottom" width="25%" align="left"><strong>SUBGROUP</strong></th>
                        <th headers="blank" id="th2" width="18%"><strong>Estimate of 2003 to 2005 Change</strong><br />
                            <img src="/_images/deltahat-lg.jpg" alt="delta-hat" width="10" height="15" /></th>
                        <th headers="blank" id="th3" width="19%"><strong>Standard Error</strong><br />
                            <img src="/_images/scientific_equations-5.jpg" alt="square root of estimated variance of delta hat" width="44" height="25" /></th>
                        <th headers="blank" id="th4" width="19%"><strong>Lower Bound 95% C.I.</strong></th>
                        <th headers="blank" id="th5" width="19%"><strong>Upper Bound 95% C.I.</strong></th>
                    </tr>
                </thead>
                <tr>


                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh1" headers="th1">ALL</th>
                    <!--  ------------------------------------------->

                    <td headers="sh1 th2">8.6%</td>
                    <td headers="sh1 th3">0.9%</td>
                    <td headers="sh1 th4">6.8%</td>
                    <td headers="sh1 th5">10.4%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="5">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh2" headers="th1"><strong>Age</strong><br />
                        18&#8211;34</th>
                    <!--  ------------------------------------------->

                    <td headers="sh2 th2">&nbsp;<br />
                        9.1%</td>
                    <td headers="sh2 th3">&nbsp;<br />
                        2.0%</td>
                    <td headers="sh2 th4">&nbsp;<br />
                        5.2%</td>
                    <td headers="sh2 th5">&nbsp;<br />
                        13.1%</td>

                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh3" headers="th1">35&#8211;49</th>
                    <!--  ------------------------------------------->

                    <td headers="sh3 th2">9.3%</td>
                    <td headers="sh3 th3">2.0%</td>
                    <td headers="sh3 th4">5.3%</td>
                    <td headers="sh3 th5">13.3%</td>


                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh4" headers="th1">50&#8211;64</th>
                    <!--  ------------------------------------------->

                    <td headers="sh4 th2">9.4%</td>
                    <td headers="sh4 th3">1.8%</td>
                    <td headers="sh4 th4">5.8%</td>
                    <td headers="sh4 th5">13.1%</td>

                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh5" headers="th1">65+</th>
                    <!--  ------------------------------------------->

                    <td headers="sh5 th2">5.4%</td>
                    <td headers="sh5 th3">0.9%</td>
                    <td headers="sh5 th4">3.6%</td>
                    <td headers="sh5 th5">7.2%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="5">&nbsp;</td>
                </tr>
                <tr>


                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh6" headers="th1"><strong>Education Level</strong><br />
                        Less than high school</th>
                    <!--  ------------------------------------------->

                    <td headers="sh6 th2">&nbsp;<br />
                        -0.1%</td>
                    <td headers="sh6 th3">&nbsp;<br />
                        1.7%</td>
                    <td headers="sh6 th4">&nbsp;<br />
                        -3.5%</td>
                    <td headers="sh6 th5">&nbsp;<br />
                        3.4%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh7" headers="th1">High school graduate</th>
                    <!--  ------------------------------------------->

                    <td headers="sh7 th2">8.0%</td>
                    <td headers="sh7 th3">1.8%</td>
                    <td headers="sh7 th4">4.3%</td>
                    <td headers="sh7 th5">11.6%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh8" headers="th1">Some college</th>
                    <!--  ------------------------------------------->

                    <td headers="sh8 th2">10.7%</td>
                    <td headers="sh8 th3">2.4%</td>
                    <td headers="sh8 th4">6.1%</td>
                    <td headers="sh8 th5">15.4%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh9" headers="th1">College graduate or more</th>
                    <!--  ------------------------------------------->

                    <td headers="sh9 th2">10.5%</td>
                    <td headers="sh9 th3">2.1%</td>
                    <td headers="sh9 th4">6.4%</td>
                    <td headers="sh9 th5">14.5%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="5">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh10" headers="th1"><strong>Race</strong><br />
                        Non-Hispanic White</th>
                    <!--  ------------------------------------------->

                    <td headers="sh10 th2">&nbsp;<br />
                        10.1%</td>
                    <td headers="sh10 th3">&nbsp;<br />
                        1.3%</td>
                    <td headers="sh10 th4">&nbsp;<br />
                        7.6%</td>
                    <td headers="sh10 th5">&nbsp;<br />
                        12.7%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh11" headers="th1">Non-Hispanic Black</th>
                    <!--  ------------------------------------------->

                    <td headers="sh11 th2">9.6%</td>
                    <td headers="sh11 th3">3.8%</td>
                    <td headers="sh11 th4">2.1%</td>
                    <td headers="sh11 th5">17.1%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh12" headers="th1">Hispanic</th>
                    <!--  ------------------------------------------->

                    <td headers="sh12 th2">4.1%</td>
                    <td headers="sh12 th3">2.2%</td>
                    <td headers="sh12 th4">-0.4%</td>
                    <td headers="sh12 th5">8.5%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh13" headers="th1">Non-Hispanic Other</th>
                    <!--  ------------------------------------------->

                    <td headers="sh13 th2">6.1%</td>
                    <td headers="sh13 th3">4.4%</td>
                    <td headers="sh13 th4">-2.6%</td>
                    <td headers="sh13 th5">14.8%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="5">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh14" headers="th1"><strong>Gender</strong><br />
                        Male</th>
                    <!--  ------------------------------------------->

                    <td headers="sh14 th2">&nbsp;<br />
                        8.6%</td>
                    <td headers="sh14 th3">&nbsp;<br />
                        1.7%</td>
                    <td headers="sh14 th4">&nbsp;<br />
                        5.3%</td>
                    <td headers="sh14 th5">&nbsp;<br />
                        11.8%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh15" headers="th1">Female</th>
                    <!--  ------------------------------------------->

                    <td headers="sh15 th2">8.6%</td>
                    <td headers="sh15 th3">1.2%</td>
                    <td headers="sh15 th4">6.1%</td>
                    <td headers="sh15 th5">11.1%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="5">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh16" headers="th1"><strong>Annual Income</strong><br />
                        Less than $25,000</th>
                    <!--  ------------------------------------------->

                    <td headers="sh16 th2">&nbsp;<br />
                        7.9%</td>
                    <td headers="sh16 th3">&nbsp;<br />
                        1.8%</td>
                    <td headers="sh16 th4">&nbsp;<br />
                        4.4%</td>
                    <td headers="sh16 th5">&nbsp;<br />
                        11.5%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh17" headers="th1">$25,000 to $49,999</th>
                    <!--  ------------------------------------------->

                    <td headers="sh17 th2">9.0%</td>
                    <td headers="sh17 th3">2.2%</td>
                    <td headers="sh17 th4">4.6%</td>
                    <td headers="sh17 th5">13.3%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh18" headers="th1">$50,000 to $74,999</th>
                    <!--  ------------------------------------------->

                    <td headers="sh18 th2">3.1%</td>
                    <td headers="sh18 th3">2.5%</td>
                    <td headers="sh18 th4">-2.0%</td>
                    <td headers="sh18 th5">8.1%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh19" headers="th1">$75,000 or more</th>
                    <!--  ------------------------------------------->

                    <td headers="sh19 th2">8.3%</td>
                    <td headers="sh19 th3">2.8%</td>
                    <td headers="sh19 th4">2.8%</td>
                    <td headers="sh19 th5">13.7%</td>
                </tr>
            </table>

            <p class="small">
                <a id="foot7"></a><sup>7</sup>A procedure recommended here is to consider as &#8216;negligible&#8217; any replicate square in the set of replicate squares that is less than 1% of the median square, which will eliminate spurious &#8216;essentially nonzero&#8217; squares.The software packages do not currently do this or anything similar to it, so the interested user will need to do this in a &#8216;manual&#8217; way.<br />
                <a id="foot8"></a><sup>8</sup>Note that these are percentages: .0021% is .000021, 5.2% is .052.This allows for greater clarity (more significant digits).
            </p>

            <p align="right"><a href="#">Back to top</a></p>

            <hr />

            <h3><a name="4"></a>4. COMBINING THE DATA FILES</h3>

            <p>For Goal 1, it is only necessary to have the separate 2003 and 2005 data sets, compute the estimates and standard errors, compute differences by subtracting the two sets of estimates, and compute standard errors for those differences by adding the two variances. For Goals 2 and 3 and any more sophisticated analyses, combining the data files will be necessary. It turns out that if the data files are combined properly, the analyses of Goal 1 can also be easily reproduced using the combined data set.</p>

            <p>The main purpose of Goal 3 is to allow an augmented sample size: both years can be combined, virtually doubling the sample size. This will considerably improve precision for those characteristics which do not change much between the years.</p>

            <p>To create the combined data file, one can concatenate the 2003 and 2005 public use files so that the number of respondents in the combined data file is the sum of the respondents from the two individual data files. Two main tasks are required to combine the data files. First, variables used in the analyses should have the same name and values or categories in both data files. Section A of the Appendix describes how variables are redefined for the tasks in this document. Second, create a set of new statistical weights as shown in Table 4. There will be 101 weights in the combined data file: 1 final weight and 100 replicate weights. We label them NFWGT and NFWGT1&#8211;NFWGT100. The final weight (NFWGT) in the combined file is created by using the final weight (FWGT) from the respective surveys.</p>

            <p>For the first 50 replicate weights (NFWGT1, &#8230;, NFWGT50), we use replicate weights FWGT1, &#8230; ,FWGT50 from the sample persons from the HINTS 2003 survey, and we use the final weight FWGT (for all 50 replicates) for sample persons from the HINTS 2005 survey. Replicate weights equal to the final weight essentially result in zero sums of squares contributed to the variance estimator from those replicates. For the first 50 replicate weights, only the HINTS 2003 survey contributes variance. For the remaining 50 replicate weights (NFWGT51, &#8230;, NFWGT100), we use replicate weights FWGT1, &#8230;, FWGT50 from the sample persons from the HINTS 2005 survey, and we use the final weight FWGT (for all 50 replicates) for sample persons from the HINTS 2003 survey. For replicate weights 51 through 100, only the HINTS 2005 survey contributes variance. When the sums of squares for all 100 replicates are put together, the result is a sum of HINTS 2003 and HINTS 2005 variance, as desired (as the surveys are in fact independent).</p>

            <p>
                It is also necessary to define a YEAR field equal to 2003 (or 1) for HINTS 2003 sample members, and equal to 2005 (or 2) for HINTS 2005 sample members. The Goal 1
                <img src="/_images/deltahat.jpg" alt="delta-hat" width="7" height="12">
                =
                <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13"><sub>2</sub> -
                <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13"><sub>1</sub>, with corresponding standard errors, test statistics, and confidence intervals, can be easily (and correctly) estimated from this combined data set using a contrast with the YEAR field (+1 for HINTS 2005 records and -1 for HINTS 2003 records). Appendix A provides SAS syntax for computing the new replicate weights<sup><a href="#foot9">9</a></sup> and SUDAAN syntax for calculating the estimate of the difference<sup><a href="#foot10">10</a></sup>. Appendix B provides corresponding STATA code<sup><a href="#foot11">11</a></sup>.
            </p>

            <p><strong>Table 4 Construction of statistical weights for the combined data file.</strong></p>

            <table class="tbl4Style">

                <thead>

                    <tr>
                        <th headers="blank" id="th1" align="left" width="13%">&nbsp;</th>
                        <th headers="blank" id="th2" align="left" width="13%">Final Sample Weight</th>
                        <th headers="blank" id="th3" align="left" width="13%">Replicate Weights 1-50</th>
                        <th headers="blank" id="th4" align="left" width="21%">Replicate Weights 51-100</th>
                    </tr>
                </thead>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh1" headers="th1"><strong>Hints 2003</strong></th>
                    <!--  ------------------------------------------->

                    <td headers="sh1 th2">2003 Final Weight (FWGT)</td>
                    <td headers="sh1 th3">2003 Replicate Weights (FWGT1-FWGT50)</td>
                    <td headers="sh1 th4">2003 Final Weight (FWGT)</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh2" headers="th1"><strong>Hints 2005</strong></th>
                    <!--  ------------------------------------------->

                    <td headers="sh2 th2">2005 Final Weight (FWGT)</td>
                    <td headers="sh2 th3">2005 Final Weight (FWGT)</td>
                    <td headers="sh2 th4">2005 Replicate Weights (FWGT1-FWGT50)</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh3" headers="th1"><strong>Combined Data</strong></th>
                    <!--  ------------------------------------------->

                    <td headers="sh1 th2">Final Weight (NFWGT)</td>
                    <td headers="sh1 th3">Final Replicate Weights (NFWGT1-NFWGT50)</td>
                    <td headers="sh1 th4">Final Replicate Weights (NFWGT51-NFWGT100)</td>
                </tr>
            </table>

            <p class="small">
                <a id="foot9"></a><sup>9</sup>Under the title &#34;Adjust replicate weights for the combined dataset&#34;.<br />
                <a id="foot10"></a><sup>10</sup>Under the title &#34;Test for differences across years using combined dataset.&#34;<br />
                <a id="foot11"></a><sup>11</sup>Under the titles &#34;Create the replicate weights for the combined data" and "Test for differences across years using combined data&#8230;&#34;.
            </p>

            <p align="right"><a href="#">Back to top</a></p>

            <hr />

            <h3><a name="5"></a>5. GOAL 2&#8212;ESTIMATING CHANGES CONTROLLING FOR OTHER FACTORS</h3>

            <p>The change estimates presented in Section 3 are marginal changes: they are composites of changes in internet usage within specified subgroups, and changes in the percentages of subgroups. For example, suppose there is a change in Internet usage, but it is entirely because one group which had a higher Internet usage is now a larger percentage of the population (all groups within themselves had no change in Internet usage). In general, analysts want to be able to distinguish these compositional changes from actual trends in the characteristic of interest. </p>

            <p>In this section, we explore how to conduct analyses that search for &#8216;true&#8217; non compositional changes in HINTS responses between 2003 and 2005. For example, Table 5-1 presents results from checking for 2003 to 2005 differences using logistic regression (with the binary dependent variable equal to 1 if ever Internet searched, and 0 otherwise). The beta coefficients represent effects on a log-odds<sup><a href="#foot12">12</a></sup> scale: the estimated odds ratios are also given (the transformed beta coefficients). Age, education level, and gender are also main effects in this model, so the year change coefficient can be interpreted as a year-to-year change adjusting for changes in composition by age group, education level, and gender between the two years. The odds ratio for the 2005 to 2003 difference is 1.66: holding constant these other factors, the odds are 66% higher of ever having used the Internet to search for cancer information in 2005 as compared to 2003 (with a 95% confidence interval ranging from 48% to 87% higher). Since the 95% confidence interval for the odds ratio does not include 1, we would reject the hypothesis of no change for Goal 2 example 1. The table shows higher odds ratios for the younger age categories compared to the oldest category (65+) and lower odds ratios for the lower education groups compared to the highest education level group (&#8216;college graduate or more&#8217;). The SAS/SUDAAN and STATA code for carrying out this calculation is given in Appendices A and B respectively.</p>

            <p><strong><a name="5_1"></a>Table 5-1 Changes in percentages of adults who have ever looked for cancer information online between 2003 and 2005 controlling for age, education level, and gender.</strong></p>

            <table class="tblStyle">
                <thead>
                    <tr>
                        <th headers="blank" id="th1" valign="bottom" width="30%" align="left">SUBGROUP</th>
                        <th headers="blank" id="th2" width="14%">Beta Coefficient</th>
                        <th headers="blank" id="th3" width="14%">Standard Error Beta Coefficient</th>
                        <th headers="blank" id="th4" width="14%">Odds Ratio</th>
                        <th headers="blank" id="th5" width="14%">Lower Bound 95% CI Odds Ratio</th>
                        <th headers="blank" id="th6" width="14%">Upper Bound 95% CI Odds Ratio</th>
                    </tr>
                </thead>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh1" headers="th1"><strong>INTERCEPT</strong></th>
                    <!--  ------------------------------------------->

                    <td headers="sh1 th2">-1.74</td>
                    <td headers="sh1 th3">0.11</td>
                    <td headers="sh1 th4">0.17</td>
                    <td headers="sh1 th5">0.14</td>
                    <td headers="sh1 th6">0.22</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh2" headers="th1"><strong>SURVEY YEAR</strong><br />
                        2003</th>
                    <!--  ------------------------------------------->

                    <td headers="sh2 th2">&nbsp;<br />
                        0.00</td>
                    <td headers="sh2 th3">&nbsp;<br />
                        0.00</td>
                    <td headers="sh2 th4">&nbsp;<br />
                        1.00</td>
                    <td headers="sh2 th5">&nbsp;<br />
                        1.00</td>
                    <td headers="sh2 th6">&nbsp;<br />
                        1.00</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh3" headers="th1">2005</th>
                    <!--  ------------------------------------------->

                    <td headers="sh3 th2">0.51</td>
                    <td headers="sh3 th3">0.06</td>
                    <td headers="sh3 th4">1.66</td>
                    <td headers="sh3 th5">1.48</td>
                    <td headers="sh3 th6">1.87</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh4" headers="th1"><strong>AGE</strong><br />
                        18-34</th>
                    <!--  ------------------------------------------->


                    <td headers="sh4 th2">&nbsp;<br />
                        1.57</td>
                    <td headers="sh4 th3">&nbsp;<br />
                        0.10</td>
                    <td headers="sh4 th4">&nbsp;<br />
                        4.78</td>
                    <td headers="sh4 th5">&nbsp;<br />
                        3.93</td>
                    <td headers="sh4 th6">&nbsp;<br />
                        5.83</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh5" headers="th1">35-49</th>
                    <!--  ------------------------------------------->

                    <td headers="sh5 th2">1.45</td>
                    <td headers="sh5 th3">0.09</td>
                    <td headers="sh5 th4">4.27</td>
                    <td headers="sh5 th5">3.57</td>
                    <td headers="sh5 th6">5.13</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh6" headers="th1">50-64</th>
                    <!--  ------------------------------------------->

                    <td headers="sh6 th2">1.32</td>
                    <td headers="sh6 th3">0.10</td>
                    <td headers="sh6 th4">3.75</td>
                    <td headers="sh6 th5">3.06</td>
                    <td headers="sh6 th6">4.60</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh7" headers="th1">65+</th>
                    <!--  ------------------------------------------->

                    <td headers="sh7 th2">0.00</td>
                    <td headers="sh7 th3">0.00</td>
                    <td headers="sh7 th4">1.00</td>
                    <td headers="sh7 th5">1.00</td>
                    <td headers="sh7 th6">1.00</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh8" headers="th1"><strong>EDUCATION LEVEL</strong><br />
                        Less than high school</th>
                    <!--  ------------------------------------------->

                    <td headers="sh8 th2">&nbsp;<br />
                        -2.24</td>
                    <td headers="sh8 th3">&nbsp;<br />
                        0.16</td>
                    <td headers="sh8 th4">&nbsp;<br />
                        0.11</td>
                    <td headers="sh8 th5">&nbsp;<br />
                        0.08</td>
                    <td headers="sh8 th6">&nbsp;<br />
                        0.15</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh9" headers="th1">High school graduate</th>
                    <!--  ------------------------------------------->


                    <td headers="sh9 th2">-1.31</td>
                    <td headers="sh9 th3">0.09</td>
                    <td headers="sh9 th4">0.27</td>
                    <td headers="sh9 th5">0.23</td>
                    <td headers="sh9 th6">0.32</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh10" headers="th1">Some college</th>
                    <!--  ------------------------------------------->


                    <td headers="sh10 th2">-0.59</td>
                    <td headers="sh10 th3">0.08</td>
                    <td headers="sh10 th4">0.55</td>
                    <td headers="sh10 th5">0.47</td>
                    <td headers="sh10 th6">0.64</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh11" headers="th1">College graduate or more</th>
                    <!--  ------------------------------------------->

                    <td headers="sh11 th2">0.00</td>
                    <td headers="sh11 th3">0.00</td>
                    <td headers="sh11 th4">1.00</td>
                    <td headers="sh11 th5">1.00</td>
                    <td headers="sh11 th6">1.00</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh12" headers="th1"><strong>GENDER</strong><br />
                        Male</th>
                    <!--  ------------------------------------------->

                    <td headers="sh12 th2">&nbsp;<br />
                        -0.36</td>
                    <td headers="sh12 th3">&nbsp;<br />
                        0.07</td>
                    <td headers="sh12 th4">&nbsp;<br />
                        0.70</td>
                    <td headers="sh12 th5">&nbsp;<br />
                        0.60</td>
                    <td headers="sh12 th6">&nbsp;<br />
                        0.81</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh13" headers="th1">Female</th>
                    <!--  ------------------------------------------->

                    <td headers="sh13 th2">0.00</td>
                    <td headers="sh13 th3">0.00</td>
                    <td headers="sh13 th4">1.00</td>
                    <td headers="sh13 th5">1.00</td>
                    <td headers="sh13 th6">1.00</td>
                </tr>
            </table>

            <p>To summarize, the model underlying Table 5-1 imposes a structure that year-to-year differences only affect the intercept, and do not also show differences in the slopes for the other covariates. An interaction model can be used to test whether this assumption about the structure is correct. For example, there could have been more gain in ever having looked for cancer information online in the higher education groups than the lower education groups between 2003 and 2005.</p>

            <p>Table 5-2 presents the results of a model in which education level is interacted with year. The &#8216;Education Level 2003&#8217; parameters represent differences between each education level and the baseline education level (&#8216;college graduate or more&#8217;) for the baseline year 2003. These would be the estimates for the main effects for education level in a traditionally structured table (see for example Korn and Graubard [1999], Table 8.4.4) which puts main effects first. The &#8216;Education Level 2005 vs. 2003&#8217; estimates are the differences in education level parameter estimates between 2003 and 2005: the interaction between year (2005 to 2003) and education level. Note that the confidence intervals for the odds ratio for the three interaction terms contain 1, which indicates that there is not a strong interaction between education and survey year in this case. More formal tests of the hypothesis of no interaction between education and survey year, such as the Wald test, are available using both SAS/SUDAAN and STATA.</p>

            <p>If the &#8216;Education Level 2003&#8217; beta coefficients estimates and the &#8216;Education Level 2005 to 2003&#8217; beta coefficient estimates are added together, the resultant summations for each education level are estimates for that education level (as against the baseline education level) for the year 2005.</p>

            <p><strong><a name="5_2"></a>Table 5-2 Changes in percentages of adults who have ever looked for cancer information online between 2003 and 2005 controlling for age, education level, and gender, with a year vs. education level interaction.</strong></p>

            <table class="tblStyle">
                <thead>
                    <tr>
                        <th headers="blank" id="th1" valign="bottom" width="30%" align="left">SUBGROUP</th>
                        <th headers="blank" id="th2" width="14%">Beta Coefficient</th>
                        <th headers="blank" id="th3" width="14%">Standard Error Beta Coefficient</th>
                        <th headers="blank" id="th4" width="14%">Odds Ratio</th>
                        <th headers="blank" id="th5" width="14%">Lower Bound 95% CI Odds Ratio</th>
                        <th headers="blank" id="th6" width="14%">Upper Bound 95% CI Odds Ratio</th>
                    </tr>
                </thead>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh1" headers="th1"><strong>INTERCEPT</strong></th>
                    <!--  ------------------------------------------->

                    <td headers="sh1 th2">-1.73</td>
                    <td headers="sh1 th3">0.10</td>
                    <td headers="sh1 th4">0.18</td>
                    <td headers="sh1 th5">0.15</td>
                    <td headers="sh1 th6">0.22</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh2" headers="th1"><strong>SURVEY YEAR</strong><br />
                        2003</th>
                    <!--  ------------------------------------------->

                    <td headers="sh2 th2">&nbsp;<br />
                        0.00</td>
                    <td headers="sh2 th3">&nbsp;<br />
                        0.00</td>
                    <td headers="sh2 th4">&nbsp;<br />
                        1.00</td>
                    <td headers="sh2 th5">&nbsp;<br />
                        1.00</td>
                    <td headers="sh2 th6">&nbsp;<br />
                        1.00</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh3" headers="th1">2005</th>
                    <!--  ------------------------------------------->

                    <td headers="sh3 th2">0.47</td>
                    <td headers="sh3 th3">0.09</td>
                    <td headers="sh3 th4">1.60</td>
                    <td headers="sh3 th5">1.34</td>
                    <td headers="sh3 th6">1.91</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh4" headers="th1"><strong>AGE</strong><br />
                        18-34</th>
                    <!--  ------------------------------------------->

                    <td headers="sh4 th2">&nbsp;<br />
                        1.57</td>
                    <td headers="sh4 th3">&nbsp;<br />
                        0.10</td>
                    <td headers="sh4 th4">&nbsp;<br />
                        4.80</td>
                    <td headers="sh4 th5">&nbsp;<br />
                        3.94</td>
                    <td headers="sh4 th6">&nbsp;<br />
                        5.84</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh5" headers="th1">35-49</th>
                    <!--  ------------------------------------------->

                    <td headers="sh5 th2">1.46</td>
                    <td headers="sh5 th3">0.09</td>
                    <td headers="sh5 th4">4.29</td>
                    <td headers="sh5 th5">3.58</td>
                    <td headers="sh5 th6">5.14</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh6" headers="th1">50-64</th>
                    <!--  ------------------------------------------->

                    <td headers="sh6 th2">1.32</td>
                    <td headers="sh6 th3">0.10</td>
                    <td headers="sh6 th4">3.75</td>
                    <td headers="sh6 th5">3.06</td>
                    <td headers="sh6 th6">4.60</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh7" headers="th1">65+</th>
                    <!--  ------------------------------------------->
                    <td headers="sh7 th2">0.00</td>
                    <td headers="sh7 th3">0.00</td>
                    <td headers="sh7 th4">1.00</td>
                    <td headers="sh7 th5">1.00</td>
                    <td headers="sh7 th6">1.00</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh8" headers="th1"><strong>GENDER</strong><br />
                        Male</th>
                    <!--  ------------------------------------------->

                    <td headers="sh8 th2">&nbsp;<br />
                        -0.36</td>
                    <td headers="sh8 th3">&nbsp;<br />
                        0.07</td>
                    <td headers="sh8 th4">&nbsp;<br />
                        0.70</td>
                    <td headers="sh8 th5">&nbsp;<br />
                        0.60</td>
                    <td headers="sh8 th6">&nbsp;<br />
                        0.81</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh9" headers="th1">Female</th>
                    <!--  ------------------------------------------->

                    <td headers="sh9 th2">0.00</td>
                    <td headers="sh9 th3">0.00</td>
                    <td headers="sh9 th4">1.00</td>
                    <td headers="sh9 th5">1.00</td>
                    <td headers="sh9 th6">1.00</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh10" headers="th1"><strong>EDUCATION LEVEL 2003</strong><br />
                        Less than high school</th>
                    <!--  ------------------------------------------->

                    <td headers="sh10 th2">&nbsp;<br />
                        -1.97</td>
                    <td headers="sh10 th3">&nbsp;<br />
                        0.25</td>
                    <td headers="sh10 th4">&nbsp;<br />
                        0.14</td>
                    <td headers="sh10 th5">&nbsp;<br />
                        0.09</td>
                    <td headers="sh10 th6">&nbsp;<br />
                        0.23</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh11" headers="th1">High school graduate</th>
                    <!--  ------------------------------------------->

                    <td headers="sh11 th2">-1.40</td>
                    <td headers="sh11 th3">0.11</td>
                    <td headers="sh11 th4">0.25</td>
                    <td headers="sh11 th5">0.20</td>
                    <td headers="sh11 th6">0.31</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh12" headers="th1">Some college</th>
                    <!--  ------------------------------------------->

                    <td headers="sh12 th2">-0.64</td>
                    <td headers="sh12 th3">0.09</td>
                    <td headers="sh12 th4">0.53</td>
                    <td headers="sh12 th5">0.44</td>
                    <td headers="sh12 th6">0.64</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh13" headers="th1">College graduate or more</th>
                    <!--  ------------------------------------------->

                    <td headers="sh13 th2">0.00</td>
                    <td headers="sh13 th3">0.00</td>
                    <td headers="sh13 th4">1.00</td>
                    <td headers="sh13 th5">1.00</td>
                    <td headers="sh13 th6">1.00</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh14" headers="th1"><strong>EDUCATION LEVEL 2005 VS 2003</strong><br />
                        Less than high school</th>
                    <!--  ------------------------------------------->

                    <td headers="sh14 th2">&nbsp;<br />
                        -0.52</td>
                    <td headers="sh14 th3">&nbsp;<br />
                        0.32</td>
                    <td headers="sh14 th4">&nbsp;<br />
                        0.60</td>
                    <td headers="sh14 th5">&nbsp;<br />
                        0.32</td>
                    <td headers="sh14 th6">&nbsp;<br />
                        1.13</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh15" headers="th1">High school graduate</th>
                    <!--  ------------------------------------------->

                    <td headers="sh15 th2">0.16</td>
                    <td headers="sh15 th3">0.17</td>
                    <td headers="sh15 th4">1.17</td>
                    <td headers="sh15 th5">0.83</td>
                    <td headers="sh15 th6">1.65</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh16" headers="th1">Some college</th>
                    <!--  ------------------------------------------->

                    <td headers="sh16 th2">0.08</td>
                    <td headers="sh16 th3">0.15</td>
                    <td headers="sh16 th4">1.09</td>
                    <td headers="sh16 th5">0.81</td>
                    <td headers="sh16 th6">1.46</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh17" headers="th1">College graduate or more</th>
                    <!--  ------------------------------------------->

                    <td headers="sh17 th2">0.00</td>
                    <td headers="sh17 th3">0.00</td>
                    <td headers="sh17 th4">1.00</td>
                    <td headers="sh17 th5">1.00</td>
                    <td headers="sh17 th6">1.00</td>
                </tr>
            </table>

            <p>For example, the odds ratio of 1.60 for 2005 vs. 2003 should be read in this case as a ratio of odds for 2005 college graduates to 2003 college graduates (college graduates are the referent category). The corresponding 2005 to 2003 ratio for &#8216;some college&#8217; is 1.6 * (1.09) = 1.75, for &#8216;less than high school&#8217; is 1.6 * (0.6) = 0.96. Table 5-2 allows one to &#8216;answer&#8217; the Example 2 question under Goal 2 in Section 2. One can also extend the interactions between education level and the other predictors by doing separate analyses using education level as a subgroup. The slope coefficients are individual to that education level subgroup. Tables 5-3-1 through 5-3-4 present these results.</p>

            <p><strong><a name="531_534"></a>Table 5-3-1 Changes in percentages of adults who have ever looked for cancer information online between 2003 and 2005 controlling for age and gender, subsetted to the education level subgroup &#8216;less than high school&#8217;.</strong></p>

            <table class="tblStyle">
                <thead>
                    <tr>
                        <th headers="blank" id="th1" valign="bottom" width="30%" align="left">SUBGROUP</th>
                        <th headers="blank" id="th2" width="14%">Beta Coefficient</th>
                        <th headers="blank" id="th3" width="14%">Standard Error Beta Coefficient</th>
                        <th headers="blank" id="th4" width="14%">Odds Ratio</th>
                        <th headers="blank" id="th5" width="14%">Lower Bound 95% CI Odds Ratio</th>
                        <th headers="blank" id="th6" width="14%">Upper Bound 95% CI Odds Ratio</th>
                    </tr>
                </thead>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh1" headers="th1"><strong>INTERCEPT</strong></th>
                    <!--  ------------------------------------------->

                    <td headers="sh1 th2">-4.41</td>
                    <td headers="sh1 th3">0.44</td>
                    <td headers="sh1 th4">0.01</td>
                    <td headers="sh1 th5">0.01</td>
                    <td headers="sh1 th6">0.03</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh2" headers="th1"><strong>SURVEY YEAR</strong><br />
                        2003</th>
                    <!--  ------------------------------------------->

                    <td headers="sh2 th2">&nbsp;<br />
                        0.00</td>
                    <td headers="sh2 th3">&nbsp;<br />
                        0.00</td>
                    <td headers="sh2 th4">&nbsp;<br />
                        1.00</td>
                    <td headers="sh2 th5">&nbsp;<br />
                        1.00</td>
                    <td headers="sh2 th6">&nbsp;<br />
                        1.00</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh3" headers="th1">2005</th>
                    <!--  ------------------------------------------->

                    <td headers="sh3 th2">-0.07</td>
                    <td headers="sh3 th3">0.30</td>
                    <td headers="sh3 th4">0.93</td>
                    <td headers="sh3 th5">0.51</td>
                    <td headers="sh3 th6">1.68</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh4" headers="th1"><strong>AGE</strong><br />
                        18-34</th>
                    <!--  ------------------------------------------->

                    <td headers="sh4 th2">&nbsp;<br />
                        2.53</td>
                    <td headers="sh4 th3">&nbsp;<br />
                        0.48</td>
                    <td headers="sh4 th4">&nbsp;<br />
                        12.61</td>
                    <td headers="sh4 th5">&nbsp;<br />
                        4.91</td>
                    <td headers="sh4 th6">&nbsp;<br />
                        32.41</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh5" headers="th1">35-49</th>
                    <!--  ------------------------------------------->

                    <td headers="sh5 th2">1.76</td>
                    <td headers="sh5 th3">0.50</td>
                    <td headers="sh5 th4">5.84</td>
                    <td headers="sh5 th5">2.17</td>
                    <td headers="sh5 th6">15.72</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh6" headers="th1">50-64</th>
                    <!--  ------------------------------------------->

                    <td headers="sh6 th2">1.33</td>
                    <td headers="sh6 th3">0.57</td>
                    <td headers="sh6 th4">3.78</td>
                    <td headers="sh6 th5">1.22</td>
                    <td headers="sh6 th6">11.77</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh7" headers="th1">65+</th>
                    <!--  ------------------------------------------->

                    <td headers="sh7 th2">0.00</td>
                    <td headers="sh7 th3">0.00</td>
                    <td headers="sh7 th4">1.00</td>
                    <td headers="sh7 th5">1.00</td>
                    <td headers="sh7 th6">1.00</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh8" headers="th1"><strong>GENDER</strong><br />
                        Male</th>
                    <!--  ------------------------------------------->

                    <td headers="sh8 th2">&nbsp;<br />
                        -0.08</td>
                    <td headers="sh8 th3">&nbsp;<br />
                        0.33</td>
                    <td headers="sh8 th4">&nbsp;<br />
                        0.92</td>
                    <td headers="sh8 th5">&nbsp;<br />
                        0.48</td>
                    <td headers="sh8 th6">&nbsp;<br />
                        1.76</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh9" headers="th1">Female</th>
                    <!--  ------------------------------------------->


                    <td headers="sh9 th2">0.00</td>
                    <td headers="sh9 th3">0.00</td>
                    <td headers="sh9 th4">1.00</td>
                    <td headers="sh9 th5">1.00</td>
                    <td headers="sh9 th6">1.00</td>
                </tr>
            </table>

            <p><strong>Table 5-3-2 Changes in percentages of adults who have ever looked for cancer information online between 2003 and 2005 controlling for age and gender, subsetted to the education level subgroup &#8216;high school graduate&#8217;.</strong></p>

            <table class="tblStyle">
                <thead>
                    <tr>
                        <th headers="blank" id="th1" valign="bottom" width="30%" align="left">SUBGROUP</th>
                        <th headers="blank" id="th2" width="14%">Beta Coefficient</th>
                        <th headers="blank" id="th3" width="14%">Standard Error Beta Coefficient</th>
                        <th headers="blank" id="th4" width="14%">Odds Ratio</th>
                        <th headers="blank" id="th5" width="14%">Lower Bound 95% CI Odds Ratio</th>
                        <th headers="blank" id="th6" width="14%">Upper Bound 95% CI Odds Ratio</th>
                    </tr>
                </thead>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh1" headers="th1"><strong>INTERCEPT</strong></th>
                    <!--  ------------------------------------------->
                    <td headers="sh1 th2">-3.43</td>
                    <td headers="sh1 th3">0.24</td>
                    <td headers="sh1 th4">0.03</td>
                    <td headers="sh1 th5">0.02</td>
                    <td headers="sh1 th6">0.05</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh2" headers="th1"><strong>SURVEY YEAR</strong><br />
                        2003</th>
                    <!--  ------------------------------------------->

                    <td headers="sh2 th2">&nbsp;<br />
                        0.00</td>
                    <td headers="sh2 th3">&nbsp;<br />
                        0.00</td>
                    <td headers="sh2 th4">&nbsp;<br />
                        1.00</td>
                    <td headers="sh2 th5">&nbsp;<br />
                        1.00</td>
                    <td headers="sh2 th6">&nbsp;<br />
                        1.00</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh3" headers="th1">2005</th>
                    <!--  ------------------------------------------->
                    <td headers="sh3 th2">0.64</td>
                    <td headers="sh3 th3">0.14</td>
                    <td headers="sh3 th4">1.90</td>
                    <td headers="sh3 th5">1.45</td>
                    <td headers="sh3 th6">2.49</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh4" headers="th1"><strong>AGE</strong><br />
                        18-34</th>
                    <!--  ------------------------------------------->
                    <td headers="sh4 th2">&nbsp;<br />
                        1.97</td>
                    <td headers="sh4 th3">&nbsp;<br />
                        0.23</td>
                    <td headers="sh4 th4">&nbsp;<br />
                        7.15</td>
                    <td headers="sh4 th5">&nbsp;<br />
                        4.55</td>
                    <td headers="sh4 th6">&nbsp;<br />
                        11.25</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh5" headers="th1">35-49</th>
                    <!--  ------------------------------------------->
                    <td headers="sh5 th2">1.91</td>
                    <td headers="sh5 th3">0.22</td>
                    <td headers="sh5 th4">6.76</td>
                    <td headers="sh5 th5">4.33</td>
                    <td headers="sh5 th6">10.55</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh6" headers="th1">50-64</th>
                    <!--  ------------------------------------------->
                    <td headers="sh6 th2">1.62</td>
                    <td headers="sh6 th3">0.25</td>
                    <td headers="sh6 th4">5.03</td>
                    <td headers="sh6 th5">3.04</td>
                    <td headers="sh6 th6">8.34</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh7" headers="th1">65+</th>
                    <!--  ------------------------------------------->
                    <td headers="sh7 th2">0.00</td>
                    <td headers="sh7 th3">0.00</td>
                    <td headers="sh7 th4">1.00</td>
                    <td headers="sh7 th5">1.00</td>
                    <td headers="sh7 th6">1.00</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh8" headers="th1"><strong>GENDER</strong><br />
                        Male</th>
                    <!--  ------------------------------------------->
                    <td headers="sh8 th2">&nbsp;<br />
                        0.55</td>
                    <td headers="sh8 th3">&nbsp;<br />
                        0.18</td>
                    <td headers="sh8 th4">&nbsp;<br />
                        0.58</td>
                    <td headers="sh8 th5">&nbsp;<br />
                        0.40</td>
                    <td headers="sh8 th6">&nbsp;<br />
                        0.82</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh9" headers="th1">Female</th>
                    <!--  ------------------------------------------->

                    <td headers="sh9 th2">0.00</td>
                    <td headers="sh9 th3">0.00</td>
                    <td headers="sh9 th4">1.00</td>
                    <td headers="sh9 th5">1.00</td>
                    <td headers="sh9 th6">1.00</td>
                </tr>
            </table>

            <p><strong>Table 5-3-3 Changes in percentages of adults who have ever looked for cancer information online between 2003 and 2005 controlling for age and gender, subsetted to the education level subgroup &#8216;some college&#8217;.</strong></p>

            <table class="tblStyle">
                <thead>
                    <tr>
                        <th headers="blank" id="th1" valign="bottom" width="30%" align="left">SUBGROUP</th>
                        <th headers="blank" id="th2" width="14%">Beta Coefficient</th>
                        <th headers="blank" id="th3" width="14%">Standard Error Beta Coefficient</th>
                        <th headers="blank" id="th4" width="14%">Odds Ratio</th>
                        <th headers="blank" id="th5" width="14%">Lower Bound 95% CI Odds Ratio</th>
                        <th headers="blank" id="th6" width="14%">Upper Bound 95% CI Odds Ratio</th>
                    </tr>
                </thead>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh1" headers="th1"><strong>INTERCEPT</strong></th>
                    <!--  ------------------------------------------->
                    <td headers="sh1 th2">-2.28</td>
                    <td headers="sh1 th3">0.16</td>
                    <td headers="sh1 th4">0.10</td>
                    <td headers="sh1 th5">0.07</td>
                    <td headers="sh1 th6">0.14</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh2" headers="th1"><strong>SURVEY YEAR</strong><br />
                        2003</th>
                    <!--  ------------------------------------------->
                    <td headers="sh2 th2">&nbsp;<br />
                        0.00</td>
                    <td headers="sh2 th3">&nbsp;<br />
                        0.00</td>
                    <td headers="sh2 th4">&nbsp;<br />
                        1.00</td>
                    <td headers="sh2 th5">&nbsp;<br />
                        1.00</td>
                    <td headers="sh2 th6">&nbsp;<br />
                        1.00</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh3" headers="th1">2005</th>
                    <!--  ------------------------------------------->
                    <td headers="sh3 th2">0.56</td>
                    <td headers="sh3 th3">0.12</td>
                    <td headers="sh3 th4">1.74</td>
                    <td headers="sh3 th5">1.38</td>
                    <td headers="sh3 th6">2.20</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh4" headers="th1"><strong>AGE</strong><br />
                        18-34</th>
                    <!--  ------------------------------------------->
                    <td headers="sh4 th2">&nbsp;<br />
                        1.49</td>
                    <td headers="sh4 th3">&nbsp;<br />
                        0.17</td>
                    <td headers="sh4 th4">&nbsp;<br />
                        4.44</td>
                    <td headers="sh4 th5">&nbsp;<br />
                        3.15</td>
                    <td headers="sh4 th6">&nbsp;<br />
                        6.26</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh5" headers="th1">35-49</th>
                    <!--  ------------------------------------------->
                    <td headers="sh1 th2">1.46</td>
                    <td headers="sh1 th3">0.17</td>
                    <td headers="sh1 th4">4.33</td>
                    <td headers="sh1 th5">3.09</td>
                    <td headers="sh1 th6">6.06</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh6" headers="th1">50-64</th>
                    <!--  ------------------------------------------->
                    <td headers="sh6 th2">1.31</td>
                    <td headers="sh6 th3">0.18</td>
                    <td headers="sh6 th4">3.72</td>
                    <td headers="sh6 th5">2.61</td>
                    <td headers="sh6 th6">5.29</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh7" headers="th1">65+</th>
                    <!--  ------------------------------------------->
                    <td headers="sh7 th2">0.00</td>
                    <td headers="sh7 th3">0.00</td>
                    <td headers="sh7 th4">1.00</td>
                    <td headers="sh7 th5">1.00</td>
                    <td headers="sh7 th6">1.00</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh8" headers="th1"><strong>GENDER</strong><br />
                        Male</th>
                    <!--  ------------------------------------------->
                    <td headers="sh8 th2">&nbsp;<br />
                        -0.50</td>
                    <td headers="sh8 th3">&nbsp;<br />
                        0.13</td>
                    <td headers="sh8 th4">&nbsp;<br />
                        0.61</td>
                    <td headers="sh8 th5">&nbsp;<br />
                        0.47</td>
                    <td headers="sh8 th6">&nbsp;<br />
                        0.78</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh9" headers="th1">Female</th>
                    <!--  ------------------------------------------->
                    <td headers="sh9 th2">0.00</td>
                    <td headers="sh9 th3">0.00</td>
                    <td headers="sh9 th4">1.00</td>
                    <td headers="sh9 th5">1.00</td>
                    <td headers="sh9 th6">1.00</td>
                </tr>
            </table>

            <p><strong>Table 5-3-4 Changes in percentages of adults who have ever looked for cancer information online between 2003 and 2005 controlling for age and gender, subsetted to the education level subgroup &#8216;college graduate or more&#8217;.</strong></p>

            <table class="tblStyle">
                <thead>
                    <tr>
                        <th headers="blank" id="th1" valign="bottom" width="30%" align="left">SUBGROUP</th>
                        <th headers="blank" id="th2" width="14%">Beta Coefficient</th>
                        <th headers="blank" id="th3" width="14%">Standard Error Beta Coefficient</th>
                        <th headers="blank" id="th4" width="14%">Odds Ratio</th>
                        <th headers="blank" id="th5" width="14%">Lower Bound 95% CI Odds Ratio</th>
                        <th headers="blank" id="th6" width="14%">Upper Bound 95% CI Odds Ratio</th>
                    </tr>
                </thead>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh1" headers="th1"><strong>INTERCEPT</strong></th>
                    <!--  ------------------------------------------->
                    <td headers="sh1 th2">-1.54</td>
                    <td headers="sh1 th3">0.13</td>
                    <td headers="sh1 th4">0.21</td>
                    <td headers="sh1 th5">0.17</td>
                    <td headers="sh1 th6">0.28</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh2" headers="th1"><strong>SURVEY YEAR</strong><br />
                        2003</th>
                    <!--  ------------------------------------------->
                    <td headers="sh2 th2">&nbsp;<br />
                        0.00</td>
                    <td headers="sh2 th3">&nbsp;<br />
                        0.00</td>
                    <td headers="sh2 th4">&nbsp;<br />
                        1.00</td>
                    <td headers="sh2 th5">&nbsp;<br />
                        1.00</td>
                    <td headers="sh2 th6">&nbsp;<br />
                        1.00</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh3" headers="th1">2005</th>
                    <!--  ------------------------------------------->
                    <td headers="sh3 th2">0.46</td>
                    <td headers="sh3 th3">0.09</td>
                    <td headers="sh3 th4">1.58</td>
                    <td headers="sh3 th5">1.33</td>
                    <td headers="sh3 th6">1.88</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh4" headers="th1"><strong>AGE</strong><br />
                        18-34</th>
                    <!--  ------------------------------------------->
                    <td headers="sh4 th2">&nbsp;<br />
                        1.24</td>
                    <td headers="sh4 th3">&nbsp;<br />
                        0.15</td>
                    <td headers="sh4 th4">&nbsp;<br />
                        3.45</td>
                    <td headers="sh4 th5">&nbsp;<br />
                        2.56</td>
                    <td headers="sh4 th6">&nbsp;<br />
                        4.66</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh5" headers="th1">35-49</th>
                    <!--  ------------------------------------------->
                    <td headers="sh5 th2">1.12</td>
                    <td headers="sh5 th3">0.14</td>
                    <td headers="sh5 th4">3.08</td>
                    <td headers="sh5 th5">2.33</td>
                    <td headers="sh5 th6">4.06</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh6" headers="th1">50-64</th>
                    <!--  ------------------------------------------->
                    <td headers="sh6 th2">1.13</td>
                    <td headers="sh6 th3">0.15</td>
                    <td headers="sh6 th4">3.10</td>
                    <td headers="sh6 th5">2.32</td>
                    <td headers="sh6 th6">4.15</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh7" headers="th1">65+</th>
                    <!--  ------------------------------------------->
                    <td headers="sh7 th2">0.00</td>
                    <td headers="sh7 th3">0.00</td>
                    <td headers="sh7 th4">1.00</td>
                    <td headers="sh7 th5">1.00</td>
                    <td headers="sh7 th6">1.00</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh8" headers="th1"><strong>GENDER</strong><br />
                        Male</th>
                    <!--  ------------------------------------------->
                    <td headers="sh8 th2">&nbsp;<br />
                        -0.18</td>
                    <td headers="sh8 th3">&nbsp;<br />
                        0.08</td>
                    <td headers="sh8 th4">&nbsp;<br />
                        0.84</td>
                    <td headers="sh8 th5">&nbsp;<br />
                        0.71</td>
                    <td headers="sh8 th6">&nbsp;<br />
                        0.99</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh9" headers="th1">Female</th>
                    <!--  ------------------------------------------->
                    <td headers="sh9 th2">0.00</td>
                    <td headers="sh9 th3">0.00</td>
                    <td headers="sh9 th4">1.00</td>
                    <td headers="sh9 th5">1.00</td>
                    <td headers="sh9 th6">1.00</td>
                </tr>
            </table>

            <p>The survey year row of Table 5-3-1 through 5-3-4 can be used to test the null hypothesis of no change in ever looking for cancer information online for a different education group (Goal 2: Example 2); we reject the hypothesis at the 5% significance level if the 95% confidence interval for the odds ratio (for 2005) does not include 1. In this case, we reject the hypothesis of no change in ever looking for cancer information online for three of the four education groups (all but the 'less than high school' group).</p>

            <p>In summary, the analyses shown in Tables 5-3-1 through 5-3-4 are all useful. Table 5-2 provides a more concise summary of parameter estimates than Tables 5-3-1 through 5-3-4 under stronger assumptions, which may or may not be correct. Tables 5-3-1 through 5-3-4 show different beta coefficient estimates for survey year, age, and gender, while Table 5-2 shows a single estimate.</p>

            <p>Appendix A has SAS/SUDAAN code for carrying out these steps (indicated by table number), and Appendix B has STATA for carrying out these steps (also indicated by table number).</p>

            <p class="small">
                <a id="foot12"></a><sup>12</sup>The odds of an event is the probability of an event divided by the complement of that probability, or p / (1-p): e.g., an event probability of 1/2 corresponds to the event occurring with odds 1; an event probability of 2/3 corresponds to the event occurring with odds 2. An odds ratio of 1.6 between Events A and B means the following. Suppose Event A has an event probability of 1/3 (an odds ratio of 1/2).Then Event B will have an odds 1.6 times higher, or 0.8, which corresponds to an event probability of 44.5%. If Event A has an event probability of 1/2 (odds of 1), then Event B will have odds of 1.6 (1.6 times 1), which corresponds to an event probability of 61.5%. Note also that the probability p can be computed from the odds O as p = O / (1 + O).The log-odds is the logarithm of the odds (putting the naturally multiplicative odds scale onto an additive scale).
            </p>

            <p align="right"><a href="#">Back to top</a></p>

            <hr />

            <h3><a name="6"></a>6. GOAL 3&#8211;ESTIMATING AVERAGES BY COMBINING 2003 AND 2005 DATA</h3>

            <p>With two distinct surveys, we report separate values for two surveys or one value summarizing the entire time period. The one value for HINTS would be an average of the 2003 value and the 2005 value. If the distinct estimates from the two years are quite different, then reporting their average may not be a good idea, since the average may represent two distinct values or a single value. But in those cases when estimates from the two years do not differ much, then combining the data sets will certainly allow a considerable increase in precision (twice as large a sample size). This may be very useful for population subgroups in which the one-year sample sizes are not very large.</p>

            <p>The average of two survey years may be estimated by using one of two easy steps: 1) using two separate data files, and 2) using the combined data file. In the first approach, we use the mean value <em>&#952;</em><sub>m</sub>= 0.5* (<em>&#952;</em><sub>1</sub> + <em>&#952;</em><sub>2</sub>) as the parameter of interest. Table 6-1 shows how we would compute the mean and its variance. The second method estimates the mean of the two years using the combined data with the new weights described in Section 4. The mean over the two years using these weights is implicitly estimating the parameter <em>&#952;</em><sub>w</sub>= (&#925;<sub>1</sub><em>&#952;</em><sub>1</sub> + &#925;<sub>2</sub><em>&#952;</em><sub>2</sub>) / (&#925;<sub>1</sub> + &#925;<sub>2</sub>), where &#925;<sub>1</sub> and &#925;<sub>2</sub> are the population sizes in the two surveys. When the population sizes in the two surveys are constant, the weighted mean reduces to the unweighted mean <em>&#952;</em><sub>m</sub>. Over a short period of time, the population size of most groups would change very little so that the two parameters should be similar; however, there may be subgroups increasing or decreasing in size rapidly by immigration. One advantage of using the combined data set with the new weights is that it takes into account change in population size.</p>

            <p><strong>Table 6-1 Summary of estimating changes using two independent surveys.</strong></p>

            <table class="tbl4Style">
                <thead>
                    <tr>
                        <th headers="blank" id="th1" align="left" width="15%">Year</th>
                        <th headers="blank" id="th2" align="left" width="15%">True Value</th>
                        <th headers="blank" id="th3" align="left" width="15%">Estimated Value</th>
                        <th headers="blank" id="th4" align="left" width="25%">Variance of Estimate</th>
                    </tr>
                </thead>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh1" headers="th1">1</th>
                    <!--  ------------------------------------------->

                    <td headers="sh1 th2"><em>&#952;</em><sub>1</sub></td>
                    <td headers="sh1 th3">
                        <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>1</sub></td>
                    <td headers="sh1 th4"><em>&#957;</em>(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13"><sub>1</sub>)</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh2" headers="th1">2</th>
                    <!--  ------------------------------------------->

                    <td headers="sh2 th2"><em>&#952;</em><sub>2</sub></td>
                    <td headers="sh2 th3">
                        <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>2</sub></td>
                    <td headers="sh2 th4"><em>&#957;</em>(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13"><sub>2</sub>)</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh3" headers="th1">Average</th>
                    <!--  ------------------------------------------->

                    <td headers="sh1 th2"><em>&#952;</em><sub>m</sub>= 0.5* (<em>&#952;</em><sub>2</sub>-<em>&#952;</em><sub>1</sub>)</td>
                    <td headers="sh1 th3">
                        <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" />= 0.5* (<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>1</sub>+<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>2</sub>)</td>
                    <td headers="sh1 th4"><em>&#957;</em>(<img src="/_images/deltahat.jpg" alt="delta-hat" width="7" height="12">)= 0.25* (<em>&#957;</em>(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>1</sub>)+<em>&#957;</em>(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>2</sub>))</td>
                </tr>
            </table>

            <p><strong>Table 6-2 presents averages of the separate-year estimates<sup><a href="#foot13">13</a></sup> for the percentage of adults who ever looked for cancer information online (<em>&#952;</em><sub>m</sub>). It should be noted in the computation of the confidence intervals Table 6-2 uses a symmetric t-distribution with 98 degrees of freedom<sup><a href="#foot14">14</a></sup>.</strong></p>

            <table class="tblStyle">
                <thead>
                    <tr>
                        <th headers="blank" id="th1" width="20%" valign="bottom" align="left"><strong>SUBGROUP</strong></th>
                        <th headers="blank" id="th2" width="10%">2003 Weighted Estimate<br />
                            <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="9" height="17" /><sub>1</sub></th>
                        <th headers="blank" id="th3" width="10%">Standard Error<br />
                            <img src="/_images/scientific_equations-3.jpg" alt="square root of the estimated variance of theta hat 1" width="44" height="24" /></th>
                        <th headers="blank" id="th4" width="10%">2005 Weighted Estimate<br />
                            <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="9" height="17" /><sub>2</sub></th>
                        <th headers="blank" id="th5" width="10%">Standard Error<br />
                            <img src="/_images/scientific_equations-4.jpg" alt="square root of the estimated variance of theta hat 2" width="44" height="24" /></th>
                        <th headers="blank" id="th6" width="10%">2003 to 2005 Average<br />
                            <img src="/_images/scientific_equations-7.jpg" alt="{theta hat 1 plus theta hat 2} divided by two" /></th>
                        <th headers="blank" id="th7" width="10%">Standard Error</th>
                        <th headers="blank" id="th8" width="10%">Lower Bound 95% CI</th>
                        <th headers="blank" id="th9" width="10%">Upper Bound 95% CI</th>
                    </tr>
                </thead>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh1" headers="th1">ALL</th>
                    <!--  ------------------------------------------->
                    <td headers="sh1 th2">19.7%</td>
                    <td headers="sh1 th3">0.6%</td>
                    <td headers="sh1 th4">28.3%</td>
                    <td headers="sh1 th5">0.7%</td>
                    <td headers="sh1 th6">24.0%</td>
                    <td headers="sh1 th7">0.5%</td>
                    <td headers="sh1 th8">23.1%</td>
                    <td headers="sh1 th9">24.9%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="9">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh2" headers="th1"><strong>Age</strong><br />
                        18&#8211;34</th>
                    <!--  ------------------------------------------->
                    <td headers="sh2 th2">&nbsp;<br />
                        23.5%</td>
                    <td headers="sh2 th3">&nbsp;<br />
                        1.3%</td>
                    <td headers="sh2 th4">&nbsp;<br />
                        32.6%</td>
                    <td headers="sh2 th5">&nbsp;<br />
                        1.5%</td>
                    <td headers="sh2 th6">&nbsp;<br />
                        28.0%</td>
                    <td headers="sh2 th7">&nbsp;<br />
                        1.0%</td>
                    <td headers="sh2 th8">&nbsp;<br />
                        26.0%</td>
                    <td headers="sh2 th9">&nbsp;<br />
                        30.0%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh3" headers="th1">35&#8211;49</th>
                    <!--  ------------------------------------------->
                    <td headers="sh3 th2">23.3%</td>
                    <td headers="sh3 th3">1.2%</td>
                    <td headers="sh3 th4">32.5%</td>
                    <td headers="sh3 th5">1.6%</td>
                    <td headers="sh3 t6h">27.9%</td>
                    <td headers="sh3 th7">1.0%</td>
                    <td headers="sh3 th8">25.9%</td>
                    <td headers="sh3 th9">29.9%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh4" headers="th1">50&#8211;64</th>
                    <!--  ------------------------------------------->
                    <td headers="sh4 th2">20.6%</td>
                    <td headers="sh4 th3">1.2%</td>
                    <td headers="sh4 th4">30.0%</td>
                    <td headers="sh4 t5h">1.4%</td>
                    <td headers="sh4 th6">25.3%</td>
                    <td headers="sh4 th7">0.9%</td>
                    <td headers="sh4 th8">23.5%</td>
                    <td headers="sh4 th9">27.1%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh5" headers="th1">65+</th>
                    <!--  ------------------------------------------->
                    <td headers="sh5 th2">4.2%</td>
                    <td headers="sh5 th3">0.5%</td>
                    <td headers="sh5 th4">9.6%</td>
                    <td headers="sh5 th5">0.8%</td>
                    <td headers="sh5 th6">6.9%</td>
                    <td headers="sh5 th7">0.4%</td>
                    <td headers="sh5 th8">6.1%</td>
                    <td headers="sh5 th9">7.8%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="9">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh6" headers="th1"><strong>Education Level</strong><br />
                        Less than high school</th>
                    <!--  ------------------------------------------->
                    <td headers="sh6 th2">&nbsp;<br />
                        6.5%</td>
                    <td headers="sh6 th3">&nbsp;<br />
                        1.4%</td>
                    <td headers="sh6 th4">&nbsp;<br />
                        6.4%</td>
                    <td headers="sh6 th5">&nbsp;<br />
                        1.1%</td>
                    <td headers="sh6 th6">&nbsp;<br />
                        6.4%</td>
                    <td headers="sh6 th7">&nbsp;<br />
                        0.9%</td>
                    <td headers="sh6 th8">&nbsp;<br />
                        4.7%</td>
                    <td headers="sh6 th9">&nbsp;<br />
                        8.1%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh7" headers="th1">High school graduate</th>
                    <!--  ------------------------------------------->
                    <td headers="sh7 th2">12.0%</td>
                    <td headers="sh7 th3">0.9%</td>
                    <td headers="sh7 th4">19.9%</td>
                    <td headers="sh7 th5">1.6%</td>
                    <td headers="sh7 th6">16.0%</td>
                    <td headers="sh7 th7">0.9%</td>
                    <td headers="sh7 th8">14.2%</td>
                    <td headers="sh7 th9">17.8%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh8" headers="th1">Some college</th>
                    <!--  ------------------------------------------->
                    <td headers="sh8 th2">23.9%</td>
                    <td headers="sh8 th3">1.3%</td>
                    <td headers="sh8 th4">34.7%</td>
                    <td headers="sh8 th5">1.9%</td>
                    <td headers="sh8 th6">29.3%</td>
                    <td headers="sh8 th7">1.2%</td>
                    <td headers="sh8 th8">27.0%</td>
                    <td headers="sh8 th9">31.6%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh9" headers="th1">College graduate or more</th>
                    <!--  ------------------------------------------->
                    <td headers="sh9 th2">36.0%</td>
                    <td headers="sh9 th3">1.3%</td>
                    <td headers="sh9 th4">46.5%</td>
                    <td headers="sh9 th5">1.6%</td>
                    <td headers="sh9 th6">41.2%</td>
                    <td headers="sh9 th7">1.0%</td>
                    <td headers="sh9 th8">39.2%</td>
                    <td headers="sh9 th9">43.3%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="9">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh10" headers="th1"><strong>Race</strong><br />
                        Non-Hispanic White</th>
                    <!--  ------------------------------------------->
                    <td headers="sh10 th2">&nbsp;<br />
                        23.1%</td>
                    <td headers="sh10 th3">&nbsp;<br />
                        0.8%</td>
                    <td headers="sh10 th4">&nbsp;<br />
                        33.3%</td>
                    <td headers="sh10 th5">&nbsp;<br />
                        1.1%</td>
                    <td headers="sh10 th6">&nbsp;<br />
                        28.2%</td>
                    <td headers="sh10 th7">&nbsp;<br />
                        0.6%</td>
                    <td headers="sh10 th8">&nbsp;<br />
                        26.9%</td>
                    <td headers="sh10 th9">&nbsp;<br />
                        29.5%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh11" headers="th1">Non-Hispanic Black</th>
                    <!--  ------------------------------------------->
                    <td headers="sh11 th2">13.6%</td>
                    <td headers="sh11 th3">1.7%</td>
                    <td headers="sh11 th4">23.3%</td>
                    <td headers="sh11 t5h">3.4%</td>
                    <td headers="sh11 th6">18.4%</td>
                    <td headers="sh11 th7">1.9%</td>
                    <td headers="sh11 th8">14.7%</td>
                    <td headers="sh11 th9">22.2%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh12" headers="th1">Hispanic</th>
                    <!--  ------------------------------------------->
                    <td headers="sh12 th2">7.2%</td>
                    <td headers="sh12 th3">1.0%</td>
                    <td headers="sh12 th4">11.2%</td>
                    <td headers="sh12 th5">2.0%</td>
                    <td headers="sh12 th6">9.2%</td>
                    <td headers="sh12 th7">1.1%</td>
                    <td headers="sh12 th8">7.0%</td>
                    <td headers="sh12 th9">11.4%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh13" headers="th1">Non-Hispanic Other</th>
                    <!--  ------------------------------------------->
                    <td headers="sh13 th2">22.1%</td>
                    <td headers="sh13 th3">2.4%</td>
                    <td headers="sh13 th4">28.2%</td>
                    <td headers="sh13 th5">3.7%</td>
                    <td headers="sh13 th6">25.2%</td>
                    <td headers="sh13 th7">2.2%</td>
                    <td headers="sh13 th8">20.8%</td>
                    <td headers="sh13 th9">29.5%</td>
                </tr>
                <tr>

                    <td headers="blank" colspan="9">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh14" headers="th1"><strong>Gender</strong><br />
                        Male</th>
                    <!--  ------------------------------------------->
                    <td headers="sh14 th2">&nbsp;<br />
                        16.7%</td>
                    <td headers="sh14 th3">&nbsp;<br />
                        0.8%</td>
                    <td headers="sh14 th4">&nbsp;<br />
                        25.3%</td>
                    <td headers="sh14 th5">&nbsp;<br />
                        1.4%</td>
                    <td headers="sh14 th6">&nbsp;<br />
                        21.0%</td>
                    <td headers="sh14 th7">&nbsp;<br />
                        0.8%</td>
                    <td headers="sh14 th8">&nbsp;<br />
                        19.3%</td>
                    <td headers="sh14 th9">&nbsp;<br />
                        22.6%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh15" headers="th1">Female</th>
                    <!--  ------------------------------------------->
                    <td headers="sh15 th2">22.4%</td>
                    <td headers="sh15 th3">0.9%</td>
                    <td headers="sh15 th4">31.0%</td>
                    <td headers="sh15 th5">0.9%</td>
                    <td headers="sh15 th6">26.7%</td>
                    <td headers="sh15 th7">0.6%</td>
                    <td headers="sh15 th8">25.5%</td>
                    <td headers="sh15 th9">27.9%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="9">&nbsp;</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh16" headers="th1"><strong>Annual Income</strong><br />
                        Less than $25,000</th>
                    <!--  ------------------------------------------->
                    <td headers="sh16 th2">&nbsp;<br />
                        10.1%</td>
                    <td headers="sh16 th3">&nbsp;<br />
                        0.9%</td>
                    <td headers="sh16 th4">&nbsp;<br />
                        18.0%</td>
                    <td headers="sh16 th5">&nbsp;<br />
                        1.5%</td>
                    <td headers="sh16 th6">&nbsp;<br />
                        14.0%</td>
                    <td headers="sh16 th7">&nbsp;<br />
                        0.9%</td>
                    <td headers="sh16 th8">&nbsp;<br />
                        12.3%</td>
                    <td headers="sh16 th9">&nbsp;<br />
                        15.8%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh17" headers="th1">$25,000 to $49,999</th>
                    <!--  ------------------------------------------->
                    <td headers="sh17 th2">16.6%</td>
                    <td headers="sh17 th3">1.2%</td>
                    <td headers="sh17 th4">25.6%</td>
                    <td headers="sh17 th5">1.9%</td>
                    <td headers="sh17 th6">21.1%</td>
                    <td headers="sh17 th7">1.1%</td>
                    <td headers="sh17 th8">18.9%</td>
                    <td headers="sh17 th9">23.3%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh18" headers="th1">$50,000 to $74,999</th>
                    <!--  ------------------------------------------->
                    <td headers="sh18 th2">27.3%</td>
                    <td headers="sh18 th3">1.6%</td>
                    <td headers="sh18 th4">30.4%</td>
                    <td headers="sh18 th5">2.0%</td>
                    <td headers="sh18 th6">28.9%</td>
                    <td headers="sh18 th7">1.3%</td>
                    <td headers="sh18 th8">26.3%</td>
                    <td headers="sh18 th9">31.4%</td>
                </tr>
                <tr>
                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh19" headers="th1">$75,000 or more</th>
                    <!--  ------------------------------------------->
                    <td headers="sh19 th2">36.3%</td>
                    <td headers="sh19 th3">1.8%</td>
                    <td headers="sh19 th4">44.6%</td>
                    <td headers="sh19 th5">2.1%</td>
                    <td headers="sh19 th6">40.5%</td>
                    <td headers="sh19 th7">1.4%</td>
                    <td headers="sh19 th8">37.7%</td>
                    <td headers="sh19 th9">43.2%</td>
                </tr>
            </table>

            <p>Table 6-3 presents results for estimating <em>&#952;</em><sub>w</sub>: the weighted parameter. These calculations are all directly from the SAS/SUDAAN and STATA listings, and present the 95% confidence intervals presented by the SAS/SUDAAN package. Note that these confidence intervals are asymmetric, as the endpoints are reverse logistic transformations of symmetric confidence intervals on the logit scale. The STATA code provides similar results with slightly different degrees of freedom. Note that the STATA software provides a number of commands for confidence interval formation<sup><a href="#foot15">15</a></sup>. As mentioned above, between HINTS 2003 and 2005, we would not expect large differences between the estimates and confidence intervals for the two parameters, <em>&#952;</em><sub>m</sub> and <em>&#952;</em><sub>w</sub>. Comparison of the results from Tables 6-2 and 6-3 shows this to be the case; the upper and lower bounds differ by less than one percentage point for every subgroup.</p>

            <p><strong><a name="6_3"></a>Table 6-3 Percentages of adults who have ever looked for cancer information online using the combined 2003/2005 data file.</strong></p>

            <table class="tblStyle">
                <thead>
                    <tr>
                        <th headers="blank" id="th1" width="25%" valign="bottom" align="left"><strong>SUBGROUP</strong></th>
                        <th headers="blank" id="th2" width="11%">2003 Weighted Estimate</th>
                        <th headers="blank" id="th3" width="11%">Standard Error</th>
                        <th headers="blank" id="th4" width="11%">2005 Weighted Estimate</th>
                        <th headers="blank" id="th5" width="11%">Standard Error</th>
                        <th headers="blank" id="th6" width="11%">2003 to 2005 <em>&#952;</em><sub>w</sub> Estimate</th>
                        <th headers="blank" id="th7" width="10%">Lower Bound 95% CI</th>
                        <th headers="blank" id="th8" width="10%">Upper Bound 95% CI</th>
                    </tr>
                </thead>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh1" headers="th1">ALL</th>
                    <!--  ------------------------------------------->
                    <td headers="sh1 th2">19.7%</td>
                    <td headers="sh1 th3">0.6%</td>
                    <td headers="sh1 th4">28.3%</td>
                    <td headers="sh1 th5">0.7%</td>
                    <td headers="sh1 th6">24.0%</td>
                    <td headers="sh1 th7">23.1%</td>
                    <td headers="sh1 th8">25.0%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="8">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh2" headers="th1"><strong>Age</strong><br />
                        18&#8211;34</th>
                    <!--  ------------------------------------------->
                    <td headers="sh2 th2">&nbsp;<br />
                        23.5%</td>
                    <td headers="sh2 th3">&nbsp;<br />
                        1.3%</td>
                    <td headers="sh2 th4">&nbsp;<br />
                        32.6%</td>
                    <td headers="sh2 th5">&nbsp;<br />
                        1.5%</td>
                    <td headers="sh2 th6">&nbsp;<br />
                        28.1%</td>
                    <td headers="sh2 th7">&nbsp;<br />
                        26.2%</td>
                    <td headers="sh2 t8h">&nbsp;<br />
                        30.1%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh3" headers="th1">35&#8211;49</th>
                    <!--  ------------------------------------------->
                    <td headers="sh3 th2">23.3%</td>
                    <td headers="sh3 th3">1.2%</td>
                    <td headers="sh3 th4">32.5%</td>
                    <td headers="sh3 th5">1.6%</td>
                    <td headers="sh3 th6">27.9%</td>
                    <td headers="sh3 th7">26.0%</td>
                    <td headers="sh3 th8">29.9%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh4" headers="th1">50&#8211;64</th>
                    <!--  ------------------------------------------->
                    <td headers="sh4 th2">20.6%</td>
                    <td headers="sh4 th3">1.2%</td>
                    <td headers="sh4 th4">30.0%</td>
                    <td headers="sh4 th5">1.4%</td>
                    <td headers="sh4 th6">25.5%</td>
                    <td headers="sh4 th7">23.7%</td>
                    <td headers="sh4 th8">27.4%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh5" headers="th1">65+</th>
                    <!--  ------------------------------------------->
                    <td headers="sh5 th2">4.2%</td>
                    <td headers="sh5 th3">0.5%</td>
                    <td headers="sh5 th4">9.6%</td>
                    <td headers="sh5 th5">0.8%</td>
                    <td headers="sh5 th6">7.0%</td>
                    <td headers="sh5 th7">6.1%</td>
                    <td headers="sh5 th8">7.9%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="8">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh6" headers="th1"><strong>Education Level</strong><br />
                        Less than high school</th>
                    <!--  ------------------------------------------->
                    <td headers="sh6 th2">&nbsp;<br />
                        6.5%</td>
                    <td headers="sh6 th3">&nbsp;<br />
                        1.4%</td>
                    <td headers="sh6 th4">&nbsp;<br />
                        6.4%</td>
                    <td headers="sh6 th5">&nbsp;<br />
                        1.1%</td>
                    <td headers="sh6 th6">&nbsp;<br />
                        6.4%</td>
                    <td headers="sh6 th7">&nbsp;<br />
                        4.9%</td>
                    <td headers="sh6 th8">&nbsp;<br />
                        8.4%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh7" headers="th1">High school graduate</th>
                    <!--  ------------------------------------------->
                    <td headers="sh7 th2">12.0%</td>
                    <td headers="sh7 th3">0.9%</td>
                    <td headers="sh7 th4">19.9%</td>
                    <td headers="sh7 th5">1.6%</td>
                    <td headers="sh7 th6">15.9%</td>
                    <td headers="sh7 th7">14.2%</td>
                    <td headers="sh7 th8">17.8%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh8" headers="th1">Some college</th>
                    <!--  ------------------------------------------->
                    <td headers="sh8 th2">23.9%</td>
                    <td headers="sh8 th3">1.3%</td>
                    <td headers="sh8 th4">34.7%</td>
                    <td headers="sh8 th5">1.9%</td>
                    <td headers="sh8 th6">29.9%</td>
                    <td headers="sh8 th7">27.5%</td>
                    <td headers="sh8 th8">32.3%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh9" headers="th1">College graduate or more</th>
                    <!--  ------------------------------------------->
                    <td headers="sh9 th2">36.0%</td>
                    <td headers="sh9 th3">1.3%</td>
                    <td headers="sh9 th4">46.5%</td>
                    <td headers="sh9 th5">1.6%</td>
                    <td headers="sh9 th6">41.2%</td>
                    <td headers="sh9 th7">39.2%</td>
                    <td headers="sh9 th8">43.2%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="8">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh10" headers="th1"><strong>Race</strong><br />
                        Non-Hispanic White</th>
                    <!--  ------------------------------------------->
                    <td headers="sh10 th2">&nbsp;<br />
                        23.1%</td>
                    <td headers="sh10 th3">&nbsp;<br />
                        0.8%</td>
                    <td headers="sh10 th4">&nbsp;<br />
                        33.3%</td>
                    <td headers="sh10 th5">&nbsp;<br />
                        1.1%</td>
                    <td headers="sh10 th6">&nbsp;<br />
                        28.2%</td>
                    <td headers="sh10 th7">&nbsp;<br />
                        26.9%</td>
                    <td headers="sh10 th8">&nbsp;<br />
                        29.5%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh11" headers="th1">Non-Hispanic Black</th>
                    <!--  ------------------------------------------->
                    <td headers="sh11 th2">13.6%</td>
                    <td headers="sh11 th3">1.7%</td>
                    <td headers="sh11 th4">23.3%</td>
                    <td headers="sh11 th5">3.4%</td>
                    <td headers="sh11 th6">18.4%</td>
                    <td headers="sh11 th7">15.0%</td>
                    <td headers="sh11 th8">22.4%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh12" headers="th1">Hispanic</th>
                    <!--  ------------------------------------------->
                    <td headers="sh12 th2">7.2%</td>
                    <td headers="sh12 th3">1.0%</td>
                    <td headers="sh12 th4">11.2%</td>
                    <td headers="sh12 th5">2.0%</td>
                    <td headers="sh12 th6">9.3%</td>
                    <td headers="sh12 th7">7.2%</td>
                    <td headers="sh12 th8">11.9%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh13" headers="th1">Non-Hispanic Other</th>
                    <!--  ------------------------------------------->
                    <td headers="sh13 th2">22.1%</td>
                    <td headers="sh13 th3">2.4%</td>
                    <td headers="sh13 th4">28.2%</td>
                    <td headers="sh13 th5">3.7%</td>
                    <td headers="sh13 th6">25.5%</td>
                    <td headers="sh13 th7">21.2%</td>
                    <td headers="sh13 th8">30.3%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="8">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh14" headers="th1"><strong>Gender</strong><br />
                        Male</th>
                    <!--  ------------------------------------------->
                    <td headers="sh14 th2">&nbsp;<br />
                        16.7%</td>
                    <td headers="sh14 th3">&nbsp;<br />
                        0.8%</td>
                    <td headers="sh14 th4">&nbsp;<br />
                        25.3%</td>
                    <td headers="sh14 th5">&nbsp;<br />
                        1.4%</td>
                    <td headers="sh14 th6">&nbsp;<br />
                        21.1%</td>
                    <td headers="sh14 th7">&nbsp;<br />
                        19.5%</td>
                    <td headers="sh14 th8">&nbsp;<br />
                        22.8%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh15" headers="th1">Female</th>
                    <!--  ------------------------------------------->
                    <td headers="sh15 th2">22.4%</td>
                    <td headers="sh15 th3">0.9%</td>
                    <td headers="sh15 th4">31.0%</td>
                    <td headers="sh15 th5">0.9%</td>
                    <td headers="sh15 th6">26.8%</td>
                    <td headers="sh15 th7">25.6%</td>
                    <td headers="sh15 th8">28.0%</td>
                </tr>
                <tr>
                    <td headers="blank" colspan="8">&nbsp;</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh16" headers="th1"><strong>Annual Income</strong><br />
                        Less than $25,000</th>
                    <!--  ------------------------------------------->
                    <td headers="sh16 th2">&nbsp;<br />
                        10.1%</td>
                    <td headers="sh16 th3">&nbsp;<br />
                        0.9%</td>
                    <td headers="sh16 th4">&nbsp;<br />
                        18.0%</td>
                    <td headers="sh16 th5">&nbsp;<br />
                        1.5%</td>
                    <td headers="sh16 th6">&nbsp;<br />
                        13.7%</td>
                    <td headers="sh16 th7">&nbsp;<br />
                        12.1%</td>
                    <td headers="sh16 th8">&nbsp;<br />
                        15.6%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh17" headers="th1">$25,000 to $49,999</th>
                    <!--  ------------------------------------------->
                    <td headers="sh17 th2">16.6%</td>
                    <td headers="sh17 th3">1.2%</td>
                    <td headers="sh17 th4">25.6%</td>
                    <td headers="sh17 th5">1.9%</td>
                    <td headers="sh17 th6">20.5%</td>
                    <td headers="sh17 th7">18.5%</td>
                    <td headers="sh17 th8">22.7%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh18" headers="th1">$50,000 to $74,999</th>
                    <!--  ------------------------------------------->
                    <td headers="sh18 th2">27.3%</td>
                    <td headers="sh18 th3">1.6%</td>
                    <td headers="sh18 th4">30.4%</td>
                    <td headers="sh18 th5">2.0%</td>
                    <td headers="sh18 th6">29.0%</td>
                    <td headers="sh18 th7">26.5%</td>
                    <td headers="sh18 th8">31.6%</td>
                </tr>
                <tr>

                    <!--  ------------------------------------------->
                    <th style="text-align: left; font-weight: normal" id="sh19" headers="th1">$75,000 or more</th>
                    <!--  ------------------------------------------->
                    <td headers="sh19 th2">36.3%</td>
                    <td headers="sh19 th3">1.8%</td>
                    <td headers="sh19 th4">44.6%</td>
                    <td headers="sh19 th5">2.1%</td>
                    <td headers="sh19 th6">40.8%</td>
                    <td headers="sh19 th7">38.1%</td>
                    <td headers="sh19 th8">43.6%</td>
                </tr>
            </table>

            <p class="small">
                <a id="foot13"></a><sup>13</sup>These separate-year estimates were computed using SAS/SUDAAN and STATA (both programs giving the same answer).The averaging was done in Excel.<br />
                <a id="foot14"></a><sup>14</sup>These t confidence intervals were computed using Excel.<br />
                <a id="foot15"></a><sup>15</sup>For example, for dichotomous response variables, if one uses the svy: mean or svy: proportion command then the confidence interval will be symmetric. If one uses the svy: tabulate command the confidence interval will be asymmetric (it uses the logit transform).
            </p>

            <p align="right"><a href="#">Back to top</a></p>

            <hr />
            <h3><a name="7"></a>7. OTHER ANALYSES</h3>

            <p>The previous sections concerned estimation and testing for a prevalence (mean) using one or two of the HINTS survey years. Although the prevalence is often the parameter of interest in public health, other characteristics such as a total may be of interest. Continuing the example considered in the first six sections, a researcher might be interested in the estimated total number of the population (or a subgroup) who had ever looked for cancer information using the Internet. The total number of users can be expressed as the product of the prevalence and the population size. Thus, the programs that were used to estimate prevalence can also be used to estimate the total by modification of the option statements in the program; for example, we could obtain estimates of the total in SAS/SUDAAN using PROC DESCRIPT. When using the data from two years, we need to distinguish between the total over both years (the sum of the two yearly totals) and the average total, which is half of the total over both years. The average total is more easily interpreted in most cases.</p>

            <p>The logistic regression analyses described in this users guide can easily be extended to ordinal logistic regression and linear regression models. In SUDAAN the appropriate command for ordinal/nominal multinomial logistic regression is PROC MULTILOG. In STATA, the corresponding command for ordered logistic regression is SVY:OLOGIT. REGRESS (SVY:REGRESS) is the proper command for linear regression in SAS/SUDAAN (STATA).</p>

            <p align="right"><a href="#">Back to top</a></p>

            <hr />

            <h3><a name="ref"></a>REFERENCES</h3>

            <p>Bickel, P., and Doksum, K. A. (1977). <em>Mathematical Statistics</em>. Oakland, CA: Holden-Day.</p>

            <p>Cochran, W. G. (1977). <em>Sampling Techniques</em>, 3<sup>rd</sup> ed. New York: John Wiley &#38; Sons.</p>

            <p>Korn, E. L., and Graubard, B. I. (1999). <em>Analysis of Health Surveys</em>. New York: John Wiley &#38; Sons.</p>

            <p>Lee, S., Davis, W. D., Nquyen, H. A., McNeel, T. S., Brick, J. M., Flores-Cervantes, I. (2007). Examining trends and averages using combined cross-sectional survey data from multiple years. Available as a methodology paper on <a target="_blank" href="http://www.chis.ucla.edu">www.chis.ucla.edu</a><a href="exit_disclaimer.aspx"><img src="/_images/Icon_External_Link.png" width="12" height="12" alt="Exit Disclaimer" border="0" /></a>.</p>

            <p>Oh, H. L., and Scheuren, F. S. (1983). Weighting adjustments for unit nonresponse, in <em>Incomplete Data in Sample Surveys, Vol. II: Theory and Annotated Bibliography</em> (W. G. Madow, I. Olkin, and D. B. Rubin, eds.), New York: Academic Press.</p>

            <p>Research Triangle Institute (2004). <em>SUDAAN Example Manual: Release 9.0</em>. Research Triangle Park, NC: Research Triangle Institute.</p>

            <p>StataCorp. 2007. <em>Stata Statistical Software: Release 10</em>. College Station, TX: StataCorp LP.</p>

            <p align="right"><a href="#">Back to top</a></p>

            <hr />

            <h3><a name="a"></a>Appendix A. SAS/SUDAAN Code for Carrying Out the Calculations</h3>

            <p>
                /*HINTS Data - SAS Transport Files &#38; Format Files*/<br />
                filename hints1 pipe &#8216;gunzip -c /&#60;insert file path name&#62;/sasdata/hints2003.d2006_06_02.public.v8x.gz&#8217;;<br />
                filename hints2 pipe &#8216;gunzip -c /&#60;insert file path name&#62;/sasdata/hints2005.d2006_06_02.public.v8x.gz&#8217;;<br />
                filename forms1 &#34;/&#60;insert file path name&#62;/progs/formats.hints2003.d2006_06_02.public.sas&#34;;<br />
                filename forms2 &#34;/&#60;insert file path name&#62;/progs/formats.hints2005.d2006_06_02.public.sas&#34;;<br />
                *************************************************************************************;<br />
                proc cimport data=hints1 infile=hints1;<br />
                proc cimport data=hints2 infile=hints2;<br />
                proc format; %include forms1;<br />
                proc format; %include forms2;
            </p>

            <p>
                proc format;<br />
                value yearf<br />
                1=&#8216;2003&#8217;<br />
                2=&#8216;2005&#8217;;
            </p>

            <p>
                value agef<br />
                1=&#8216;18-34&#8217;<br />
                2=&#8216;35-49&#8217;<br />
                3=&#8216;50-64&#8217;<br />
                4=&#8216;65&#8217;;
            </p>

            <p>
                value racef<br />
                1=&#8216;NH White&#8217;<br />
                2=&#8216;NH Black&#8217;<br />
                3=&#8216;Hispanic&#8217;<br />
                4=&#8216;NH Other&#8217;;
            </p>

            <p>
                value educf<br />
                1=&#8216;Less than High School Grad&#8217;<br />
                2=&#8216;High School Grad&#8217;<br />
                3=&#8216;Some College&#8217;<br />
                4=&#8216;College Grad&#8217;;
            </p>

            <p>
                value sexf<br />
                1=&#8216;Male&#8217;<br />
                2=&#8216;Female&#8217;;
            </p>

            <p>
                value incomef<br />
                1=&#8216;&#60;$25K&#8217;<br />
                2=&#8216;$25K-&#60;$50K&#8217;<br />
                3=&#8216;$50K-&#60;$75K&#8217;<br />
                4=&#8216;$75K+&#8217;;
            </p>

            <p>
                value yesno<br />
                0=&#8216;No&#8217;<br />
                1=&#8216;Yes&#8217;;
            </p>

            <p>run;</p>

            <p><strong>VARIABLE RECODES</strong></p>

            <p>
                data combined;<br />
                set hints1(in=in1 keep=spgender spage RaceEthn HHIncB EducA fwgt fwgt1-fwgt50 bmi<br />
                HC9SeekCancerInfo HC20UseInternet HC27LastOnlineHealth HC29InternetForCancer)<br />
                <br />

                hints2(in=in2 keep=spgender spage RaceEthn HHIncB EducA fwgt fwgt1-fwgt50 bmi<br />
                CA12WhereLookCancerInfo CA08SeekCancerInfo GA1UseInternet CA15InternetForCancer );
            </p>

            <p>
                label srvyYear=&#34;Survey Year&#34;;<br />
                if in1 then srvyYear=1;**2003;<br />
                else if in2 then srvyYear=2;**2005;<br />
                format srvyYear yearf.;
            </p>

            <p>
                /*Demographic Characteristics*/<br />
                label sex=&#8216;Gender&#8217;;<br />
                sex=spgender;<br />
                format sex sexf.;
            </p>

            <p>
                label age=&#8216;Age Group&#8217;;<br />
                if 18<=spage<=34 then age=1;**18-34;<br />
                else if 35<=spage<=49 then age=2;**35-49;<br />
                else if 50<=spage<=64 then age=3;**50-64;<br />
                else if 65<=spage<=96 then age=4;**65+;<br />
                format age agef.;
            </p>

            <p>
                label race=&#8216;Race/Ethnicity&#8217;;<br />
                if raceEthn=1 then race=3;**Hispanic;<br />
                else if raceEthn=2 then race=1;**NH White;<br />
                else if raceEthn=3 then race=2;**NH Black;<br />
                else if 4<=raceEthn &#60;=7 then race=4;**NH Other;<br />
                format race racef.;
            </p>

            <p>
                label income=&#8216;Household Income&#8217;;<br />
                if HHIncB=1 then income=1;**&#60;$25K;<br />
                else if HHIncB in (2,3) then income=2;**$25K-&#60;$50K;<br />
                else if HHIncB in (4,5) then income=HHIncB-1;**$50K-&#60;$75K/$75K+;<br />
                format income incomef.;<br />
                label educ=&#34;Education&#34;;<br />
                if educA in (1,2,3,4) then educ=EducA;<br />
                format educ educf.;
            </p>

            <p>
                /*InternetForCancer Recode - All Respondents*/<br />
                label InternetForCancer=&#34;Have you ever specifically looked for cancer info online?&#34;;<br />
                if srvyYear=1 then do;***2003 Recode;<br />
                /*Respondents who never looked for health information online*/<br />
                if HC9SeekCancerInfo=2 or HC20UseInternet=2 or HC27LastOnlineHealth=5<br />
                then InternetForCancer=0;**No;<br />
                /*Respondents who have used the internet for general health information*/<br />
                else if HC29InternetForCancer in (1,2)<br />
                then InternetForCancer=mod(HC29InternetForCancer,2);**Yes/No;<br />
                end;
            </p>

            <p>
                else if srvyYear=2 then do;**2005 Recode;<br />
                /*Respondents whose last search for cancer information was online*/<br />
                if CA12WhereLookCancerInfo=7 then InternetForCancer=1;**Yes;<br />
                /*Respondents who never looked for health information online*/<br />
                else if CA08SeekCancerInfo=2 or GA1UseInternet=2 then InternetForCancer=0;**No;<br />
                /*Respondents who have used the internet for general health information*/<br />
                else if CA15InternetForCancer in (1,2)<br />
                then InternetForCancer=mod(CA15InternetForCancer,2);**Yes/No;<br />
                end;<br />
                format InternetForCancer yesno.;
            </p>

            <p>
                /*Adjust Replicate Weights for the combined dataset*/<br />
                array origwgts[50] fwgt1-fwgt50;<br />
                array newwgts[100] nfwgt1-nfwgt100;<br />
                nfwgt=fwgt;<br />
                do i = 1 to 50;<br />
                if srvyYear=1 then do;***2003;<br />
                newwgts[i] = origwgts[i];<br />
                newwgts[i+50] = fwgt;<br />
                end;
            </p>

            <p>
                else if srvyYear=2 then do;***2005;<br />
                newwgts[i] = fwgt;<br />
                newwgts[i+50] = origwgts[i];<br />
                end;<br />
                end;
            </p>

            <p>run;</p>

            <strong>SUDAAN COMPUTATIONS</strong>

            <p><strong>/*SUDAAN users are given the option to select the denominator degrees of freedom within each procedure. The default degrees of freedom is not optimal for computations involving differences in percentages and averages over years using combined data sets. More precise results may be obtained by using the Welch approximation (see Appendix C). Once computed, the approximation can be entered into SUDAAN using the DDF= option. In order to mirror the STATA figures, the denominator degrees of freedom have been set to 99. */</strong></p>

            <p><strong>GOAL 1&#8212;Estimating Changes Without Controlling for Other Factors. (<a href="#3">See section 3</a>.)</strong></p>

            <p>
                <strong>/*Test for total difference across years using combined dataset.*/<br />
                    /*This code recreates the estimates and p-values in the ALL row in Table 3-2.*/</strong><br />
                proc descript data=combined design=jackknife ddf=99;<br />
                weight nfwgt;<br />
                jackwgts nfwgt1-nfwgt100 / adjjack=.98;<br />
                class srvyYear InternetForCancer _one_ /nofreq;<br />
                var InternetForCancer;<br />
                catlevel 1;<br />
                tables _one_;<br />
                diffvar srvyYear=(2 1) / name="Change from 2003 to 2005";<br />
                print nsum percent sepercent lowpct uppct t_pct p_pct / style=nchs;<br />
                run;
            </p>

            <p>
                <strong>/*View percentages by specified years using combined dataset.*/<br />
                    /*This code recreates the yearly percentages and standard errors in columns 1&#150;4 of Table 3-2.*/</strong><br />
                proc descript data= combined design=jackknife ddf=99;<br />
                weight nfwgt;<br />
                jackwgts nfwgt1-nfwgt100 / adjjack=.98;<br />
                class srvyYear age educ sex income race InternetForCancer/nofreq;<br />
                var InternetForCancer;<br />
                catlevel 1;<br />
                table srvyYear*(age educ sex income race);<br />
                print nsum percent sepercent lowpct uppct / style=nchs;<br />
                run;
            </p>

            <p>
                <strong>/*Test for differences across years for a subset of demographic va riables using combined dataset.*/<br />
                    /*This code recreates the difference estimates and two-sided p-values in columns 5&#150;7 of Table 3-2.<br />
                    It also regenerates the 95% confidence intervals provided in Table 3-3. P-values will va ry based on choice<br />
                    of denominator degrees of freedom.*/</strong><br />
                proc descript data= combined design=jackknife ddf=99;<br />
                weight nfwgt;<br />
                jackwgts nfwgt1-nfwgt100 / adjjack=.98;<br />
                class srvyYear age educ sex income race InternetForCancer/nofreq;<br />
                var InternetForCancer;<br />
                catlevel 1;<br />
                diffvar srvyYear=(2 1) / name="Change from 2003 to 2005";<br />
                tables age educ sex income race;<br />
                print nsum percent sepercent lowpct uppct t_pct p_pct / style=nchs;<br />
                run;
            </p>

            <p><strong>GOAL 2&#8212;Estimating Changes Controlling for Other Factors. (<a href="#5">See section 5</a>.)</strong></p>

            <p>
                <strong>/*Assess differences across years while controlling for cova riates&#151;education, age, and gender&#151;using the combined dataset. See Table 5-1.*/</strong><br />
                proc rlogist data=combined design=jackknife ddf=99;<br />
                weight nfwgt;<br />
                jackwgts nfwgt1-nfwgt100 / adjjack=.98;<br />
                class srvyYear educ age sex/nofreq;<br />
                model InternetForCancer=srvyYear educ age sex;<br />
                reflev srvyYear=1;<br />
                run;
            </p>

            <p>
                <strong>/*Assess differences across years while controlling for cova riates&#151;education, age, and gender&#151;using the combined dataset. Includes an interaction term to test for differential change by levels of education. <a href="#5_2">See Table 5-2</a>.*/</strong><br />
                proc rlogist data= combined design=jackknife ddf=99;<br />
                weight nfwgt;<br />
                jackwgts nfwgt1-nfwgt100 / adjjack=.98;<br />
                class srvyYear educ age sex/nofreq;<br />
                model InternetForCancer=srvyYear educ age sex srvyYear*educ;<br />
                effects srvyYear / name="SRVYYEAR";**Wald F values for SRVYYEAR;<br />
                effects educ / name="EDUC";**Wald F values for EDUC;<br />
                reflev srvyYear=1;<br />
                run;
            </p>

            <p>
                <strong>/*Assess differences across years for each level of education while controlling for age and gender.*/<br />
                    /*Note subpopn statement that delineates testing at each level of education.*/<br />
                    /*<a href="#531_534">See Tables 5-3-1 through 5-3-4</a>*/</strong><br />
                proc rlogist data= combined design=jackknife ddf=99;<br />
                weight nfwgt;<br />
                jackwgts nfwgt1-nfwgt100 / adjjack=.98;<br />
                subpopn educ=1 / name=&#34;<strong>Less than High School Only</strong>&#34;;<br />
                class srvyYear age sex / nofreq;<br />
                model InternetForCancer=srvyYear age sex;<br />
                reflev srvyYear=1;<br />
                run;
            </p>

            <p>
                proc rlogist data= combined design=jackknife ddf=99;<br />
                weight nfwgt;<br />
                jackwgts nfwgt1-nfwgt100 / adjjack=.98;<br />
                subpopn educ=2 / name=&#34;<strong>High School Graduates Only</strong>&#34;;<br />
                class srvyYear age sex / nofreq;<br />
                model InternetForCancer=srvyYear age sex;<br />
                reflev srvyYear=1;<br />
                run;
            </p>

            <p>
                proc rlogist data= combined design=jackknife ddf=99;<br />
                weight nfwgt;<br />
                jackwgts nfwgt1-nfwgt100 / adjjack=.98;<br />
                subpopn educ=3 / name=&#34;<strong>Some College Only</strong>&#34;;<br />
                class srvyYear age sex / nofreq;<br />
                model InternetForCancer=srvyYear age sex;<br />
                reflev srvyYear=1;<br />
                run;
            </p>

            <p>
                proc rlogist data= combined design=jackknife ddf=99;<br />
                weight nfwgt;<br />
                jackwgts nfwgt1-nfwgt100 / adjjack=.98;<br />
                subpopn educ=4 / name=&#34;<strong>College Graduates Only</strong>&#34;;<br />
                class srvyYear age sex / nofreq;<br />
                model InternetForCancer=srvyYear age sex;<br />
                reflev srvyYear=1;<br />
                run;
            </p>

            <p><strong>GOAL 3&#8212;Estimating Averages by Combining 2003 and 2005 Data. (<a href="#6">See section 6</a>.)</strong></p>

            <p>
                <strong>/*Obtain weighted percentages by demographic subgroup using combined dataset. See Table 6-3.*/</strong><br />
                proc descript data= combined design=jackknife ddf=99;<br />
                weight nfwgt;<br />
                jackwgts nfwgt1-nfwgt100 / adjjack=.98;<br />
                class srvyYear age educ sex income race InternetForCancer/nofreq;<br />
                var InternetForCancer;<br />
                catlevel 1;<br />
                tables age educ sex income race;<br />
                print nsum percent sepercent lowpct uppct / style=nchs;<br />
                run;
            </p>

            <p align="right"><a href="#">Back to top</a></p>

            <hr />

            <h3><a name="b"></a>APPENDIX B. STATA CODE FOR CARRYING OUT THE CALCULATIONS</h3>

            <p><strong>MANIPULATE 2003 DATA</strong></p>

            <p>
                log using &#34;&#60;insert file path name&#62;\data step.log&#34;, replace<br />
                set memory 512m<br />
                use &#34;&#60;insert file path name&#62;\hints2003.d2006_06_02.public.dta&#34;<br />
                keep spgender spage raceethn hhincb educa fwgt fwgt1-fwgt50 bmi hc9seekcancerinfo hc20useinternet<br />
                hc27lastonlinehealth hc29internetforcancer<br />
                generate srvyyear = 1<br />
                label variable srvyyear &#34;Survey Year&#34;
            </p>

            <p>
                *** Create the demographic variables<br />
                recode spgender (1=1 &#34;Male&#34;) (2=2 &#34;Female&#34;), generate(sex)<br />
                label variable sex &#34;Gender&#34;
            </p>

            <p>
                recode spage (18/34=1 &#34;18-34&#34;) (35/49=2&#34;"35-49") (50/64=3 &#34;50-64&#34;) (65/96=4 &#34;65 +&#34;) (nonmissing=.),<br />
                generate(age)<br />
                label variable age &#34;Age Group&#34;
            </p>

            <p>
                recode raceethn (1=3 &#34;Hispanic&#34;) (2=1 &#34;NH White&#34;) (3=2 &#34;NH Black&#34;) (4/7=4 &#34;NH Other&#34;) (nonmissing=.),<br />
                generate(race)<br />
                label variable race &#34;Race/Ethnicity&#34;
            </p>

            <p>
                recode hhincb (1=1 &#34;&#60;$25K&#34;) (2 3=2 &#34;$25K-&#60;$50K&#34;) (4=3 &#34;$50K-&#60;$75K&#34;) (5=4 &#34;$75K &#34;) (nonmissing=.),<br />
                generate(income)<br />
                label variable income &#34;Household Income&#34;
            </p>

            <p>
                recode educa (1=1 &#34;Less than High School Grad&#34;) (2=2 &#34;High School Grad&#34;) (3=3 &#34;Some College&#34;) (4=4 &#34;College Grad&#34;) (nonmissing=.), generate(educ)<br />
                label variable educ &#34;Education&#34;
            </p>

            <p>
                * Create the variable internetforcancer<br />
                generate internetforcancer = .<br />
                * Respondents who never looked for health information online<br />
                replace internetforcancer = 0 if hc9seekcancerinfo == 2<br />
                replace internetforcancer = 0 if hc20useinternet == 2<br />
                replace internetforcancer = 0 if hc27lastonlinehealth == 5<br />
                * Respondents who have used the internet for general health information<br />
                replace internetforcancer = 0 if hc29internetforcancer == 2<br />
                replace internetforcancer = 1 if missing(internetforcancer) &#38; hc29internetforcancer == 1<br />
                label variable internetforcancer "Have you ever specifically looked for cancer info online?"
            </p>

            <p>
                * Create the replicate weights for the combined data<br />
                generate nfwgt = fwgt
            </p>

            <p>
                foreach i of numlist 1/50 {<br />
                generate nfwgt&#8216;i&#8217; = fwgt&#8216;i&#8217;<br />
                }
            </p>

            <p>
                foreach i of numlist 51/100 {<br />
                generate nfwgt&#8216;i&#8217; = fwgt<br />
                }
            </p>

            <p>save hints, replace</p>

            <p><strong>MANIPULATE 2005 DATA</strong></p>

            <p>use "&#60;insert file path name&#62;\hints2005.d2006_06_02.public.dta", clear</p>

            <p>keep spgender spage raceethn hhincb educa fwgt fwgt1-fwgt50 bmi ca12wherelookcancerinfo ca08seekcancerinfo ga1useinternet ca15internetforcancer</p>

            <p>generate srvyyear = 2</p>

            <p>
                * Create the demographic variables<br />
                recode spgender (1=1 &#34;Male&#34;) (2=2 &#34;Female&#34;), generate(sex)<br />
                recode spage (18/34=1 &#34;18-34&#34;) (35/49=2 &#34;35-49&#34;) (50/64=3 &#34;50-64&#34;) (65/96=4 &#34;65 +&#34;) (nonmissing=.),<br />
                generate(age)<br />
                recode raceethn (1=3 &#34;Hispanic&#34;) (2=1 &#34;NH White&#34;) (3=2 &#34;NH Black&#34;) (4/7=4 &#34;NH Other&#34;) (nonmissing=.),<br />
                generate(race)<br />
                recode hhincb (1=1 &#34;&#60;$25K&#34;) (2 3=2 &#34;$25K-&#60;$50K&#34;) (4=3 &#34;$50K-&#60;$75K&#34;) (5=4 &#34;$75K +&#34;) (nonmissing=.),<br />
                generate(income)<br />
                recode educa (1=1 &#34;Less than High School Grad&#34;) (2=2 &#34;High School Grad&#34;) (3=3 &#34;Some College&#34;) (4=4 &#34;College Grad&#34;) (nonmissing=.), generate(educ)
            </p>

            <p>
                * Create the variable internetforcancer<br />
                generate internetforcancer = .
            </p>

            <p>
                * Respondents whose last search for cancer information was online<br />
                replace internetforcancer = 1 if ca12wherelookcancerinfo == 7
            </p>

            <p>
                * Respondents who never looked for health information online<br />
                replace internetforcancer = 0 if missing(internetforcancer) &#38; (ca08seekcancerinfo == 2 | ga1useinternet == 2)
            </p>

            <p>
                * Respondents who have used the internet for general health information
    replace internetforcancer = 2 - ca15internetforcancer if missing(internetforcancer) &#38; (ca15internetforcancer == 1 | ca15internetforcancer == 2)
            </p>

            <p>
                * Create the replicate weights for the combined data<br />
                generate nfwgt = fwgt
            </p>

            <p>
                foreach i of numlist 1/50 {<br />
                generate nfwgt&#8216;i&#8217; = fwgt<br />
                }
            </p>

            <p>
                foreach i of numlist 51/100 {<br />
                local j = &#8216;i&#8217; - 50<br />
                generate nfwgt&#8216;i&#8217; = fwgt&#8216;j&#8217;<br />
                }
            </p>

            <p><strong>COMBINE 2003 and 2005 DATASETS</strong></p>

            <p>
                append using hints<br />
                save &#34;&#60;insert file path name&#62;\combined.dta&#34;, replace<br />
                log close<br />
                exit, STATA clear
            </p>

            <p><strong>STATA COMPUTATIONS</strong></p>

            <p>
                *In Stata 10, the user can not specify the design degrees of freedom.<br />
                log using &#34;&#60;insert file path name&#62;\analysis step.log&#34;, replace<br />
                set memory 512m<br />
                use &#34;&#60;insert file path name&#62;\combined.dta&#34;, clear<br />
                svyset [pw=nfwgt], jkrw(nfwgt1-nfwgt100, multiplier(0.98)) vce(jack) mse
            </p>

            <p><strong>GOAL 1&#8212;Estimating Changes Without Controlling for Other Factors. (<a href="#3">See section 3</a>.)</strong></p>

            <p>
                ***The following codes recreate the yearly percentages, differences, standard errors, and two-sided p-<br />
                ***values in columns 1-7 of Table 3-2. Also included are the 95% C.I.'s provided in Table 3-3.<br />
                * Test for differences across years using combined data -- overall<br />
                svy: mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1
            </p>

            <p>
                * Test for differences across years using combined data -- by age group<br />
                * among non-missing age<br />
                generate selectedgroup = (age ~= .)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among those with age 18-34<br />
                generate selectedgroup = (age == 1) if !missing(age)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among those with age 35-49<br />
                generate selectedgroup = (age == 2) if !missing(age)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among those with age 50-64<br />
                generate selectedgroup = (age == 3) if !missing(age)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among those with age 65+<br />
                generate selectedgroup = (age == 4) if !missing(age)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * Test for differences across years using combined data -- by education group<br />
                * among non-missing education<br />
                generate selectedgroup = (educ ~= .)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among those less than high school<br />
                generate selectedgroup = (educ == 1) if !missing(educ)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among those high school graduate<br />
                generate selectedgroup = (educ == 2) if !missing(educ)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among those some college<br />
                generate selectedgroup = (educ == 3) if !missing(educ)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among those college graduate<br />
                generate selectedgroup = (educ == 4) if !missing(educ)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * Test for differences across years using combined data -- by sex<br />
                * among non-missing sex<br />
                generate selectedgroup = (sex ~= .)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among males<br />
                generate selectedgroup = (sex == 1) if !missing(sex)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among females<br />
                generate selectedgroup = (sex == 2) if !missing(sex)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * Test for differences across years using combined data -- by income group<br />
                * among non-missing income<br />
                generate selectedgroup = (income ~= .)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among those &#60; $25K<br />
                generate selectedgroup = (income == 1) if !missing(income)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among those $25K -&#60; $50K<br />
                generate selectedgroup = (income == 2) if !missing(income)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among those $50K -&#60; $75K<br />
                generate selectedgroup = (income == 3) if !missing(income)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among those $75K+<br />
                generate selectedgroup = (income == 4) if !missing(income)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * Test for differences across years using combined data -- by race group<br />
                * among non-missing race<br />
                generate selectedgroup = (race ~= .)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among NH white<br />
                generate selectedgroup = (race == 1) if !missing(race)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among NH black<br />
                generate selectedgroup = (race == 2) if !missing(race)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among Hispanic<br />
                generate selectedgroup = (race == 3) if !missing(race)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p>
                * among NH other<br />
                generate selectedgroup = (race == 4) if !missing(race)<br />
                svy, subpop(selectedgroup): mean internetforcancer, over(srvyyear)<br />
                lincom [internetforcancer]2 - [internetforcancer]1<br />
                drop selectedgroup
            </p>

            <p><strong>GOAL 2&#8212;Estimating Changes Controlling for Other Factors. (<a href="#5">See section 5</a>.)</strong></p>

            <p>
                *** Logistic Regression &#150; adjusted by education, age and sex. (<a href="#5_1">Table 5-1</a>)<br />
                char srvyyear [omit] 1<br />
                char educ [omit] 4<br />
                char age [omit] 4<br />
                char sex [omit] 2<br />
                xi: svy: logit internetforcancer i.srvyyear i.educ i.age i.sex<br />
                test _Isrvyyear_2 _Ieduc_1 _Ieduc_2 _Ieduc_3 _Iage_1 _Iage_2 _Iage_3 _Isex_1 _cons, nosvyadjust<br />
                test _Isrvyyear_2 _Ieduc_1 _Ieduc_2 _Ieduc_3 _Iage_1 _Iage_2 _Iage_3 _Isex_1, nosvyadjust<br />
                test _Isrvyyear_2, nosvyadjust<br />
                test _Ieduc_1 _Ieduc_2 _Ieduc_3, nosvyadjust<br />
                test _Iage_1 _Iage_2 _Iage_3, nosvyadjust<br />
                test _Isex_1, nosvyadjust<br />
                xi: svy, or: logit internetforcancer i.srvyyear i.educ i.age i.sex
            </p>

            <p>
                *** Logistic Regression -- adjusted by education, age, sex and i.srvyyear*i.educ. (Table 5-2)<br />
                xi: svy: logit internetforcancer i.srvyyear i.educ i.age i.sex i.srvyyear*i.educ<br />
                test _Isrvyyear_2 _Ieduc_1 _Ieduc_2 _Ieduc_3 _Iage_1 _Iage_2 _Iage_3 _Isex_1 _IsrvXedu_2_1 _IsrvXedu_2_2<br />
                _IsrvXedu_2_3 _cons, nosvyadjust<br />
                test _Isrvyyear_2 _Ieduc_1 _Ieduc_2 _Ieduc_3 _Iage_1 _Iage_2 _Iage_3 _Isex_1 _IsrvXedu_2_1 _IsrvXedu_2_2<br />
                _IsrvXedu_2_3, nosvyadjust<br />
                test _Isrvyyear_2, nosvyadjust<br />
                test _Ieduc_1 _Ieduc_2 _Ieduc_3, nosvyadjust<br />
                test _Iage_1 _Iage_2 _Iage_3, nosvyadjust<br />
                test _Isex_1, nosvyadjust<br />
                test _IsrvXedu_2_1 _IsrvXedu_2_2 _IsrvXedu_2_3, nosvyadjust<br />
                xi: svy, or: logit internetforcancer i.srvyyear i.educ i.age i.sex i.srvyyear*i.educ
            </p>

            <p>
                *** Logistic Regression &#150; adjusted by age and sex, stratified by education. (Table 5-3)<br />
                * among those less than high school<br />
                generate selectedgroup = (educ == 1) if !missing(educ)<br />
                xi: svy, subpop(selectedgroup): logit internetforcancer i.srvyyear i.age i.sex<br />
                test _Isrvyyear_2 _Iage_1 _Iage_2 _Iage_3 _Isex_1 _cons, nosvyadjust<br />
                test _Isrvyyear_2 _Iage_1 _Iage_2 _Iage_3 _Isex_1, nosvyadjust<br />
                test _Isrvyyear_2, nosvyadjust<br />
                test _Iage_1 _Iage_2 _Iage_3, nosvyadjust<br />
                test _Isex_1, nosvyadjust
            </p>

            <p><strong>GOAL 2&#8212;Estimating Changes Controlling for Other Factors. (<a href="#5">See section 5</a>.)</strong></p>

            <p>
                xi: svy, or subpop(selectedgroup): logit internetforcancer i.srvyyear i.age i.sex<br />
                drop selectedgroup
            </p>

            <p>
                * among those high school graduate<br />
                generate selectedgroup = (educ == 2) if !missing(educ)<br />
                xi: svy, subpop(selectedgroup): logit internetforcancer i.srvyyear i.age i.sex<br />
                test _Isrvyyear_2 _Iage_1 _Iage_2 _Iage_3 _Isex_1 _cons, nosvyadjust<br />
                test _Isrvyyear_2 _Iage_1 _Iage_2 _Iage_3 _Isex_1, nosvyadjust<br />
                test _Isrvyyear_2, nosvyadjust<br />
                test _Iage_1 _Iage_2 _Iage_3, nosvyadjust<br />
                test _Isex_1, nosvyadjust<br />
                xi: svy, or subpop(selectedgroup): logit internetforcancer i.srvyyear i.age i.sex<br />
                drop selectedgroup
            </p>

            <p>
                * among those some college<br />
                generate selectedgroup = (educ == 3) if !missing(educ)<br />
                xi: svy, subpop(selectedgroup): logit internetforcancer i.srvyyear i.age i.sex<br />
                test _Isrvyyear_2 _Iage_1 _Iage_2 _Iage_3 _Isex_1 _cons, nosvyadjust<br />
                test _Isrvyyear_2 _Iage_1 _Iage_2 _Iage_3 _Isex_1, nosvyadjust<br />
                test _Isrvyyear_2, nosvyadjust<br />
                test _Iage_1 _Iage_2 _Iage_3, nosvyadjust<br />
                test _Isex_1, nosvyadjust<br />
                xi: svy, or subpop(selectedgroup): logit internetforcancer i.srvyyear i.age i.sex<br />
                drop selectedgroup
            </p>

            <p>
                * among those college graduate<br />
                generate selectedgroup = (educ == 4) if !missing(educ)<br />
                xi: svy, subpop(selectedgroup): logit internetforcancer i.srvyyear i.age i.sex<br />
                test _Isrvyyear_2 _Iage_1 _Iage_2 _Iage_3 _Isex_1 _cons, nosvyadjust<br />
                test _Isrvyyear_2 _Iage_1 _Iage_2 _Iage_3 _Isex_1, nosvyadjust<br />
                test _Isrvyyear_2, nosvyadjust<br />
                test _Iage_1 _Iage_2 _Iage_3, nosvyadjust<br />
                test _Isex_1, nosvyadjust<br />
                xi: svy, or subpop(selectedgroup): logit internetforcancer i.srvyyear i.age i.sex<br />
                drop selectedgroup
            </p>

            <p><strong>GOAL 3&#8212;Estimating Averages by Combining 2003 and 2005 Data. (<a href="#6">See section 6</a>.)</strong></p>

            <p>
                *** Obtain weighted percentages using combined dataset. (<a href="#6_3">Table 6-3</a>)<br />
                * Estimate using the combined data by age group<br />
                svy: tabulate age internetforcancer, row se ci format(%8.5f) percent
            </p>

            <p>
                * Estimate using the combined data by education group<br />
                svy: tabulate educ internetforcancer, row se ci format(%8.5f) percent
            </p>

            <p>
                * Estimate using the combined data by sex group<br />
                svy: tabulate sex internetforcancer, row se ci format(%8.5f) percent
            </p>

            <p>
                * Estimate using the combined data by income group<br />
                svy: tabulate income internetforcancer, row se ci format(%8.5f) percent
            </p>

            <p>
                * Estimate using the combined data by race group<br />
                svy: tabulate race internetforcancer, row se ci format(%8.5f) percent
            </p>

            <p align="right"><a href="#">Back to top</a></p>

            <hr />

            <h3><a name="c"></a>APPENDIX C. COMPUTING DEGREES OF FREEDOM</h3>

            <p>
                For purposes of computing appropriate degrees of freedom for the estimator of HINTS 2003 and HINTS 2005 differences (and of combinations in general such as averages across years), we can assume as an approximation that both samples are simple random samples of size 50 (corresponding to the 50 replicates: each replicate provides a &#8216;pseudo sample unit&#8217;) from a normal distribution<sup>16</sup>. We have independent estimates
                <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>1</sub> and
                <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>2</sub> with means <em>&#952;</em><sub>1</sub> and <em>&#952;</em><sub>2</sub> and variances Var(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>1</sub>) and Var(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>2</sub> with means <em>&#952;</em><sub>1</sub>). The estimator of the difference &#916;=<em>&#952;</em><sub>2</sub>-<em>&#952;</em><sub>1</sub> is
                <img src="/_images/deltahat.jpg" alt="delta-hat" width="7" height="12" />
                =
                <img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>2</sub>-<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>1</sub>, with estimator of variance v(<img src="/_images/deltahat.jpg" alt="delta-hat" width="7" height="12" />) = v(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>1</sub>) +v (<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>2</sub>). v(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>1</sub>) and v(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>2</sub>) have n<sub>1</sub> - 1 and n<sub>2</sub> - 1 degrees of freedom respectively<sup>17</sup>, where n<sub>1</sub> and n<sub>2</sub> are the number of replicates for year 1 and year 2 respectively. The estimating equation referred to the t-distribution in this case is
                <img src="/_images/scientific_equations-8.jpg" alt="delta hat minus delta divided by the square root of the sum of the estimated variances of theta hat 1 and theta hat 2" width="100" height="19" />. The method for computing the degrees of freedom of the difference of normally-distributed simple random sample estimators with unequal variances from independent surveys is taken from Bickel and Doksum (1977). Section 6.4C recommends the Welch approximation, which computes as the degrees of freedom k for the estimating equation
                <img src="/_images/scientific_equations-8.jpg" alt="delta hat minus delta divided by the square root of the sum of the estimated variances of theta hat 1 and theta hat 2" width="100" height="19" /><br />
                <br />

                <img src="/_images/scientific_equations-9.jpg" alt="k equals the inverse of the summation of {c-squared divided by (n sub 1 minus 1)} and {1 minus c quantity squared divided by (n sub 2 minus 1)}" width="141" height="49" align="middle" />
                where
                <img src="/_images/scientific_equations-10.jpg" alt="c equals the estimated variance of theta hat 1 divided by {the estimated variance of theta hat 1 plus the estimated variance of theta hat 2}" width="111" height="58" align="middle" />.
            </p>

            <p>
                In our application n<sub>1</sub> and n<sub>2</sub> are both 50. If v(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13"><sub>1</sub>) and v(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13"><sub>2</sub>) are also both equal, then c = 1/2 and<br />
                <br />

                <img src="/_images/scientific_equations-11.jpg" alt="k equals the inverse of [the summation of {one-half squared divided by 49} and {one-half squared divided by 49}] which equals 98" width="187" height="52" />
            </p>

            <p>
                That is the maximum value of k. If v(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13"><sub>1</sub>) is much smaller, or much larger, than v(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13"><sub>2</sub>), then<br />
                <br />
                <img src="/_images/scientific_equations-12.jpg" alt="; k approximately equals the inverse of one squared divided by 49 which equals 49" width="118" height="64" />.
            </p>

            <p>49 is the minimum value of k. Thus 49 is the &#8216;conservative&#8217; approximation for the degrees of freedom: it gives the widest confidence intervals (using the t distribution on 49 degrees of freedom). If v(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>1</sub>) and v(<img src="/_images/thetahat-lg.jpg" alt="theta-hat" width="7" height="13" /><sub>2</sub>) are unequal and both in the same order of magnitude, then Welch's approximation value can be used to generate an appropriate k, which will be in the range [49,98].</p>

            <p class="small">
                <sup>16</sup>The pseudo-values may not necessarily have a normal distribution: it is good practice to check this assumption and make sure there is not kurtosis which may reduce the effective degrees of freedom.<br />
                <sup>17</sup>It actually may be smaller if for a particular statistic many of the replicates are effectively equal to the full-sample estimator. 49 is actually the maximum in general.
            </p>

            <p align="right"><a href="#">Back to top</a></p>

            <hr />

            <h3><a name="cir"></a>CANCER INFORMATION AND RESOURCES</h3>

            <p><strong>PATIENT-ORIENTED INFORMATION</strong></p>

            <p>
                <strong>NCI's Cancer Information Service (CIS)</strong><br />
                <a target="_blank" href="http://cis.nci.nih.gov/">http://cis.nci.nih.gov/</a> with links to NCI-published fact sheets and other resources<br />
                Phone: 1-800-4-CANCER (1-800-422-6237)<br />
                TDD: 1-800-332-8615
            </p>

            <p>
                <strong>Other NCI or DHHS Sources of Cancer Information</strong><br />
                National Cancer Institute: <a target="_blank" href="http://www.cancer.gov">www.cancer.gov</a><br />
                Office of Education and Special Initiatives (OESI): <a target="_blank" href="http://www.cancer.gov/aboutnci/oesi">www.cancer.gov/aboutnci/oesi</a><br />
                Office of Communications: <a target="_blank" href="http://www.cancer.gov/aboutnci/office-of-communications/page3">www.cancer.gov/aboutnci/office-of-communications/page3</a>
            </p>

            <p>
                <strong>American Cancer Society (ACS)</strong><br />
                <a target="_blank" href="http://www.cancer.org/docroot/home/index.asp">www.cancer.org/docroot/home/index.asp</a>
            </p>

            <p><strong>FEDERALLY-SPONSORED PROGRAM PLANNING RESOURCES</strong></p>

            <p>
                <strong>Cancer Control P.L.A.N.E.T.</strong><br />
                <a target="_blank" href="http://cancercontrolplanet.cancer.gov/">http://cancercontrolplanet.cancer.gov/</a>
            </p>

            <p>
                <strong>Research-tested Intervention Programs (RTIPs)</strong><br />
                <a target="_blank" href="http://rtips.cancer.gov/rtips/index.do">http://rtips.cancer.gov/rtips/index.do</a>
            </p>

            <p>
                <strong>Guide to Community Preventive Services</strong><br />
                <a target="_blank" href="http://www.thecommunityguide.org/">www.thecommunityguide.org/</a><a href="exit_disclaimer.aspx"><img src="/_images/Icon_External_Link.png" width="12" height="12" alt="Exit Disclaimer" border="0" /></a>
            </p>

            <p><strong>RESEARCH TOOLS AND RESOURCES</strong></p>

            <p>
                <strong>Behavioral Risk Factor Surveillance System (BRFSS)</strong><br />
                <a target="_blank" href="http://www.cdc.gov/brfss/">www.cdc.gov/brfss/</a>
            </p>

            <p>
                <strong>National Health Interview Survey (NHIS)</strong><br />
                <a target="_blank" href="http://www.cdc.gov/nchs/nhis.htm">www.cdc.gov/nchs/nhis.htm</a>
            </p>

            <p>
                <strong>Current Population Survey (CPS)</strong><br />
                <a target="_blank" href="https://www.census.gov/programs-surveys/cps.html">www.census.gov/cps/</a>
            </p>

            <p>
                <strong>Surveillance, Epidemiology, and End Results (SEER)</strong><br />
                <a target="_blank" href="http://seer.cancer.gov/">http://seer.cancer.gov/</a>
            </p>

            <p>
                <strong>Pew Internet and American Life Project</strong><br />
                <a target="_blank" href="http://www.pewinternet.org/data.asp">http://www.pewinternet.org/data.asp</a><a href="exit_disclaimer.aspx"><img src="/_images/Icon_External_Link.png" width="12" height="12" alt="Exit Disclaimer" border="0" /></a>
            </p>

            <p align="right"><a href="#">Back to top</a></p>

            <hr />

            <p>
                Health Information Natitonal Survey (HINTS)<br />
                <a target="_blank" href="https://hints.cancer.gov">hints.cancer.gov</a>
            </p>

            <p>
                U.S. Department of Health and Human Services (DHHS)<br />
                National Institutes of Health (NIH)<br />
                National Cancer Institute (NCI)
            </p>

            <p>
                NIH Publication No. 08-6435<br />
                Printed June 2008
            </p>
        </div>
    </div>
</asp:Content>


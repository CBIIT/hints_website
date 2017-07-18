<%@ Page Title="Frequently Asked Questions about HINTS" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="faq.aspx.vb" Inherits="faq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript" language="javascript"></script>

    <script type="text/javascript" src='_scripts/faq_accordian.js'></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Frequently Asked Questions about HINTS</h1>

    <h2>General questions</h2>

    <!-- Below General Questions ****************************************** -->
    <div class="accordion">
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-1">What is HINTS?</a>

            <div id="accordion-1" class="accordion-section-content">

                <p>The Health Information National Trends Survey (HINTS) is a biennial, cross-sectional survey of a nationally-representative sample of American adults that is used to assess the impact of the health information environment. Specifically, HINTS measures how people access and use health information; how people use information technology to manage health and health information; and the degree to which people are engaged in healthy behaviors. Finally, several items in HINTS have a specific focus on cancer prevention and control.</p>
                <p>Currently, six iterations of HINTS exist: HINTS 1 (2003), HINTS 2 (2005), HINTS 3 (2007), HINTS 4 Cycle 1 (2011), HINTS 4 Cycle 2 (2012), and HINTS 4 Cycle 3 (2013). As such, researchers can examine items and constructs that are common to all six iterations as a way to measure trends over time.</p>

            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-2">How can these data be used for planning in cancer control?</a>

            <div id="accordion-2" class="accordion-section-content">
                <p>HINTS data provide reliable estimates of the American public's engagement in behaviors related to health information and preventive health care with a specific emphasis on cancer. As such, HINTS data can be used to inform the design, content, and evaluation of cancer control initiatives by revealing where knowledge of and/or behavioral engagement in cancer control strategies are low; by highlighting the media used most often to obtain cancer control information; and by providing national-level trends in behavioral factors related to cancer control. Additionally, subgroup-specific analyses of HINTS data can be used to inform tailored cancer control planning efforts (e.g., by gender, race/ethnicity, socioeconomic status, cancer history).</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-3">How are the survey instruments created?</a>

            <div id="accordion-3" class="accordion-section-content">
                <p>Some items in HINTS are borrowed from existing national-level surveys (e.g., CDC's Behavioral Risk Factor Surveillance System); some come from smaller surveys related to health, and some are created by members of the HINTS program at the National Cancer Institute. In all cases, items are carefully tested through cognitive interviewing before the survey is fielded to ensure that they are psychometrically sound. The online codebook documents the source of every item in HINTS (see the Survey Notes field).</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-4">What are the response rates for the available HINTS data?</a>

            <div id="accordion-4" class="accordion-section-content">
                <p>HINTS 1 (2003) had a 33% response rate using the telephone mode. The HINTS 2 (2005) data was collected by the telephone mode and had a 21% response rate. Since HINTS 3 (2007) had two separate modes for collecting the data, there are separate response rates for the telephone mode (21%) and mail mode (31%). All cycles of HINTS 4 data were collected by the mail mode.  The following are the response rates for HINTS 4 iterations: HINTS 4 Cycle 1 (2011 [37%), HINTS 4 Cycle 2 (2012) [40%], HINTS 4 Cycle 3 (2013) [35%].</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-5">What geographic units of analysis are possible in HINTS?</a>

            <div id="accordion-5" class="accordion-section-content">
                <p>HINTS data provide nationally-representative estimates, but there are variables in the data set that allow researchers to compare rural vs. urban metropolitan statistical areas (MSAs) as well as census regions<strong> </strong>(four total)<strong> </strong>and census divisions (nine total). Though the data can only be assessed as a representation of the nation, as there are not enough data from each state to analyze them individually, there are certain cases where data can be pooled across multiple iterations of HINTS such that the sample size may increase enough to perform a state-based investigation that is statistically appropriate.  Other use cases may involve linking state-level data with HINTS data using a multi-level analysis.  Contact the HINTS program if you are interested in obtaining state-level information.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-6">Do I need permission to use the data?</a>

            <div id="accordion-6" class="accordion-section-content">
                <p>No. All data from every HINTS survey are available on the HINTS Web site for public use.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-7">Can I use these items in my own survey or research?</a>

            <div id="accordion-7" class="accordion-section-content">
                <p>Yes; however, in order to promote the growth of the HINTS community, we ask that you let us know about any HINTS-related published articles, measures that you derive from HINTS items, and associated presentations so they may be posted on the HINTS Web site. Full citation, and (if available) a PDF or PowerPoint should be sent to <a href="mailto:NCIHINTS@nih.gov">NCIHINTS@nih.gov</a>.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-8">How do I contact the program?</a>

            <div id="accordion-8" class="accordion-section-content">
                <p>For information about the HINTS program, please use our <a href="/contact_us.aspx">contact form</a> or email <a href="mailto:NCIhints@mail.nih.gov">NCIhints@mail.nih.gov</a>.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-9">What publications/presentations already exist?</a>

            <div id="accordion-9" class="accordion-section-content">
                <p>For a full list of HINTS-related publications and presentations, go to <a href="http://hints.cancer.gov/research.aspx">http://hints.cancer.gov/research.aspx</a>.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-10">What journals would you recommend for HINTS studies?</a>

            <div id="accordion-10" class="accordion-section-content">
                <p>A full list of peer-reviewed journals that have published HINTS studies can be found at <a href="http://hints.cancer.gov/journals.aspx">http://hints.cancer.gov/journals.aspx</a>.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-11">Where can I find information on sampling procedures?</a>

            <div id="accordion-11" class="accordion-section-content">
                <p>Each iteration of the survey has a final report that is available on the HINTS Web site. These final reports describe the sampling procedures in great detail. Briefly, there are two sampling methods used for the HINTS survey. The HINTS 1 (2003), HINTS 2 (2005), HINTS 3 (2007) iterations used a list-assisted random-digit-dial (RDD) sampling plan to collect data via a computer-assisted telephone interview. The HINTS 3 (2007) survey additionally used a comprehensive national listing of addresses available from the United States Postal Service to collect data via mailed questionnaire. All cycles of HINTS 4 collected data using an address frame and a mailed questionnaire.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-12">What are the limitations of the data?</a>

            <div id="accordion-12" class="accordion-section-content">
                <p>Because HINTS is a cross-sectional survey, it is not possible to infer causal relationships between constructs or items in the survey. Additionally, while researchers can examine trends over time at the national level for outcomes included in multiple iterations of the survey, one cannot assess change over time at the individual level.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-13">The response rate of HINTS 4 Cycle 3 (2013) is only 35%. What procedures were used to reach sampled individuals? Are the HINTS data nationally representative?</a>

            <div id="accordion-13" class="accordion-section-content">
                <p>The HINTS is a mail survey based on a stratified probability sample of the U.S. adult, civilian, non-institutionalized population.  The sample was drawn in two stages.  The first stage randomly selected addresses from the United States Postal Service file of residential addresses.  The second stage selected an adult within the selected household using the next birthday method.  To maximize the response rate and the representativeness of the sample, the survey included multiple non-response follow-ups, a pre-paid incentive at the first mailing and express delivery as one of the non-response follow-up mailings.  A Spanish version of the questionnaire was distributed to households that had a Hispanic surname.</p>
                <p>Survey weights were created to permit analysts to generalize the results to the national population.  The first step to create these weights was an adjustment to reflect the selection probabilities.  To compensate for non-response and coverage error, the selection weights were a calibrated using data from the American Community Survey.   HINTS non-response is correlated with being male, young, a minority, having less education and being Hispanic.  The calibration used age, gender, educational attainment, race, ethnicity and Census region to adjust for this pattern.  An analysis conducted on earlier rounds of HINTS found that non-response is also negatively correlated with access to health care and to health status.  Those who have had less access to health care services and who have had fewer health problems were less likely to respond to the survey.  To compensate for these patterns, insurance status and cancer status were used as additional calibration adjustments.  The data to make this adjustment were taken from the National Health Interview Survey.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-14">How is HINTS different from other surveys?</a>

            <div id="accordion-14" class="accordion-section-content">
                <p>HINTS is the only national surveillance vehicle exclusively devoted to monitoring the impact of and changes in cancer communication as well as key processes in health among American adults. Compared to other population-level surveys of health, HINTS is unique in its emphasis on cancer, health communication, and the health information environment (including use of health information technology).</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-15">What is the jackknife replicate weight type used in HINTS?</a>

            <div id="accordion-15" class="accordion-section-content">
                <p>The type of jackknife replication is JK1. The number of jackknife replicates is 50.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
    </div>
    <!-- Above General Questions ****************************************** -->

    <h2>Questions about mode</h2>

    <!-- Below Mode Questions ****************************************** -->
    <div class="accordion">
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-16">What is the "mode"?</a>

            <div id="accordion-16" class="accordion-section-content">
                <p>The mode is the medium used to communicate the survey questions.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-17">What modes have been used to collect HINTS data?</a>

            <div id="accordion-17" class="accordion-section-content">
                <p>HINTS 1 (2003 And HINTS 2 (2005) were administered by land-line telephone using a random-digit-dial (RDD) sample frame.</p>
                <p>HINTS 3 (2007) was administered in two different modes. One was by land-line telephone, with an interviewer reading the questions. The second was by mail. This involved sending a paper questionnaire to the respondent's home and asking the respondent to fill out the survey by him/herself.</p>
                <p>The telephone mode was administered by drawing a sample using a RDD sample frame. This involves randomly generating telephone numbers among those exchanges that are used for landline telephones. The sample for the mail survey was based on a list of all addresses to which the United States postal service delivers residential mail.</p>
                <p>All iterations of HINTS 4 were conducted using a self-administered mail questionnaire.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-18">Why was HINTS 3 (2007) collected using 2 modes?</a>

            <div id="accordion-18" class="accordion-section-content">
                <p>Prior HINTS surveys were conducted by drawing a sample using a random-digit-dial (RDD) procedure and administering the interview by telephone. However, over the last few years, the ability to complete RDD surveys has become increasingly difficult. Response rates to RDD surveys have been decreasing steadily because of the public's reluctance to participate. This reluctance affects both the quality and cost of conducting the survey. The quality is potentially affected because it lowers the overall response rate. The cost is affected because more calls have to be placed to complete the same number of interviews. In addition, RDD surveys have not traditionally included cell phones as part of the survey population. Because of the proliferation of using cell phones, the percentage of persons who do not have access to a landline telephone has been steadily growing. At the time HINTS 3 (2007) was conducted, this percentage was greater than 15% of all adults. Those who do not have access to a landline phone are different from those who do have access.</p>
                <p>HINTS 3 (2007) introduced an address sampling frame to conduct a mail survey to counteract the above problems with RDD. The address frame includes those that do not have a landline telephone. A pilot for HINTS 3 (2007) found the response rate for the address frame can achieve equivalent or better results than the telephone. Both an address (mail) and an RDD (telephone) survey were implemented in 2007 to allow HINTS to bridge between survey administrations. Since there is the possibility that certain estimates will be different by the mode of interview, it may be difficult to compare the mail results in 2007 to the telephone results in prior years. Including both an address and RDD frame allows doing trend analyses while keeping the mode constant. The RDD survey in 2007 allows users to look at trends for prior HINTS surveys while keeping the mode constant. Moving forward, HINTS has the option to continue with the telephone, if there are significant changes in this survey methodology. Alternatively, it will be possible to shift completely to an address frame to continue mail and/or a web survey in the future. Regardless of the mode used in the future, it will be possible to maintain the trends over time.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-20">What are mode effects?</a>

            <div id="accordion-20" class="accordion-section-content">
                <p>This refers to differences in results associated with the mode used to administer the survey. On HINTS 3 (2007), both a mail and a telephone survey was used to administer the survey. Research has shown that when asking certain types of questions, results will differ depending on the mode. For example, a mail survey is completed by the respondent without an interviewer. This methodology has been shown to yield more reports of socially sensitive information when compared to an interviewer administered survey. There may also be effects due to the differences in the channel of communication between the two modes. The mail survey is completed through a visual process with respondents reading and interpreting the questions. The telephone interview is completed through auditory cues, without any visual aid. For certain types of questions, this can lead to different results.</p>
                <p>There are also other survey properties associated with mode of interview that may affect the results. The telephone survey on HINTS included a Spanish interview, while the mail mode did not. The mail survey included individuals living in households without a landline telephone. The telephone survey did not. Both of these differences in the sample might lead to different estimates across the two different modes.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-21">How can I tell if I need to be concerned about mode effects?</a>

            <div id="accordion-21" class="accordion-section-content">
                <p>Compare the estimates from the address sample to the estimates from the RDD sample. To do this, use the address full-sample and RDD full-sample weights to produce the two estimates. A simple review of the data should provide an initial assessment if there are differences in the estimates and whether they are large enough to be concerned.</p>
                <p>After reviewing the above differences, you may want to conduct a formal test to see if the estimates are statistically different. Remember, that statistical significance is not particularly meaningful for a sample as large as the HINTS. Relatively small differences will be statistically different but not substantively meaningful.</p>
                <p>The method to conduct formal significance tests will depend on the type of analysis that is being conducted. For descriptive analyses, you can use procedures described in Rizzo, et al, (2008) pertaining to Goal 1 (e.g., Chapter 3). This involves generating separate estimates and standard errors for each sample frame and conducting a z test:</p>
                <p>(Xr – Xa)/sqrt[V(Xr) + V(Xa)]</p>
                <p>Where Xr is the estimate for the RDD sample; Xa is the estimate for the address sample; V(Xr) and V(Xa) are the variance estimates for the RDD and address sample, respectively.</p>
                <p>If you are conducting a multivariate analysis that is concerned with the relationship between two variables, then you should include a dichotomous variable, Si, in the regression that represents the type of sample. Si would be 0 if the i=RDD and a 1 if i=Address. An interaction term should also be included between address type and the variable of interest. For example, if one were looking at the relationship between age and whether someone looked for cancer information, the regression would include a term for age, sample type and an interaction between the two. A statistically significant interaction suggests that the relationship between age and looking for cancer is different by mode. One can then review the magnitude and implications this difference might have for the particular analysis being conducted.</p>
                <p>One source of a significant interaction is different responses because the mode of communication is different (self-administered mail survey vs interviewer administered telephone survey). Keep in mind, however, that there may be differences across mode for other reasons. For example, the address sample contains households that to not have landlines, while the telephone sample does not contain these households. Hence, it is possible that a significant interaction is due to different responses between households that have landlines and households that do not have landlines.</p>
                <p>To conduct the multivariate analysis, weights should be created using the procedures described in Rizzo et al (2008: Chapter 4, <a href="http://hints.cancer.gov/docs/HINTS_Data_Users_Handbook-2008.pdf" target="_blank">http://hints.cancer.gov/docs/HINTS_Data_Users_Handbook-2008.pdf</a>) where the two sets of replicate weights are combined into a single set of replicates. The procedure in Rizzo describes how to do this when conducting tests between two survey years. For testing for mode effects, use the same procedure except treat each sample type as if they were two different years. The weights created by applying the procedure in Rizzo to the two 2007 samples should only be used for testing for mode effects. They should not be used to calculate estimates of totals as their sum over the RDD sample plus the address sample is two times the number of adults in the United States in 2006. (The American Community Survey results for 2007 were not available at the time the weights for HINTS 2007 were calculated.) Also, the weights created by applying the procedure in Rizzo to the 2007 sample should also not be used to estimate quantities that involve sums across both of the 2007 samples because they do not maintain the correct relative relationships between the weights of RDD cases, the weights of address-sample cases with landlines, and the weights of address-sample cases without landlines.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-22">How do I address mode effects in my analyses?</a>

            <div id="accordion-22" class="accordion-section-content">
                <p>When conducting and reporting analyses of the HINTS, the different modes should be assessed and discussed as a strength of the design. By collecting data in different modes, you are able to assess the robustness of your results under different measurement processes. In some cases, one of these processes is superior for a particular mode. In this case, then you should choose that particular mode. However, if results differ and one cannot argue that one mode is better than the other, then you should report the results both ways.</p>
                <p>If there are no mode effects, then it would be appropriate to combine the two samples into a single analysis. Estimates should be generated using the composite weights. Unlike the weights created by the procedure described in Rizzo, the composite weights yield correct estimates of totals because their sum over the RDD sample plus the address sample is equal to the number of adults in the United States. Also the composite weights maintain the correct relative relationships between the weights of the RDD sample, the weights of address sample cases in households with landlines, and the weights of address sample cases without landlines. When writing up your results, you should report that analyses were run separately and results did not differ by mode. Again, this speaks to the robustness of the results.</p>
                <p>If there are significant mode effects, there are several possibilities. One is to assess which mode provides the most valid data. For example, if the result involves socially sensitive information (e.g., reports of serious psychological distress), then the mail mode should be selected. Similarly, the telephone mode is more likely to be subject to primary and recency effects (i.e., picking the first or last response on an ordinal scale). If this is the case, then one might choose to use the mail survey. If the result involves comparing to prior HINTS, then use the telephone sample because this keeps the mode consistent across years. Similarly, if the focus is on Hispanics, then use the telephone sample. The telephone interview included both English-speaking and Spanish-speaking respondents, while the mail survey was only administered in English. There are differences, therefore, between who answered the questionnaire among Hispanics.</p>
                <p>If you cannot decide which mode is &quot;better,&quot; report both analyses. An equivalent method would be to conduct analyses that controlled for mode (e.g., as a separate term and interaction term in a regression).</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-23">What should I do if some of the items in my analysis have mode effects and some do not?</a>

            <div id="accordion-23" class="accordion-section-content">
                <p>The main advantage of using the combined sample is increased statistical precision (larger sample size). If it is possible, report the results not affected by mode using the combined sample. For the results that are affected by mode, either use the &quot;preferred&quot; mode or report it for each mode (if there is no preferred mode). If the increased precision is not essential to the analysis, then consider reporting all of the results in either the preferred mode or for both modes (if there is no preferred mode).</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-24">If there are no mode effects for an item, can I always combine data collected by both modes?</a>

            <div id="accordion-24" class="accordion-section-content">
                <p>Yes. Use the combined weights for this analysis.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
    </div>
    <!-- Above Mode Questions ****************************************** -->

    <h2>Questions about trends</h2>
    <!-- Below trends Questions ****************************************** -->


    <div class="accordion">
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-25">If HINTS data are cross-sectional, how can I look at trends over time?</a>

            <div id="accordion-25" class="accordion-section-content">
                <p>HINTS is a series of repeated cross-sectional surveys. By comparing measures across the different survey years, one can examine net change over time. For example, using the HINTS data, it is possible to see if the proportion of adults in the United States who have looked for information about cancer has changed between 2005 and 2007. This is a standard methodology that is applied to virtually all social and economic surveys that examine change over time. For example, the unemployment rate reports net change from repeated surveys.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-26">How many ways can I examine trends over time?</a>

            <div id="accordion-26" class="accordion-section-content">
                <p>HINTS trend analyses provide the net change in the item of interest. For example, comparing the estimate &quot;proportion looking for cancer information&quot; between 2005 and 2007 measures whether the proportion of adults in 2005 looking for cancer was higher, lower, or the same as in 2007. HINTS cannot provide information on &quot;gross change.&quot; Gross change enumerates the status of individuals across both time periods. For example, a measure of gross change would be the number of people who changed their information-seeking behavior between years. In order to get this type of measure, one would have to interview the same people in both 2005 and 2007 to enumerate whether their status changed between the two time periods.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-27">If, in my analysis, I do not observe any changes over time for HINTS items, may I combine data across HINTS years to increase my sample size?</a>

            <div id="accordion-27" class="accordion-section-content">
                <p>Combining data across years will increase the statistical power by increasing the sample size. This might be especially useful if one wanted to focus on particular population groups that a single survey administration may not provide large sample sizes or if there are other groups of interest that a single year does not provide enough sample. Before combining data across years, one should first determine that the items of interest have not changed between years. To generate estimates and standard errors for combining data, it is necessary to create a new set of weights that permits the statistical program to compute the correct standard errors. The procedure to do this is provided in Rizzo et al (2008) Chapter 4 (combining data files)—see <a href="http://hints.cancer.gov/docs/HINTS_Data_Users_Handbook-2008.pdf" target="_blank">http://hints.cancer.gov/docs/HINTS_Data_Users_Handbook-2008.pdf</a>.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-28">Do I need to consider mode effects if I'm looking at trends across HINTS years?</a>

            <div id="accordion-28" class="accordion-section-content">
                <p>You do need to consider mode effects for trend analyses. If there is a mode effect, use the RDD sample. This keeps mode consistent across the different HINTS surveys.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-29">How can I tell if an item is appropriate to examine in trends analyses?</a>

            <div id="accordion-29" class="accordion-section-content">
                <p>You should examine the question wording, the response options, and the numerator (i.e., who was asked) for the item for each year. If these aspects have not changed (or could be made comparable), then it is appropriate for looking at trends.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-30">Do I need to consider differences in response rates or sample demographics when examining trends across HINTS years?</a>

            <div id="accordion-30" class="accordion-section-content">
                <p>The unweighted demographic distributions of the sample do change across years. The primary reasons for this are the decline in response rates and the deterioration of the random-digit-dial (RDD) sample frame. Between 2003 and 2005 the response rate dropped from 33% to 21%. Between 2005 and 2007 the response rate increased slightly (20% To 24% for the RDD sample). The drop between 2003 and 2005 is generally attributed to the growing problems with getting cooperation from the general public for RDD surveys. The proportion of those who do not have access to a landline telephone also went up during this time period. This group is disproportionately related to younger persons. This generally reduced the number of younger people in the sample over the later HINTS telephone administrations.</p>
                <p>The weights for each year will distribute the samples to reflect the demographic distribution of adults living in the United States for that particular year. Using the weighted estimates, therefore, would compensate for differential distributions across years.</p>
                <p>A more nuanced question is whether the weights compensate for all possible differential response bias. For example, suppose the research involved the item on seeking information about cancer. Further suppose that in 2005, young people who were not interviewed were less likely to seek information than those who were interviewed. However, in 2003, young people who were not interviewed were just as likely to look for information as those who were interviewed. In this case, the weighted estimates would not eliminate bias in estimates of change across the years.</p>
                <p>It is difficult to know if there is differential bias for any of the HINTS questionnaire items. Research has found that large differences in response rates are not a deterministic indicator of bias1. As noted above, for a bias to exist, there has to be a significant jump in who is not responding relative to the item that is being analyzed. For this reason, we believe that once using the weighted estimates, it is generally valid to compare across years. However, researchers should assess their own situation and decide based on the groups they are analyzing.</p>
                <p>The one exception to this general rule is in the case of Hispanics, where the HINTS 3 (2007) mail survey did not include a version in Spanish. The telephone survey included a Spanish version. Consequently, the samples are likely quite different between the two samples, regardless of the weighting adjustment and should not be combined in analyses that focus on this group.</p>
                <p>1. Groves, R. (2006) &quot;Nonresponse Rates and Nonresponse Bias in Household Surveys&quot; <em>Public Opinion Quarterly</em> 70: 646 - 675</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-31">Do I need to consider mode effects if I am looking at trends across HINTS years?</a>

            <div id="accordion-31" class="accordion-section-content">
                <p>Since HINTS 3 (2007) was administered through both mail and RDD surveys, you do need to consider mode effects for trend analyses if you are using this iteration. While the telephone method allowed HINTS&rsquo; users to trend with previous iterations that used the same method, the mail mode provided a baseline for trending data in future iterations. If there are no differences between RDD and mailed surveys for HINTS 3 (2007), use the combined sample and respective weights.  If there are significant differences between HINTS 3 (2007) modes, use the RDD sample and weights to trend with previous iterations and use the mail sample and weights for subsequent iterations. This keeps mode consistent across the different HINTS surveys.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-32">How do I examine trends across HINTS iterations that include HINTS 3 (2007)?</a>

            <div id="accordion-32" class="accordion-section-content">
                <p>If there are no significant differences between modes in HINTS 3 (2007), use the combined sample (both RDD and mail) and respective weights from this iteration to bridge with previous and subsequent iterations. See Figure 1 below.</p>
                <p>
                    Figure 1.
                </p>
                <p>
                    <img src="_images/faqs/faq1.png" alt="Figure 1" width="480" height="360" border="0" />
                </p>
                <p>
                    If there are significant differences between modes in HINTS 3 (2007), compare the data from HINTS 1(2003),[RDD] HINTS 2 (2005), [RDD], and HINTS 3 (2007) [RDD]. A separate comparison should be completed for HINTS 3 (2007) [Mail] and HINTS 4+ [Mail].  See Figure 2 below. For more information see:  <a href="http://hints.cancer.gov/docs/HINTS_IDA_Report.pdf">http://hints.cancer.gov/docs/HINTS_IDA_Report.pdf</a>
                </p>
                <p>
                    Figure 2.     
                </p>
                <p>
                    <img src="_images/faqs/faq2.png" alt="Figure 2" width="480" height="360" border="0" /><br />
                </p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
        <div class="accordion-section">
            <a class="accordion-section-title" href="#accordion-33">Where do I find information about how composite variables were created and other changes to the data? </a>

            <div id="accordion-33" class="accordion-section-content">
                <p>When you download the public dataset, there is a pdf in the zip file that contains history information.</p>
            </div>
            <!--end .accordion-section-content-->
        </div>
        <!--end .accordion-section-->
    </div>
    <!--end .accordion-->


    <!-- Above trends Questions ****************************************** -->
</asp:Content>


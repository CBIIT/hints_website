<%@ Page Title="Frequently Asked Questions | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="frequently-asked-questions.aspx.vb" Inherits="aboutfolder_frequently_asked_questions" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <meta name="Title" content="Frequently Asked Questions | HINTS" />
  <meta name="Description" content="Explore Frequently Asked Questions about the Health Information National Trends Survey." />


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" type="text/javascript" language="javascript"></script>

  <script type="text/javascript" src='/_scripts/faq_accordian_min.js'></script>

  <link rel="stylesheet" href="/css/faq.css">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">




  <div class="container col-lg-12 col-xl-7 col custom-wrapper">
    <section>
      <div class="row">
        <div class="col-md-12">







  <h1>Frequently Asked Questions about HINTS</h1>


  <h2>General questions</h2>
  <ul>
    <li><a href="#accordion-1">What is HINTS?</a></li>
    <li><a href="#accordion-2">How is HINTS different from other surveys?</a></li>
    <li><a href="#accordion-3">How many times has HINTS been fielded?</a></li>
    <li><a href="#accordion-4">Do I need permission to use the data?</a></li>
    <li><a href="#accordion-5">How are the survey instruments created?</a></li>
    <li><a href="#accordion-6">What are the response rates for HINTS?</a></li>
    <li><a href="#accordion-12">The response rate for some HINTS surveys is below 35%. Should I be concerned about the data?</a></li>
	<li><a href="#accordion-13">What procedures are in place to increase the response rate and improve data quality?</a></li>
    <li><a href="#accordion-7">What geographic units of analysis are available?</a></li>
    <li><a href="#accordion-8">Can I use HINTS items in my own survey or research?</a></li>
    <li><a href="#accordion-9">What journals would you recommend for HINTS studies?</a></li>
    <li><a href="#accordion-10">Where can I find information on sampling procedures?</a></li>
    <li><a href="#accordion-14">Can other groups conduct international or community versions of HINTS?</a></li>
    <li><a href="#accordion-15">How do I contact the program if I have additional questions?</a></li>
  </ul>

  <h2>Questions about mode</h2>
  <ul>
    <li><a href="#accordion-16">What modes have been used to collect HINTS data?</a></li>
    <li><a href="#accordion-17">What are mode effects?</a></li>
    <li><a href="#accordion-18">Do I need to consider mode effects if I'm looking at trends across HINTS administrations?</a></li>
    <li><a href="#accordion-21">How do I address mode effects in my analyses?</a></li>
    <li><a href="#accordion-22">What should I do if some of the items in my analysis have mode effects and some do not?</a></li>
    <li><a href="#accordion-23">If there are no mode effects for an item, can I combine data collected by both modes?</a></li>
  </ul>

  <h2>Questions about trends</h2>
  <ul>
    <li><a href="#accordion-24">How can I examine trends over time with cross-sectional data?</a></li>
    <li><a href="#accordion-25">How can I tell if an item is appropriate to examine in trend analyses?</a></li>
    <li><a href="#accordion-26">If the wording and denominator have not changed for a survey item, can I combine data across HINTS administrations to increase sample size?</a></li>
    <li><a href="#accordion-27">Do I need to consider mode effects if I'm looking at trends across HINTS administrations?</a></li>
  </ul>




  <h2>General questions</h2>

  <!-- Below General Questions ****************************************** -->
  <div class="accordion">
    <div class="accordion-section" id="accordion-1">
      <strong>What is HINTS?</strong>

      <div>

        <p>The National Cancer Institute sponsors the Health Information National Trends Survey (HINTS), which is a biennial, nationally-representative, cross-sectional survey of American adults that aims to assess information support needs in the population. HINTS examines how people access and use health and cancer information from multiple sources, how people use technology to manage health and health information, and how exposure to, use of, and perceptions about health information influence health behaviors.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
    <div class="accordion-section" id="accordion-2">
      <strong>How is HINTS different from other surveys?</strong>

      <div>
        <p>HINTS is the only national surveillance vehicle devoted to monitoring changes in the health communication environment and assessing the impact of communication on key processes affecting health. Compared to other population-level health surveys, HINTS is unique in its emphasis on cancer, health communication, and health information technology. Learn more about <a target=_blank href="/about-hints/hints-unique.aspx">what makes HINTS unique here</a>.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
    <div class="accordion-section" id="accordion-3">
      <strong>How many times has HINTS been fielded?</strong>

      <div>
        <p>There have been 17 iterations of HINTS to date:</p>
        <ul>
         <li>HINTS 1 (2003)</li>
         <li>HINTS 2 (2005)</li>
         <li>HINTS 3 (2008)</li>
         <li>HINTS Puerto Rico (2009)</li>
         <li>HINTS 4 Cycle 1 (2011)</li>
         <li>HINTS 4 Cycle 2 (2012)</li>
         <li>HINTS 4 Cycle 3 (2013)</li>
         <li>HINTS 4 Cycle 4 (2014)</li>
         <li>HINTS-FDA (2015)</li>
         <li>HINTS-FDA Cycle 2 (2017)</li>
         <li>HINTS 5 Cycle 1 (2017)</li>
         <li>HINTS 5 Cycle 2 (2018)</li>
         <li>HINTS 5 Cycle 3 (2019)</li>
         <li>HINTS 5 Cycle 4 (2020)</li>
         <li>HINTS-SEER (2021)</li>
         <li>HINTS 6 (2022)</li>
         <li>HINTS 7 (2024)</li>
        </ul>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
    <div class="accordion-section" id="accordion-4">
      <strong>Do I need permission to use the data?</strong>

      <div>
        <p>Most HINTS datasets are available for public use and can be downloaded from the HINTS website <a href="/data/download-data.aspx" target="_blank">data downloads page</a>. Certain HINTS datasets (including geocoded HINTS datasets, the HINTS-SEER dataset, and HINTS Data Linkage Project datasets) can be accessed by submitting a request through dbGap. For more information about submitting a data request please visit the <a href="/data/controlled-access-data.aspx" target="_blank">controlled-access data page</a>.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
    <div class="accordion-section" id="accordion-5">
      <strong>How are the survey instruments created?</strong>

      <div>
        <p>Some items in HINTS are borrowed from existing national surveys (e.g., CDC's Behavioral Risk Factor Surveillance System); some come from smaller health-related surveys, and some are developed by staff at the National Cancer Institute and experts in the field. In all cases, new items are carefully tested through cognitive interviewing before the surveys are fielded to ensure that the items are psychometrically sound. Please see the <a href="/about-hints/instrument-development.aspx" target="_blank">HINTS Instrument Development and Validation Procedures</a> page for more information.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
    <div class="accordion-section" id="accordion-6">
      <strong>What are the response rates for HINTS?</strong>

      <div>

        <table border="1" cellspacing="0" cellpadding="0" width="100%">
         <tr>
          <th width="17%">
           <strong>Administration (Year)</strong></th>
          <th width="19%"><p><strong>Data Collection Period</strong></p></th>
          <th width="18%"><p><strong>Mode</strong></p></th>
          <th width="45%"><p><strong>Sample size (N) and Response Rate  (RR)</strong></p></th>
         </tr>
         <tr>
          <td width="17%"><p>HINTS 1 (2003)</p></td>
          <td width="19%"><p>Oct 2002-Apr 2003</p></td>
          <td width="18%"><p>Random digit dial</p></td>
          <td width="45%"><p>N=6369, RR=33.1% </p></td>
         </tr>
         <tr>
          <td width="17%"><p>HINTS 2 (2005)</p></td>
          <td width="19%"><p>Feb 2005-Aug 2005</p></td>
          <td width="18%"><p>Random digit dial (+ online pilot)</p></td>
          <td width="45%"><p>N=5586, RR=20.8%</p></td>
         </tr>
         <tr>
          <td width="17%"><p>HINTS 3 (2008)</p></td>
          <td width="19%"><p>Jan 2008-Apr 2008</p></td>
          <td width="18%"><p>Postal and random digit dial</p></td>
          <td width="45%"><p>Mail: N=3582, RR=30.9%;  RDD: N=4092, RR=24.2%</p></td>
         </tr>
         <tr>
          <td width="17%"><p>HINTS Puerto Rico (2009)</p></td>
          <td width="19%"><p>Apr 2009-June 2009</p></td>
          <td width="18%"><p>Random digit dial</p></td>
          <td width="45%"><p>N=639, RR=74.3% </p></td>
         </tr>
         <tr>
          <td width="17%"><p>HINTS 4 Cycle 1 (2011)</p></td>
          <td width="19%"><p>Oct 2011-Feb 2012</p></td>
          <td width="18%"><p>Postal</p></td>
          <td width="45%"><p>N=3565, RR=29.8%</p></td>
         </tr>
         <tr>
          <td width="17%"><p>HINTS 4 Cycle 2 (2012)</p></td>
          <td width="19%"><p>Oct 2012-Jan 2013</p></td>
          <td width="18%"><p>Postal</p></td>
          <td width="45%"><p>N=3630, RR=39.9%</p></td>
         </tr>
         <tr>
          <td width="17%"><p>HINTS 4 Cycle 3 (2013)</p></td>
          <td width="19%"><p>Sept 2013-Nov 2013</p></td>
          <td width="18%"><p>Postal</p></td>
          <td width="45%"><p>N=3185, RR=35.2%</p></td>
         </tr>
         <tr>
          <td width="17%"><p>HINTS 4 Cycle 4 (2014)</p></td>
          <td width="19%"><p>Aug 2014-Nov 2014</p></td>
          <td width="18%"><p>Postal</p></td>
          <td width="45%"><p>N=3677, RR=34.4%</p></td>
         </tr>
         <tr>
          <td width="17%"><p>HINTS-FDA (2015)</p></td>
          <td width="19%"><p>May 2015-Sept 2015</p></td>
          <td width="18%"><p>Postal</p></td>
          <td width="45%"><p>N=3738, RR=33%</p></td>
         </tr>
         <tr>
          <td width="17%"><p>HINTS-FDA Cycle 2 (2017)</p></td>
          <td width="19%"><p>Jan 2017-May 2017</p></td>
          <td width="18%"><p>Postal</p></td>
          <td width="45%"><p>N=1736, RR=34.1%</p></td>
         </tr>
         <tr>
          <td width="17%"><p>HINTS 5 Cycle 1 (2017)</p></td>
          <td width="19%"><p>Jan 2017-May 2017</p></td>
          <td width="18%"><p>Postal</p></td>
          <td width="45%"><p>N=3285, RR=32.4%</p></td>
         </tr>
         <tr>
          <td width="17%"><p>HINTS 5 Cycle 2 (2018)</p></td>
          <td width="19%"><p>Jan 2018-May 2018</p></td>
          <td width="18%"><p>Postal</p></td>
          <td width="45%"><p>N=3527, RR=32.9%</p></td>
         </tr>
         <tr>
          <td width="17%"><p>HINTS 5 Cycle 3 (2019)</p></td>
          <td width="19%"><p>Jan-May 2019</p></td>
          <td width="18%"><p>Postal (+ web pilot)</p></td>
          <td width="45%"><p>Mail: N=4573 , RR=30.2%; Web: N=865 , RR=30.6%; Overall: N= 5438 , RR=30.3% </p></td>
         </tr>
         <tr>
          <td width="17%"><p>HINTS 5 Cycle 4 (2020)</p></td>
          <td width="19%"><p>Feb 2020-June 2020</p></td>
          <td width="18%"><p>Postal</p></td>
          <td width="45%"><p>N=3865, RR=36.7%</p></td>
         </tr>
         <tr>
          <td width="17%"><p>HINTS-SEER (2021)*</p></td>
          <td width="19%"><p>Jan 2021-Aug 2021</p></td>
          <td width="18%"><p>Postal</p></td>
          <td width="45%"><p>N=1234, RR 12.6%</p></td>
         </tr>
         <tr>
          <td width="17%"><p>HINTS 6 (2022)</p></td>
          <td width="19%"><p>Mar 2022-Nov 2022</p></td>
          <td width="18%"><p>Postal and push to web</p></td>
          <td width="45%"><p>N=6252, RR=28.1%</p></td>
         </tr>
         <tr>
          <td width="17%"><p>HINTS 7 (2024)</p></td>
          <td width="19%"><p>Mar 2024-Sept 2024</p></td>
          <td width="18%"><p>Postal and push to web</p></td>
          <td width="45%"><p>N=7278, RR=27.3%</p></td>
         </tr>
        </table>

        <p><em>*Note: The sample for HINTS-SEER (2021) was drawn from 3 SEER registries</em></p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->

    <div class="accordion-section" id="accordion-12">
      <strong>The response rate for some HINTS surveys is below 35%. Should I be concerned about the data?</strong>

      <div>
        <p>Similar to other Federal nationally representative survey data collection efforts, response rates for HINTS have been decreasing. One concern with low response rates is potential bias in the data, though there isn’t a clear relationship between response rates and non-response bias. Non-response bias analyses (including level-of-effort analysis) conducted on previous HINTS data found lower response rates among certain demographic groups and differences from benchmarks on some outcomes (e.g., compared to data from the National Health Interview Survey).  Demographic influences on non-response can be reduced by using the available final sample and replicate weights.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->

    <div class="accordion-section" id="accordion-13">
      <strong>What procedures are in place to increase the response rate and improve data quality?</strong>

      <div>
        <p>To maximize the response rate for HINTS, certain administrative procedures are put in place, including multiple follow-up mailings to non-responders, a pre-paid incentive at the first mailing, and express delivery as one of the non-response follow-up mailings. Further, HINTS has used embedded experiments in certain survey administrations to test strategies to increase response rates and improve data quality. These experiments have included adding a “push-to-web” option to allow sampled respondents to complete the survey online, and “promised incentives,” which provide respondents with an additional incentive after they have completed the survey. To increase data quality, prompts have been used for those using the web version when it appears the respondents are speeding or straight-lining, and another experiment asked respondents to commit to answering accurately and carefully. These experiments are described in more detail in the Methodology Reports for the relevant HINTS administrations, which can be found on the <a href="/data/survey-instruments.aspx" target="_blank">Survey Materials & Methods Reports</a> page.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->

    <div class="accordion-section" id="accordion-7">
      <strong>What geographic units of analysis are available?</strong>

      <div>
        <p>Weighted HINTS data provide nationally representative estimates, and there are variables in the datasets that allow researchers to compare rural vs. urban metropolitan statistical areas (MSAs), as well as census regions (four total) and census divisions (nine total). </p>
        <p>Controlled access HINTS datasets contain additional geographic information for each respondent, including state, county, and census tract (in more recent datasets). However, it is important to keep in mind that HINTS does not sample at these geographic levels. More information about controlled access datasets, including how to request access to these data, can be found on our <a href="/data/controlled-access-data.aspx" target="_blank">controlled-access data page</a>.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
    <div class="accordion-section" id="accordion-8">
      <strong>Can I use HINTS items in my own survey or research?</strong>

      <div>
        <p>Yes. We encourage researchers to standardize measures and to utilize HINTS items for their own independent primary data collection efforts. However, the full HINTS instruments should not be copied or duplicated for use in studies that are not led by NCI. Additionally, neither the HINTS name (in full or in acronym form) nor the HINTS logo should be used for projects unaffiliated with NCI.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
    <div class="accordion-section" id="accordion-9">
      <strong>What journals would you recommend for HINTS studies?</strong>

      <div>
        <p>A full list of peer-reviewed journals that have published HINTS studies can be found on our <a href="/publications-reports/hints-journals.aspx" target="_blank">Published Articles Using HINTS Data</a>.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
    <div class="accordion-section" id="accordion-10">
      <strong>Where can I find information on sampling procedures?</strong>

      <div>
        <p>Recent HINTS iterations have used stratified address-based sampling and random selection within the household. For additional information, please refer to the Methods Report for the survey you are interested in. Each iteration of the HINTS survey has an associated methods report (available on the <a href="/data/survey-instruments.aspx" target="_blank">Survey Materials & Methods Reports</a> page) that describes the sampling procedures used for that survey in more detail.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
 
    <div class="accordion-section" id="accordion-14">
      <strong>Can other groups conduct international or community versions of HINTS?</strong>

      <div>
        <p>Researchers interested in conducting a health communication survey similar to HINTS in their community or country are encouraged to use HINTS items from our publicly available <a href="/data/survey-instruments.aspx" target="_blank">survey instruments</a> for their data collection efforts. The NCI HINTS program supports any opportunity to standardize measures and promote data harmonization for health communication research. However, please do not duplicate any HINTS instruments in their entirety as part of your data collection efforts. Additionally, please refrain from using either the HINTS name (in full or acronym) or the HINTS logo for projects unaffiliated with NCI. The name “Health Information National Trends Survey”, the acronym “HINTS”, and the HINTS logo are registered trademarks with the United States Patent and Trademark Office.</p>
        <p>The NCI HINTS management team is also available to provide limited consultation on external data collection efforts related to health communication. If you are interested in discussing your data collection effort with the HINTS management team, please contact us directly at <a href="mailto:NCIhints@mail.nih.gov">NCIhints@mail.nih.gov</a>.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
    <div class="accordion-section" id="accordion-15">
      <strong>How do I contact the program if I have additional questions?</strong>

      <div>
        <p>If you have additional questions about the HINTS program, please use our <a href="/about-hints/contact-us.aspx" target="_blank">contact form</a> or email <a href="mailto:NCIhints@mail.nih.gov">NCIhints@mail.nih.gov</a>.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
  </div>
  <!-- Above General Questions ****************************************** -->

  <h2>Questions about mode</h2>

  <!-- Below Mode Questions ****************************************** -->
  <div class="accordion">
    <div class="accordion-section" id="accordion-16">
      <strong>What modes have been used to collect HINTS data?</strong>

      <div>
        <p>HINTS 1 (2003) and HINTS 2 (2005) were administered by landline telephone using a random-digit-dial (RDD) sampling frame.</p>
        <p>HINTS 3 (2008) was administered using two different modes: 1) by landline telephone, with an interviewer reading the questions, and 2) by mail with a self-administered paper questionnaire. The sample for the telephone mode was drawn using an RDD frame, which involves randomly generating telephone numbers among those exchanges that are used for landline telephones. The sample for the mail survey was based on a list of all addresses to which the United States postal service delivers residential mail.</p>
        <p>Both a mail and a telephone survey were implemented in HINTS 3 to allow HINTS to bridge between survey administrations. Since there is a possibility that certain estimates will be different depending on the survey mode, it may be difficult to compare the mail results in HINTS 3 to the telephone results in prior years. Including both an address and RDD sampling frame enables trend analyses while keeping the mode constant. Additional information regarding merging HINTS surveys with different modes is available here: <a target=_blank href="/docs/HINTS_IDA_Report.pdf">https://hints.cancer.gov/docs/HINTS_IDA_Report.pdf</a> </p>
        <p>All iterations of HINTS following HINTS 3 were conducted using a self-administered mail questionnaire and an address-based sampling frame. HINTS 5 Cycle 3 (2019) consisted of two samples: the usual mail survey and a push-to-web pilot, where respondents were offered the choice to respond either via paper or via web survey. Starting with HINTS 6, all iterations of HINTS included a push-to-web option to encourage online responses.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
    <div class="accordion-section" id="accordion-17">
      <strong>What are mode effects?</strong>

      <div>
        <p>Mode effects are differences in results associated with the mode used to administer the survey. HINTS has been conducted as a self-administered mailed paper survey, a telephone-based interview survey, and a web-based survey. Research has shown that when asking certain types of questions, results will differ depending on the mode. For example, self-administered surveys have been shown to yield more reports of socially sensitive information when compared to interviewer-administered surveys.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
    <div class="accordion-section" id="accordion-18">
      <strong>Do I need to consider mode effects if I'm looking at trends across HINTS administrations?</strong>

      <div>
        <p>Mode effects need to be considered when merging data within an iteration that used multiple modes (e.g., HINTS 3, which used both telephone and postal modes, or HINTS 5 Cycle 3, which used both self-administered paper and web surveys) and when conducting trend analyses using HINTS datasets that were collected using different modes (e.g. HINTS 1, which was collected by telephone, and HINTS 4 which was collected through self-administered mailed surveys). HINTS datasets typically contain a variable that specifies the mode used by the respondent and can be used by analysts to test for mode effects. If there is a significant mode effect, you may: 1) use only one mode (and the respective weights) in your analysis; or 2) control for mode in the analyses.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
    <div class="accordion-section" id="accordion-21">
      <strong>How do I address mode effects in my analyses?</strong>

      <div>
        <p>For HINTS iterations that use multiple modes, information and guidance on how to address mode effects can be found within the analytic recommendations documents found within the respective data package. Data packages can be downloaded on our <a href="/data/download-data.aspx" target="_blank">HINTS Data Download page</a>.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->


    <div class="accordion-section" id="accordion-22">
      <strong>What should I do if some of the items in my analysis have mode effects and some do not?</strong>

      <div>
        <p>The main advantage of using the combined sample is increased statistical precision due to a larger sample size. When possible, report the results using the combined sample. For results that show differences by mode, either use the "best" mode (i.e., the one that matches a known benchmark or makes most sense theoretically) or report results for each mode separately (if there is no best mode). If the increased precision is not essential to the analysis, consider reporting all the results in either the best mode only or separately by mode.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
    <div class="accordion-section" id="accordion-23">
      <strong>If there are no mode effects for an item, can I combine data collected by both modes?</strong>

      <div>
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
    <div class="accordion-section" id="accordion-24">
      <strong>How can I examine trends over time with cross-sectional data?</strong>

      <div>
        <p>HINTS data represent a series of independent cross-sectional samples drawn from the same population (i.e., non-institutionalized US adults 18 or older). By comparing the same measure across different survey years, it is possible to examine change over time. For example, using HINTS data, it is possible to see if the proportion of adults in the United States who have looked for information about cancer has changed from one administration to another. This is a standard methodology that is applied to virtually all social and economic surveys that examine change over time. For more information on conducting trend analyses (as well as example code), please see the Overview and Analytic Recommendation document included in the HINTS data download packages as well as reports that can be found <a href="/publications-reports/nci-reports.aspx">here</a>.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
    <div class="accordion-section" id="accordion-25">
      <strong>How can I tell if an item is appropriate to examine in trend analyses?</strong>

      <div>
        <p>You should examine the question wording, the response options, and the denominator (i.e., who was asked the question) for the item of interest for each survey. If these aspects have not changed substantially (or could be made comparable), then it is appropriate to trend on that item. All HINTS items can be found in our <a href="/view-questions/all-hints-questions.aspx" target="_blank">electronic codebook</a> and items that are highlighted in green have been evaluated by the HINTS team as comparable across iterations.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
    <div class="accordion-section" id="accordion-26">
      <strong>If the wording and denominator have not changed for a survey item, can I combine data across HINTS administrations to increase sample size?</strong>

      <div>
        <p>Combining data across years will increase statistical power by increasing the sample size. This might be especially useful if you want to focus on population groups that have small samples within a single survey administration. Before combining data across years, it is important to first determine that the wording for the items and response options have not changed between survey administrations, and the denominator is also consistent (i.e., there were no changes in skip patterns on the survey that would change which respondents answered the question).  All HINTS items can be found in our <a href="/view-questions/all-hints-questions.aspx" target="_blank">electronic codebook</a> and items that are highlighted in green have been evaluated by the HINTS team as comparable across iterations.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
    <div class="accordion-section" id="accordion-27">
      <strong>Do I need to consider mode effects if I'm looking at trends across HINTS administrations?</strong>

      <div>
        <p>Yes, you need to consider mode effects for trend analyses. If there is a mode effect, it is suggested that you use only one mode in your analysis to keep mode consistent across the different HINTS iterations.</p>
      </div>
      <!--end .accordion-section-content-->
    </div>
    <!--end .accordion-section-->
  </div>
  <!--end .accordion-->


  <!-- Above trends Questions ****************************************** -->
</div>
      </div>
    </section>
  </div>
</asp:Content>



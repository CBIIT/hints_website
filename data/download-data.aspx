﻿<%@ Page Title="Download Data | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="download-data.aspx.vb" Inherits="datafolder_download_data" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="Download Data | HINTS" />
    <meta name="Description" content="Download HINTS datasets in SAS, SPSS, or STATA format to conduct your own analyses. " />
    <link rel="stylesheet" href="/css/hpot.css">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">


                    <div runat="server" id="PNL_Terms" class="TermsShow">
                        <asp:Panel ID="PNL_terms_defaultbutton" runat="server" DefaultButton="btnSubmit_SinglePage">
                            <h1>How to Use HINTS Data</h1>
                            <p>Please review the following suggestions on how to use HINTS data and then click "Continue" at the bottom of the page to access HINTS public use data.</p>
                            <p>It is of utmost importance to ensure the confidentiality of survey participants. Every effort has been made to exclude identifying information on individual respondents from the computer files. Some demographic information such as sex, race, etc., has been included for research purposes.
                            </p>
                            <p>NCI hopes that users of the data will adhere to the strictest standards of ethical conduct for the analysis and reporting of nationally collected survey data. NCI suggests that all research results be presented/published in a manner that protects the integrity of the data and ensures the confidentiality of participants.</p>
                            <p>NCI recommends users consider the following provisions when using HINTS public-use data:</p>
                            <ol>
                                <li>Do not present/publish data in which an individual can be identified. Publication of small cell sizes should be avoided.</li>
                                <li>Do not attempt to link nor permit others to link the data with individually identified records in another database.</li>
                                <li>Do not attempt to learn the identity of any person whose data are contained in the supplied file(s).</li>
                                <li>If the identity of any person is discovered inadvertently, then the following should be done;
                                    <ol type="a">
                                        <li>no use will be made of this knowledge, </li>
                                        <li>the HINTS Program staff will be notified of the incident by emailing <a href="mailto:ncihints@mail.nih.gov">ncihints@mail.nih.gov</a>, </li>
                                        <li>no one else will be informed of the discovered identity</li>
                                    </ol>
                                </li>
                                <li>Analyses of large HINTS domains usually produce reliable estimates, but analyses of small domains may yield unreliable estimates, as indicated by their large variances. The analyst should pay particular attention to the standard error and coefficient of variation (relative standard error) for estimates of means, proportions, and totals, and the analyst should report these when writing up results. It is important that the analyst realizes that small sample sizes for particular analyses will tend to result in unstable estimates.</li>
                            </ol>
                            <p>Please provide your email address to sign up for updates from HINTS. Providing your email is not a requirement for data access, but we want to be sure you receive the latest information about future HINTS data releases.</p>
                            <p>
                                <asp:Label ID="Label1" runat="server" AssociatedControlID="txtemailTerms" Text="Please enter your email (Optional):"></asp:Label>
                                <asp:TextBox ID="txtemailTerms" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemailTerms"
                                    ValidationGroup="mainpage_GP" Display="Dynamic" ErrorMessage="&lt;br/&gt;Please enter a valid email address."
                                    ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </p>

                            <div class="rwbtrickery">
                                <p>
                                <asp:TextBox autocomplete="new-password" ID="rwbNotEmail" TabIndex="-1" Text="" runat="server" />
                                <label class="sr-only" for="rwbNotEmail">This is for bot prevention; leave this field blank</label>
                                    </p>
                            </div>

                            <p>
                                <asp:Button ID="btnSubmit_SinglePage" ValidationGroup="mainpage_GP" runat="server" Text="CONTINUE" />
                            </p>
                        </asp:Panel>
                    </div>
                    <div id="dv_data" runat="server" class="TermsHidden">

                        <h1 id="topTOC">HINTS Datasets</h1>

                        <div id="calloutBox">
                            <p>Visit the <a href="/data/data-remediation.aspx">HINTS Data Errors, Remediation, and Recommendations</a> page to access important information about HINTS data errors, remediation procedures, and resultant recommendations
                            </p>
                        </div>


                        <ul>
                            <li><a href="#H7">HINTS 7 (2024), updated May 2025</a></li>
                            <li><a href="#HDLP22">HINTS Data Linkage Project 2022 (HDLP 2022) (More Information Forthcoming)</a></li>
                            <li><a href="#H6">HINTS 6 (2022) dataset, updated February 2025</a></li>
                            <li><a href="#HDLP">HINTS Data Linkage Project 2020 (HDLP 2020) (More Information Forthcoming)</a></li>
                            <li><a href="#SEER2021">HINTS-SEER (2021) dataset (More Information Forthcoming)</a></li>
                            <li><a href="#H5C4">HINTS 5, Cycle 4 (2020) dataset, updated February 2025</a></li>
                            <li><a href="#H5C3">HINTS 5, Cycle 3 (2019) dataset, updated May 2024</a></li>
                            <li><a href="#H5C2">HINTS 5, Cycle 2 (2018) dataset, updated May 2024</a></li>
                            <li><a href="#H5C1">HINTS 5, Cycle 1 (2017) dataset, updated May 2024</a></li>
                            <li><a href="#FDA2">HINTS-FDA, Cycle 2 (2017) dataset, updated May 2018</a></li>
                            <li><a href="#FDA1">HINTS-FDA (2015) dataset, updated September 2017 (See history document for change details)</a></li>
                            <li><a href="#H4C4">HINTS 4, Cycle 4 (2014) dataset, updated June 2021 (See history document for change details)</a></li>
                            <li><a href="#H4C3">HINTS 4, Cycle 3 (2013) dataset, updated April 2021 (See history document for change details)</a></li>
                            <li><a href="#H4C2">HINTS 4, Cycle 2 (2012) dataset, updated October 2020 (See history document for change details)</a></li>
                            <li><a href="#H4C1">HINTS 4, Cycle 1 (2011) dataset, updated October 2020 (See history document for change details)</a></li>
                            <li><a href="#H_PR">HINTS Puerto Rico 2009</a></li>
                            <li><a href="#H2007">HINTS 2007 Dataset, updated February 2009</a></li>
                            <li><a href="#H2005">HINTS 2005 Dataset, updated May 2023</a></li>
                            <li><a href="#H2003">HINTS 2003 Dataset, updated May 2023</a></li>
                        </ul>

                        <hr />





                        <h2 id="H7"><strong>HINTS 7 (2024), updated May 2025</strong></h2>

                         <p>
                            Total respondents: 7,278<br>
                            Complete responses: 7,208<br>
                            Partial responses**: 70
                         </p>
                         <p>**Note: A questionnaire was considered to be complete if at least 80% of Sections A and B were answered. A questionnaire was considered to be partially complete if 50% to 79% of the questions were answered in Sections A and B. Only questions required of every respondent were factored into the completion rate calculation.</p>
                        <p>HINTS 7 data is coming soon</p>
                         <ul>
                            <li><a href="/dataset/HINTS7_SAS_20250505.zip">SAS data and supporting documents</a> (ZIP, 19.4MB)</li>
                            <li><a href="/dataset/HINTS7_STATA_20250505.zip">STATA data and supporting documents</a> (ZIP, 19.1MB)</li>
                            <li><a href="/dataset/HINTS7_SPSS_20250505.zip">SPSS data and supporting documents</a> (ZIP, 18.4MB)</li>
                            <li><a href="/dataset/HINTS7_R_20250505.zip">R data and supporting documents</a> (ZIP, 17.6MB)</li>
                        </ul>

                        <p><a href="#topTOC">Return to Top</a></p>








                        <h2 id="HDLP22"><strong>HINTS Data Linkage Project 2022 (HDLP 2022) (More Information Forthcoming)</strong></h2>
                        <p>The HINTS Data Linkage Project 2022 (HDLP 2022) contains HINTS 6 (2022; n = 6,252) data merged with numerous external variables to support analyzing linked data to enhance the types of analyses and corresponding research questions that can be answered with HINTS data. The linking was done at both the census tract and county level using geo-coded, HINTS data. External variables were chosen from trusted and reliable sources with the main source of the variables being the US Census, but also includes the Agency for Healthcare Research and Quality (AHRQ) and the US Department of Agriculture (USDA) and The Centers for Disease Control and Prevention (CDC). The external variables that were included fall into five categories: 1) Social and economic factors ; 2) Demographics (e.g., Percent of population 65 or older); 3) Information technology (e.g., Percent of households with broadband internet); 4) Built environment (e.g., Fitness centers and recreational sports centers per 100,000 people); and 5) Physical environment (e.g., Percentage of days with good air quality).</p>
                        <p>The HINTS Data Linkage Project 2022 (HDLP 2022) External Variables codebook, a list of all external variables and links to many of the original data sources, is available for download on the <a href="/data/survey-instruments.aspx">Survey Instruments page</a>. Information about accessing the data is forthcoming. </p>

                        <p><a href="#topTOC">Return to Top</a></p>









                        <h2 id="H6"><strong>HINTS 6 (2022) dataset, updated February 2025</strong></h2>
                   
                           <p>
                            Total respondents: 6,252<br>
                            Complete responses: 6,185<br>
                            Partial responses**: 67
                        </p>
                         <p>**Note: A questionnaire was considered to be complete if at least 80% of Sections A and B were answered. A questionnaire was considered to be partially complete if 50% to 79% of the questions were answered in Sections A and B. Only questions required of every respondent were factored into the completion rate calculation.</p>
                                                <ul>
                            <li><a href="/dataset/HINTS6_SAS_20250225.zip">SAS data and supporting documents</a> (ZIP, 18.3 MB)</li>
                            <li><a href="/dataset/HINTS6_STATA_20250225.zip">STATA data and supporting documents</a> (ZIP, 18.4 MB)</li>
                            <li><a href="/dataset/HINTS6_SPSS_20250225.zip">SPSS data and supporting documents</a> (ZIP, 18.0 MB)</li>
                            <li><a href="/dataset/HINTS6_R_20250225.zip">R data and supporting documents</a> (ZIP, 16.7 MB)</li>
                        </ul>

                        <p><a href="#topTOC">Return to Top</a></p>




                        <h2 id="HDLP"><strong>HINTS Data Linkage Project 2020 (HDLP 2020) (More Information Forthcoming) </strong></h2>
                        <p>The HINTS Data Linkage Project 2020 (HDLP 2020) contains geo-coded, HINTS 5 Cycle 4 data (2020; n = 3,865) linked—at the county level-- with over 70 external variables chosen from trusted and reliable sources including the US Census, the Agency for Healthcare Research and Quality (AHRQ) and the US Department of Agriculture (USDA). The external variables fall into five categories: 1) Social and economic factors ; 2) Demographics (e.g., Percent of population 65 or older); 3) Information technology (e.g., Percent of households with broadband internet); 4) Built environment (e.g., Fitness centers and recreational sports per 100,000 people); and 5) Physical environment (e.g., Percentage of days with good air quality). See the HDLP external variables codebook for a list of all variables. Information about accessing the data is forthcoming. </p>

                        <p><a href="#topTOC">Return to Top</a></p>









                        <h2 id="SEER2021"><strong>HINTS-SEER (2021) dataset (More Information Forthcoming)</strong></h2>
                        <p>
                            Total respondents: 1,234<br>
                            Complete responses: 1,189<br>
                            Partial responses**: 45
                        </p>
                        <p>In 2021, NCI undertook a pilot project to oversample cancer survivors for HINTS using three cancer registries from the Surveillance, Epidemiology, and End Results (SEER) Program (https://seer.cancer.gov) as a sampling frame of cancer survivors. The pilot project, called HINTS-SEER, was designed to provide a larger sample of cancer survivors for HINTS analyses. The instrument closely resembles survey items and topics found on HINTS 5, Cycle 4 (2020), and includes other topics relevant to cancer survivors. A unique aspect of the HINTS-SEER dataset is that key data elements from the cancer registry datasets are linked to the HINTS survey responses, providing a more in-depth view of each respondent's cancer diagnosis.</p>
                        <p>HINTS-SEER data were collected from January 11, 2021 through August 20, 2021. Once the SEER registries obtained consent to share individual mailing addresses, the mailing protocol for all three HINTS-SEER cohorts (Iowa Cancer Registry, Greater Bay Area Cancer Registry, and New Mexico Tumor Registry) followed a modified Dillman approach (Dillman, et al., 2009) with a total of four mailings: an initial mailing, a reminder postcard, and two follow-up mailings. Individuals in each sample received the first mailing and reminder postcard, while only non-respondents received the subsequent survey mailings. Complete data were collected from 1,234 respondents. To learn more about HINTS-SEER, please consult the <a href="/docs/methodologyreports/HINTS_SEER_MethodologyReport.pdf" target="_blank">methodology report</a>, <a href="/docs/Instruments/HINTS-SEER-AnnotatedInstrument.pdf" target="_blank">survey instrument</a>, and <a href="/docs/Instruments/HINTS-SEER-CA-AnnotatedInstrument.pdf" target="_blank">CA survey instrument</a>.Information about accessing the data is forthcoming.</p>
                        <p>**Note: A questionnaire was considered to be complete if at least 80% of Sections A and B were answered. A questionnaire was considered to be partially complete if 50% to 79% of the questions in Sections A and B were answered. Only questions required of every respondent were factored into the completion rate calculation.</p>

                        <p><a href="#topTOC">Return to Top</a></p>
















                        <h2 id="H5C4"><strong>HINTS 5, Cycle 4 (2020) dataset, updated February 2025</strong></h2>
                        <p>
                            Total respondents: 3,865<br />
                            Complete responses: 3,792<br />
                            Partial responses**: 73

                        </p>
                        <p>**Note: A questionnaire was considered to be complete if at least 80% of Sections A and B were answered. A questionnaire was considered to be partially complete if 50% to 79% of the questions were answered in Sections A and B. Only questions required of every respondent were factored into the completion rate calculation.</p>
                        <ul>
                            <li><a href="/dataset/HINTS5_Cycle4_SAS_20250225.zip">SAS data and supporting documents</a> (ZIP, 12.7 MB)</li>
                            <li><a href="/dataset/HINTS5_Cycle4_STATA_20250225.zip">STATA data and supporting documents</a> (ZIP, 12.7 MB)</li>
                            <li><a href="/dataset/HINTS5_Cycle4_SPSS_20250225.zip">SPSS data and supporting documents</a> (ZIP, 12.8 MB)</li>
                        </ul>
                        <p><a href="#topTOC">Return to Top</a></p>






                        <h2 id="H5C3"><strong>HINTS 5, Cycle 3 (2019) dataset, updated May 2024</strong></h2>
                        <p>
                            Total respondents: 5,438<br />
                            Complete responses: 5,247<br />
                            Partial responses**: 191

                        </p>
                        <p>**Note: A questionnaire was considered to be complete if at least 80% of Sections A and B were answered. A questionnaire was considered to be partially complete if 50% to 79% of the questions were answered in Sections A and B. Only questions required of every respondent were factored in to the completion rate calculation.</p>
                        <ul>
                            <li><a href="/dataset/HINTS5_Cycle3_SAS_20240507.zip">SAS data and supporting documents</a> (ZIP, 20.4 MB)</li>
                            <li><a href="/dataset/HINTS5_Cycle3_STATA_20240507.zip">STATA data and supporting documents</a> (ZIP, 20.2 MB)</li>
                            <li><a href="/dataset/HINTS5_Cycle3_SPSS_20240507.zip">SPSS data and supporting documents</a> (ZIP, 19.9 MB)</li>
                        </ul>
                        <p><a href="#topTOC">Return to Top</a></p>





                        <h2 id="H5C2"><strong>HINTS 5, Cycle 2 (2018) dataset, updated May 2024</strong></h2>
                        <p>
                            Total respondents: 3,504<br />
                            Complete responses: 3,434<br />
                            Partial responses**: 70

                        </p>
                        <p>**Note: A questionnaire was considered to be complete if at least 80% of Sections A and B were answered. A questionnaire was considered to be partially complete if 50% to 79% of the questions were answered in Sections A and B.</p>
                        <ul>
                            <li><a href="/dataset/HINTS-5_Cycle2_SAS_20240507.zip">SAS data and supporting documents</a> (ZIP, 13.1 MB)</li>
                            <li><a href="/dataset/HINTS-5_Cycle2_STATA_20240507.zip">STATA data and supporting documents</a> (ZIP, 13.1 MB)</li>
                            <li><a href="/dataset/HINTS-5_Cycle2_SPSS_20240507.zip">SPSS data and supporting documents</a> (ZIP, 12.6 MB)</li>
                        </ul>
                        <p><a href="#topTOC">Return to Top</a></p>

                        <h2 id="H5C1"><strong>HINTS 5, Cycle 1 (2017) dataset, updated May 2024</strong></h2>
                        <p>
                            Total respondents: 3,285<br />
                            Complete responses: 3,191<br />
                            Partial responses**: 94
                        </p>
                        <p>**Note: A questionnaire was considered to be complete if at least 80% of Sections A and B were answered. A questionnaire was considered to be partially complete if 50% to 79% of the questions were answered in Sections A and B.</p>
                        <ul>
                            <li><a href="/dataset/HINTS-5_Cycle1_SAS_20240424.zip">SAS data and supporting documents</a> (ZIP, 11.9 MB)</li>
                            <li><a href="/dataset/HINTS-5_Cycle1_STATA_20240424.zip">STATA data and supporting documents</a> (ZIP, 11.9 MB)</li>
                            <li><a href="/dataset/HINTS-5_Cycle1_SPSS_20240424.zip">SPSS data and supporting documents</a> (ZIP, 11.5 MB)</li>
                        </ul>
                        <p><a href="#topTOC">Return to Top</a></p>




                        <h2 id="FDA2"><strong>HINTS-FDA, Cycle 2 (2017) dataset, updated May 2018</strong></h2>
                        <p>
                            Total respondents: 1,736<br />
                            Complete responses: 1,676<br />
                            Partial responses**: 60
                        </p>
                        <p>**Note: A questionnaire was considered to be complete if at least 80% of Sections A and B were answered. A questionnaire was considered to be partially complete if 50% to 79% of the questions were answered in Sections A and B.</p>
                        <ul>
                            <li><a href="/dataset/HINTS-FDA_Cycle2__SAS.zip">SAS data and supporting documents</a> (ZIP, 8.9 MB)</li>
                            <li><a href="/dataset/HINTS-FDA_Cycle2_STATA.zip">STATA data and supporting documents</a> (ZIP, 8.7 MB)</li>
                            <li><a href="/dataset/HINTS-FDA_Cycle2_SPSS.zip">SPSS data and supporting documents</a> (ZIP, 8.5 MB)</li>
                        </ul>
                        <p><a href="#topTOC">Return to Top</a></p>








                        <h2 id="FDA1"><strong>HINTS-FDA (2015) dataset, updated September 2017 (See history document for change details)</strong></h2>
                        <p>
                            Total respondents: 3,738<br />
                            Complete responses: 3,595<br />
                            Partial responses**: 143
                        </p>
                        <p>**Note: A questionnaire was considered to be complete if at least 80% of Sections A and B were answered. A questionnaire was considered to be partially complete if 50% to 79% of the questions were answered in Sections A and B.</p>
                        <ul>
                            <li><a href="/dataset/HINTS_FDA_SAS.zip">SAS data and supporting documents</a> (ZIP, 7.2 MB)</li>
                            <li><a href="/dataset/HINTS_FDA_STATA.zip">STATA data and supporting documents</a> (ZIP, 7.1 MB)</li>
                            <li><a href="/dataset/HINTS_FDA_SPSS.zip">SPSS data and supporting documents</a> (ZIP, 6.6 MB)</li>
                        </ul>


                        <p>
                            HINTS data are available for public use. Learn about mode, trends and more in the
        <a href="/about-hints/frequently-asked-questions.aspx">HINTS FAQ</a>.
                        </p>
                        <p><a href="#topTOC">Return to Top</a></p>




                        <h2 id="H4C4">
                            <strong>HINTS 4, Cycle 4 (2014) dataset, updated June 2021 (See history document for change details)</strong>
                        </h2>
                        <p>
                            Total respondents: 3,677<br />
                            Complete responses: 3,529<br />
                            Partial responses**: 148
                        </p>
                        <p>
                            **Note: A questionnaire was considered to be complete 
        if at least 80% of Sections A and B were answered. A 
        questionnaire was considered to be partially complete 
        if 50% to 79% of the questions were answered in Sections
         A and B.
                        </p>
                        <ul>
                            <li><a href="/dataset/HINTS4_Cycle4_SAS.zip">SAS data and supporting documents</a>
                                (ZIP, 8.6 MB)</li>
                            <li><a href="/dataset/HINTS4_Cycle4_Stata.zip">STATA data and supporting documents</a>
                                (ZIP, 8.5 MB)</li>
                            <li><a href="/dataset/HINTS4_Cycle4_SPSS.zip">SPSS data and supporting documents</a>
                                (ZIP, 8.4 MB)</li>
                        </ul>
                        <p><a href="#topTOC">Return to Top</a></p>






                        <h2 id="H4C3">
                            <strong>HINTS 4, Cycle 3 (2013) dataset, updated April 2021 (See history document for change details)</strong>
                        </h2>
                        <p>
                            Total respondents: 3,185<br />
                            Complete responses: 3,124<br />
                            Partial responses**: 61<br />
                            <br />
                            **Note: A questionnaire was considered to be complete if at least 80% of Sections
        A and B were answered. A questionnaire was considered to be partially complete if
        50% to 79% of the questions were answered in Sections A and B.
                        </p>
                        <ul>
                            <li><a href="/dataset/HINTS4_Cycle3_SAS.zip">SAS data and supporting documents</a>
                                (ZIP, 8.0 MB)</li>
                            <li><a href="/dataset/HINTS4_Cycle3_Stata.zip">STATA data and supporting documents</a>
                                (ZIP, 7.8 MB)</li>
                            <li><a href="/dataset/HINTS4_Cycle3_SPSS.zip">SPSS data and supporting
            documents</a> (ZIP, 7.6 MB)</li>
                        </ul>
                        <p><a href="#topTOC">Return to Top</a></p>




                        <h2 id="H4C2">
                            <strong>HINTS 4, Cycle 2 (2012) dataset, updated October 2020 (See history document for change details)</strong>
                        </h2>
                        <p>
                            Total respondents: 3,630<br />
                            Complete responses: 3,582<br />
                            Partial responses**: 48<br />
                            <br />
                            **Note: A questionnaire was considered to be complete if at least 80% of Sections
        A and B were answered. A questionnaire was considered to be partially complete if
        50% to 79% of the questions were answered in Sections A and B.
                        </p>
                        <ul>
                            <li><a href="/dataset/HINTS4_Cycle2_SAS.zip">SAS data and supporting documents</a> (ZIP,
            6.5 MB)</li>
                            <li><a href="/dataset/HINTS4_Cycle2_Stata.zip">STATA data and supporting documents</a>
                                (ZIP, 6.3 MB)</li>
                            <li><a href="/dataset/HINTS4_Cycle2_SPSS.zip">SPSS data and supporting
            documents</a> (ZIP, 6.3 MB)</li>
                        </ul>
                        <p><a href="#topTOC">Return to Top</a></p>



                        <h2 id="H4C1">
                            <strong>HINTS 4, Cycle 1 (2011) dataset, updated October 2020 (See history document for change details)</strong>
                        </h2>
                        <p>
                            Total respondents: 3,959<br />
                            Complete responses: 3,907<br />
                            Partial responses**: 52<br />
                            <br />
                            **Note: A questionnaire was considered to be complete if at least 80% of Sections
        A and B were answered. A questionnaire was considered to be partially complete if
        50% to 79% of the questions were answered in Sections A and B.
                        </p>
                        <ul>
                            <li><a href="/dataset/HINTS4_Cycle1_SAS.zip">SAS data and supporting documents</a> (ZIP,
            7.2 MB)</li>
                            <li><a href="/dataset/HINTS4_Cycle1_Stata.zip">STATA data and supporting documents</a> (ZIP,
            7.0 MB)</li>
                            <li><a href="/dataset/HINTS4_Cycle1_SPSS.zip">SPSS data and supporting
            documents</a> (ZIP, 7.1 MB)</li>
                        </ul>
                        <p><a href="#topTOC">Return to Top</a></p>


                        <h2 id="H_PR">
                            <strong>HINTS Puerto Rico 2009  </strong>
                        </h2>
                        <p>
                            The University of Puerto Rico Comprehensive Cancer Center, the Puerto Rico Behavioral
        Risk Factors Surveillance System, and the U.S. National Cancer Institute, implemented
        HINTS in Puerto Rico in 2009. A total of 639 (603 complete and 36 partially complete)
        interviews were conducted. Documentation is available to assist with analyzing the
        HINTS Puerto Rico data, including instructions on how to combine the dataset with
        HINTS 2007 for comparisons.
                        </p>
                        <ul>
                            <li><a href="/dataset/HINTS_PR_2007-SAS.zip">SAS data and supporting documents</a> (ZIP,
            1.5 MB)</li>
                            <li><a href="/dataset/HINTS_PR_2007-STATA.zip">STATA data and supporting documents</a>
                                (ZIP, 1.12 MB)</li>
                            <li><a href="/dataset/HINTS_PR_2007-SPSS.zip">SPSS data and supporting
            documents</a> (ZIP, 1.01 MB)</li>
                        </ul>
                        <p><a href="#topTOC">Return to Top</a></p>



                        <h2 id="H2007">
                            <strong>HINTS 2007 Dataset, updated February 2009  </strong>
                        </h2>
                        <p>
                            CATI (Phone) completes: 3,767<br />
                            CATI (Phone) partial completes: 325<br />
                            Total CATI (Phone): 4,092<br />
                            Partial completes were defined as cases where the respondent completed the first
        section (Health Communications) of the interview, but did not reach the end of the
        survey instrument.
                        </p>
                        <p>
                            Mail completes: 3,473<br />
                            Mail partial completes: 109<br />
                            Total Mail: 3,582<br />
                            A questionnaire was considered to be complete if at least 80% of sections A, B,
        and C were filled in. To be considered partially complete, a questionnaire had to
        have between 50% and 79% of these sections filled.
                        </p>
                        <ul>
                            <li><a href="/dataset/HINTS_2007_Data_and_Documents-SAS_2-12-09.zip">SAS data and supporting
            documents</a> (ZIP, 9.51 MB)</li>
                            <li><a href="/dataset/HINTS_2007_Data_and_Documents-STATA_2-12-09.zip">STATA data and
            supporting documents</a> (ZIP, 8.67 MB)</li>
                            <li><a href="/dataset/HINTS_2007_Data_and_Documents-SPSS_2-12-09.zip">SPSS data and supporting documents</a> (ZIP, 8.65 MB)</li>
                        </ul>
                        <p><a href="#topTOC">Return to Top</a></p>



                        <h2 id="H2005">
                            <strong>HINTS 2005 Dataset, updated May 2023</strong>
                        </h2>
                        <p>
                            The full dataset (n=5586) includes respondents who completed the entire interview
        (Completes: n=5394) plus those who completed the Health Communication and General
        Cancer Questions only (Partial Completes: n=192).
                        </p>
                        <ul>
                            <li><a href="/dataset/HINTS-2005-SAS-Public-Internet6-02-06.ZIP">SAS data and supporting documents</a> (ZIP, 4.71 MB)</li>
                            <li><a href="/dataset/HINTS-2005-SPSS-Public-Internet6-02-06.ZIP">SPSS data and supporting documents</a> (ZIP, 4.56 MB)</li>
                            <li><a href="/dataset/HINTS_2005_Stata_Public_Internet.ZIP">STATA data and supporting documents</a> (ZIP, 5.86 MB)</li>
                        </ul>
                        <p><a href="#topTOC">Return to Top</a></p>




                        <h2 id="H2003">
                            <strong>HINTS 2003 Dataset, updated May 2023 </strong>
                        </h2>
                        <p>
                            The full dataset (n=6369) includes respondents who completed the entire interview
        (Completes: n=6149) plus those who completed the Health Communication and General
        Cancer Questions only (Partial Completes: n=220).
                        </p>
                        <ul>
                            <li><a href="/dataset/HINTS-2003-SAS-Internet-Public_6-2-06.ZIP">SAS data and supporting documents</a> (ZIP, 5.41 MB)</li>
                            <li><a href="/dataset/HINTS-2003-SPSS-Public-Internet_6-2-06.ZIP">SPSS data and supporting documents</a> (ZIP, 5.28 MB)</li>
                            <li><a href="/dataset/HINTS_2003_Stata_Internet_Public.ZIP">STATA data and supporting documents</a> (ZIP, 6.62 MB)</li>
                        </ul>
                        <p>
                            You may also download the Codebook for interpreting data values along with unweighted
        and weighted frequencies.
                        </p>
                        <p>
                            For additional information about using HINTS data, please use our <a href="/about-hints/contact-us.aspx">contact form</a> or email <a href="mailto:NCIhints@mail.nih.gov">NCIhints@mail.nih.gov</a>.
                        </p>
                        <p><a href="#topTOC">Return to Top</a></p>
                    </div>

                </div>
            </div>
        </section>
    </div>
</asp:Content>


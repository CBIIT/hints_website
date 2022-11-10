<%@ Page Title="Download Data | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="download-data.aspx.vb" Inherits="datafolder_download_data" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="Download Data | HINTS" />
    <meta name="Description" content="Download HINTS datasets in SAS, SPSS, or STATA format to conduct your own analyses. " />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">

                    <h1>Public Use Dataset</h1>

                    <div runat="server" id="PNL_Terms" class="TermsShow">
                        <asp:Panel ID="PNL_terms_defaultbutton" runat="server" DefaultButton="btnSubmit_SinglePage">
                            <h2>HINTS Data Terms of Use</h2>
                            <p>
                                It is of utmost importance to ensure the confidentiality of survey participants.
        Every effort has been made to exclude identifying information on individual respondents
        from the computer files. Some demographic information such as sex, race, etc., has
        been included for research purposes. NCI expects that users of the data set will
        adhere to the strictest standards of ethical conduct for the analysis and reporting
        of nationally collected survey data. It is mandatory that all research results be
        presented/published in a manner that protects the integrity of the data and ensures
        the confidentiality of participants.
                            </p>
                            <p>
                                In order for the Health Information National Trends Survey (HINTS) to provide a
        public-use or another version of data to you, it is necessary that you agree to
        the following provisions.
                            </p>
                            <ol>
                                <li>You will not present/publish data in which an individual can be identified. Publication
            of small cell sizes should be avoided. </li>
                                <li>You will not attempt to link nor permit others to link the data with individually
            identified records in another database. </li>
                                <li>You will not attempt to learn the identity of any person whose data are contained
            in the supplied file(s).</li>
                                <li>If the identity of any person is discovered inadvertently, then the following should
            be done;
            <ol type="a">
                <li>no use will be made of this knowledge, </li>
                <li>the HINTS Program staff will be notified of the incident, </li>
                <li>no one else will be informed of the discovered identity.</li>
            </ol>
                                </li>
                                <li>You will not release nor permit others to release the data in full or in part to
            any person except with the written approval of the HINTS Program staff. </li>
                                <li>If accessing the data from a centralized location on a time sharing computer system
            or LAN, you will not share your logon name and password with any other individuals.
            You will also not allow any other individuals to use your computer account after
            you have logged on with your logon name and password. </li>
                                <li>For all software provided by the HINTS Program, you will not copy, distribute, reverse
            engineer, profit from its sale or use, or incorporate it in any other software system.
                                </li>
                                <li>The source of information should be cited in all publications. The appropriate citation
            is associated with the data file used. Please see Suggested Citations in the Download
            HINTS Data section of this Web site, or the Readme.txt associated with the ASCII
            text version of the HINTS data. </li>
                                <li>Analyses of large HINTS domains usually produce reliable estimates, but analyses
            of small domains may yield unreliable estimates, as indicated by their large variances.
            The analyst should pay particular attention to the standard error and coefficient
            of variation (relative standard error) for estimates of means, proportions, and
            totals, and the analyst should report these when writing up results. It is important
            that the analyst realizes that small sample sizes for particular analyses will tend
            to result in unstable estimates.</li>
                                <li>You may receive periodic e-mail updates from the HINTS administrators.</li>
                            </ol>
                            <p>
                                <asp:CheckBox ID="chkAcceptTerm_SinglePage" runat="server" />
                                <asp:Label ID="Label2" runat="server" AssociatedControlID="chkAcceptTerm_SinglePage" Text=" Marking this box indicates that I agree to comply with the above stated provisions."></asp:Label>
                                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="&lt;br/&gt;Please check the box to proceed."
                                    ValidationGroup="mainpage_GP" ForeColor="Red"></asp:CustomValidator>
                            </p>
                            <p>
                                <asp:Label ID="Label1" runat="server" AssociatedControlID="txtemailTerms" Text="Please enter your email:"></asp:Label>
                                <asp:TextBox ID="txtemailTerms" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtemailTerms"
                                    ValidationGroup="mainpage_GP" Display="Dynamic" ErrorMessage="&lt;br/&gt;Please enter an email address." ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemailTerms"
                                    ValidationGroup="mainpage_GP" Display="Dynamic" ErrorMessage="&lt;br/&gt;Please enter a valid email address."
                                    ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </p>
                            <p>
                                <asp:Button ID="btnSubmit_SinglePage" ValidationGroup="mainpage_GP" runat="server" Text="Accept" />
                            </p>
                        </asp:Panel>
                    </div>
                    <div id="dv_data" runat="server" class="TermsHidden">


                        <div id="calloutBox">
                            <p>
                                Visit the <a href="/data/data-remediation.aspx">HINTS Data Errors, Remediation, and Recommendations</a> page to access important information about HINTS data errors, remediation procedures, and resultant recommendations
                            </p>
                        </div>
                        <div id="calloutBox2">
                            <p>
                                If you require access to detailed geographic information or variables that have been suppressed in the public use datasets, please visit the <a href="/data/restricted-data.aspx">Request Restricted HINTS Datasets</a> page to learn how you can request restricted-use HINTS data
                            </p>
                        </div>












                        <p><strong>HINTS-SEER (2021) dataset, updated November 2022</strong></p>
                        <p>
                            Total respondents: 1,258<br>
                            Complete responses: 1,189<br>
                            Partial responses**: 45<br>
                            Ineligible responses: 24
                        </p>
                        <p>Because the HINTS-SEER dataset contains linked medical diagnosis variables and there is a potential for disclosure, HINTS-SEER is not a public-use data file that is available for download without first applying to use the data via the HINTS <a href="/data/restricted-data.aspx">restricted-use data request form</a>. Once the form has been submitted, it will be reviewed by a subcommittee of analysts and a member of the HINTS management team will be in touch with you via email within 2 weeks to discuss your request. To learn more about HINTS-SEER, please consult the <a href="/docs/Instruments/HINTS_SEER_AnnotatedInstrumentEnglish.pdf" target="_blank">survey instrument</a>.</p>
                        <p>**Note: A questionnaire was considered to be complete if at least 80% of Sections A and B were answered. A questionnaire was considered to be partially complete if 50% to 79% of the questions in Sections A and B were answered. Only questions required of every respondent were factored into the completion rate calculation.</p>

















                        <p><strong>HINTS 5, Cycle 4 (2020) dataset, updated May 2022</strong></p>
                        <p>
                            Total respondents: 3,865<br />
                            Complete responses: 3,792<br />
                            Partial responses**: 73

                        </p>
                        <p>**Note: A questionnaire was considered to be complete if at least 80% of Sections A and B were answered. A questionnaire was considered to be partially complete if 50% to 79% of the questions were answered in Sections A and B. Only questions required of every respondent were factored into the completion rate calculation.</p>
                        <ul>
                            <li><a href="/dataset/HINTS5_Cycle4_SAS_20220519.zip">SAS data and supporting documents</a> (ZIP, 12.5 MB)</li>
                            <li><a href="/dataset/HINTS5_Cycle4_STATA_202201519.zip">STATA data and supporting documents</a> (ZIP, 12.5 MB)</li>
                            <li><a href="/dataset/HINTS5_Cycle4_SPSS_20220519.zip">SPSS data and supporting documents</a> (ZIP, 11.9 MB)</li>
                        </ul>


                        <p><strong>HINTS 5, Cycle 3 (2019) dataset, updated April 2021</strong></p>
                        <p>
                            Total respondents: 5,438<br />
                            Complete responses: 5,247<br />
                            Partial responses**: 191

                        </p>
                        <p>**Note: A questionnaire was considered to be complete if at least 80% of Sections A and B were answered. A questionnaire was considered to be partially complete if 50% to 79% of the questions were answered in Sections A and B. Only questions required of every respondent were factored in to the completion rate calculation.</p>
                        <ul>
                            <li><a href="/dataset/HINTS5_Cycle3_SAS_20210305.zip">SAS data and supporting documents</a> (ZIP, 19.3 MB)</li>
                            <li><a href="/dataset/HINTS5_Cycle3_Stata_20210305.zip">STATA data and supporting documents</a> (ZIP, 19.1 MB)</li>
                            <li><a href="/dataset/HINTS5_Cycle3_SPSS_20210305.zip">SPSS data and supporting documents</a> (ZIP, 19.1 MB)</li>
                        </ul>





                        <p><strong>HINTS 5, Cycle 2 (2018) dataset, updated October 2020</strong></p>
                        <p>
                            Total respondents: 3,504<br />
                            Complete responses: 3,434<br />
                            Partial responses**: 70

                        </p>
                        <p>**Note: A questionnaire was considered to be complete if at least 80% of Sections A and B were answered. A questionnaire was considered to be partially complete if 50% to 79% of the questions were answered in Sections A and B.</p>
                        <ul>
                            <li><a href="/dataset/HINTS5_Cycle2_SAS_10132020.zip">SAS data and supporting documents</a> (ZIP, 12.4 MB)</li>
                            <li><a href="/dataset/HINTS5_Cycle2_STATA_10132020.zip">STATA data and supporting documents</a> (ZIP, 12.4 MB)</li>
                            <li><a href="/dataset/HINTS5_Cycle2_SPSS_10132020.zip">SPSS data and supporting documents</a> (ZIP, 11.9 MB)</li>
                        </ul>

                        <p><strong>HINTS 5, Cycle 1 (2017) dataset, updated June 2020</strong></p>
                        <p>
                            Total respondents: 3,285<br />
                            Complete responses: 3,191<br />
                            Partial responses**: 94
                        </p>
                        <p>**Note: A questionnaire was considered to be complete if at least 80% of Sections A and B were answered. A questionnaire was considered to be partially complete if 50% to 79% of the questions were answered in Sections A and B.</p>
                        <ul>
                            <li><a href="/dataset/HINTS-5_Cycle1_SAS.zip">SAS data and supporting documents</a> (ZIP, 10.8 MB)</li>
                            <li><a href="/dataset/HINTS-5_Cycle1_STATA.zip">STATA data and supporting documents</a> (ZIP, 10.7 MB)</li>
                            <li><a href="/dataset/HINTS-5_Cycle1_SPSS.zip">SPSS data and supporting documents</a> (ZIP, 10.5 MB)</li>
                        </ul>

                        <p><strong>HINTS-FDA, Cycle 2 (2017) dataset, updated May 2018</strong></p>
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








                        <p><strong>HINTS-FDA (2015) dataset, updated September 2017 (See history document for change details)</strong></p>
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




                        <p>
                            <strong>HINTS 4, Cycle 4 (2014) dataset, updated June 2021 (See history document for change details)</strong>
                        </p>
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






                        <p>
                            <strong>HINTS 4, Cycle 3 (2013) dataset, updated April 2021 (See history document for change details)</strong>
                        </p>
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
                        <p>
                            <strong>HINTS 4, Cycle 2 (2012) dataset, updated October 2020 (See history document for change details)</strong>
                        </p>
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
                        <p>
                            <strong>HINTS 4, Cycle 1 (2011) dataset, updated October 2020 (See history document for change details)</strong>
                        </p>
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
                        <p>
                            <strong>HINTS Puerto Rico 2009  </strong>
                        </p>
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
                        <p>
                            <strong>HINTS 2007 Dataset, updated February 2009  </strong>
                        </p>
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
                        <p>
                            <strong>HINTS 2005 Dataset, updated June 2006 </strong>
                        </p>
                        <p>
                            The full dataset (n=5586) includes respondents who completed the entire interview
        (Completes: n=5394) plus those who completed the Health Communication and General
        Cancer Questions only (Partial Completes: n=192).
                        </p>
                        <ul>
                            <li><a href="/dataset/HINTS-2005-SAS-Public-Internet6-02-06.ZIP">SAS data and supporting
            documents</a> (ZIP, 4.71 MB)</li>
                            <li><a href="/dataset/HINTS-2005-SPSS-Public-Internet6-02-06.ZIP">SPSS data and supporting documents</a> (ZIP, 4.56 MB)</li>
                        </ul>
                        <p>
                            <strong>HINTS 2003 Dataset, updated June 2006  </strong>
                        </p>
                        <p>
                            The full dataset (n=6369) includes respondents who completed the entire interview
        (Completes: n=6149) plus those who completed the Health Communication and General
        Cancer Questions only (Partial Completes: n=220).
                        </p>
                        <ul>
                            <li><a href="/dataset/HINTS-2003-SAS-Internet-Public_6-2-06.ZIP">SAS data and supporting
            documents</a> (ZIP, 5.41 MB)</li>
                            <li><a href="/dataset/HINTS-2003-SPSS-Public-Internet_6-2-06.ZIP">SPSS data and supporting documents</a> (ZIP, 5.28 MB)</li>
                        </ul>
                        <p>
                            You may also download the Codebook for interpreting data values along with unweighted
        and weighted frequencies.
                        </p>
                        <p>
                            For additional information about using HINTS data, please use our <a href="/about-hints/contact-us.aspx">contact form</a> or email <a href="mailto:NCIhints@mail.nih.gov">NCIhints@mail.nih.gov</a>.
                        </p>
                    </div>

                </div>
            </div>
        </section>
    </div>
</asp:Content>


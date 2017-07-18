<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="announcements.aspx.vb" Inherits="announcements" %>

<%@ Register Src="~/_usercontrols/sub_unsub.ascx" TagPrefix="uc1" TagName="sub_unsub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .imagediv {
            float: left;
            padding: 1em;
            width: 33%;
            text-align: center;
        }
    </style>


    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            //Hide modal box
            $('#closeModal_SubUnSub').click(
                function () { $('.modalDialog_SubUnSub').hide(); }
            );
        });

        function OpenModalSubUnSub() {
            $('.modalDialog_SubUnSub').show();
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="openModal" class="modalDialog_SubUnSub">
        <div>
            <a href="javascript:void(0)" title="Close" id="closeModal_SubUnSub">X</a>
            <uc1:sub_unsub runat="server" ID="sub_unsub" />
        </div>
    </div>


    <h1>Announcements</h1>
    <p><a href="javascript:void(0)" onclick="javascript:OpenModalSubUnSub();">Subscribe for latest announcments.</a></p>

    





        <h2 id="Jul2017">Check  Out HINTS-ASL: Health-Related Information Seeking among Deaf Adults</h2>
        <p><strong>July 19, 2017</strong></p>


    <p>Recently,  Dr. Poorna Kushalnagar from Gallaudet University created and administered a  version of the HINTS survey in ASL (American Sign Language). Her projects  focused on using an ASL version of HINTS items to understand trends in  searching, finding, and sharing information for health related decision making  amongst both deaf college students and adults. A video describing her research  and some key findings can be found below. </p>
<p><iframe width="560" height="315" src="https://www.youtube.com/embed/lYeD8JBhWOg" frameborder="0" title="Check  Out HINTS-ASL: Health-Related Information Seeking among Deaf Adults" allowfullscreen></iframe></p>
<p>Visit <a href="http://www.deafhealthqol.com/news/dhcqols-first-film-production">http://www.deafhealthqol.com/news/dhcqols-first-film-production</a> to learn more about Dr. &nbsp;Kushalnagar&rsquo;s work. </p>



    <h2 id="Nov2016"><a href="/docs/HINTS-FDA_Toolkit_for_Grad_School_Promotion_FINAL.pdf">HINTS Outreach Toolkit for Academic Institutions</a></h2>
    <p><strong>November 16, 2016</strong></p>

        <p>Spread the word, HINTS-FDA data is now available for download! HINTS data is great for
         graduate students and researchers across all disciplines, from public health to health 
        informatics to communication. Help us get the word out about this free data resource by
         using the outreach toolkit found below. This toolkit offers resources that you can 
        distribute over social media, newsletters, or email to encourage your followers and 
        networks to take a closer look at HINTS-FDA and consider how they might use these data 
        in their research studies. Also, get the word out about our newest data with HINTS infocards
         for graduate students and educators (see below).</p>

      <p>Click to enlarge the images below</p>
    <div style="text-align: center; width: 70%; margin-left: auto; margin-right: auto;">
        <div style="overflow: hidden; width: 100%; text-align: center;">
            <div class="imagediv">
                <a href="_images/infocards/HINTS_Infocards_Cancer_Causes.jpg" target="_blank">
                    <img src="_images/infocards/thumbs/HINTS_Infocards_Cancer_Causes.png"
                      alt="HINTS Data Trends 2003 - 2015
Americans who agree that it seems like everything causes cancer:
2015: 54.2%
2003: 46.9%
[Footer] Learn more about HINTS and download datasets at http://hints.cancer.gov, Follow us on Twitter"
                        title="HINTS Data Trends 2003 - 2015
Americans who agree that it seems like everything causes cancer:
2015: 54.2%
2003: 46.9%
[Footer] Learn more about HINTS and download datasets at http://hints.cancer.gov, Follow us on Twitter" /></a>

            </div>
            <div class="imagediv">
                <a href="_images/infocards/HINTS_Infocards_Cigarettes_Harm.jpg" target="_blank">
                    <img src="_images/infocards/thumbs/HINTS_Infocards_Cigarettes_Harm.png"
                        alt="Want Health Communications Data for Next Semester? We have new HINTS data for you!
Americans who think smoking cigarettes for less than 1 year can harm your health:
67.4%
[Footer] Learn more about HINTS and download datasets at http://hints.cancer.gov, Follow us on Twitter"
                        title="Want Health Communications Data for Next Semester? We have new HINTS data for you!
Americans who think smoking cigarettes for less than 1 year can harm your health:
67.4%
[Footer] Learn more about HINTS and download datasets at http://hints.cancer.gov, Follow us on Twitter" /></a>

            </div>
            <div class="imagediv">
                <a href="_images/infocards/HINTS_Infocards_Internet_Health_Info.jpg" target="_blank">
                    <img src="_images/infocards/thumbs/HINTS_Infocards_Internet_Health_Info.png"
                        alt="HINTS Data Trends 2008 - 2015
Americans who went to the internet FIRST to look for information about health or medical topics:
2015: 72.8%
2008: 61%
[Footer] Learn more about HINTS and download datasets at http://hints.cancer.gov, Follow us on Twitter"
                        title="HINTS Data Trends 2008 - 2015
Americans who went to the internet FIRST to look for information about health or medical topics:
2015: 72.8%
2008: 61%
[Footer] Learn more about HINTS and download datasets at http://hints.cancer.gov, Follow us on Twitter" /></a>

            </div>

        </div>

        <div style="overflow: hidden; width: 100%; text-align: center;">
            <div class="imagediv">
                <a href="_images/infocards/HINTS_Infocards_Lower_Cancer_Risk.jpg" target="_blank">
                    <img src="_images/infocards/thumbs/HINTS_Infocards_Lower_Cancer_Risk.png"
                       alt="HINTS Data Trends 2003 - 2015
Americans who believe that there is something they can do to lower their chances of getting cancer:
2015: 71.5%
2003: 64.7%
[Footer] Learn more about HINTS and download datasets at http://hints.cancer.gov, Follow us on Twitter"
                        title="HINTS Data Trends 2003 - 2015
Americans who believe that there is something they can do to lower their chances of getting cancer:
2015: 71.5%
2003: 64.7%
[Footer] Learn more about HINTS and download datasets at http://hints.cancer.gov, Follow us on Twitter" /></a>

            </div>
            <div class="imagediv">
                <a href="_images/infocards/HINTS_Infocards_Multivitamin.jpg" target="_blank">
                    <img src="_images/infocards/thumbs/HINTS_Infocards_Multivitamin.png"
                      alt="Want Health Communications Data for Next Semester? We have new HINTS data for you!
Americans who have taken one or more multi-vitamins or multi-mineral supplements in the past 12 months:
59.5%
[Footer] Learn more about HINTS and download datasets at http://hints.cancer.gov, Follow us on Twitter"
                        title="Want Health Communications Data for Next Semester? We have new HINTS data for you!
Americans who have taken one or more multi-vitamins or multi-mineral supplements in the past 12 months:
59.5%
[Footer] Learn more about HINTS and download datasets at http://hints.cancer.gov, Follow us on Twitter" /></a>

            </div>
            <div class="imagediv">
                <a href="_images/infocards/HINTS_Infocards_Smoking_Harm.jpg" target="_blank">
                    <img src="_images/infocards/thumbs/HINTS_Infocards_Smoking_Harm.png"
                        alt="HINTS Data Trends 2008 - 2015
Americans who believe that some types of cigarettes are less harmful than others:
2015: 59.1%
2008: 80.4%
[Footer] Learn more about HINTS and download datasets at http://hints.cancer.gov, Follow us on Twitter"
                        title="HINTS Data Trends 2008 - 2015
Americans who believe that some types of cigarettes are less harmful than others:
2015: 59.1%
2008: 80.4%
[Footer] Learn more about HINTS and download datasets at http://hints.cancer.gov, Follow us on Twitter" /></a>

            </div>
        </div>


        <div style="overflow: hidden; width: 100%; text-align: center;">
            <div class="imagediv">
                <a href="_images/infocards/HINTS_Infocards_Trust_Tobacco_Info.jpg" target="_blank">
                    <img src="_images/infocards/thumbs/HINTS_Infocards_Trust_Tobacco_Info.png"
                      alt="Want Health Communications Data for Next Semester? We have new HINTS data for you!
American who do NOT trust information about the health effects of using tobacco from tobacco companies:
63.4%
[Footer] Learn more about HINTS and download datasets at http://hints.cancer.gov, Follow us on Twitter"
                        title="Want Health Communications Data for Next Semester? We have new HINTS data for you!
American who do NOT trust information about the health effects of using tobacco from tobacco companies:
63.4%
[Footer] Learn more about HINTS and download datasets at http://hints.cancer.gov, Follow us on Twitter" /></a>
            </div>
        </div>



        </div>
    



    <h2 id="Sept2016_webinar">HINTS How-to Webinar</h2>
    <p><strong>September 21, 2016</strong></p>



            <p>
                On May 4, 2016, presenters from the National Cancer Institute and the U.S. Food and Drug Administration
             came together to provide an overview of HINTS, review optimal ways for analyzing HINTS
             data, and present case studies that used HINTS data in an interactive workshop and
             webinar. Videos from this webinar are <a href="/webinars/howtohints.aspx">now available</a>. 
            </p>


    <h2 id="June2016_FDA">New HINTS Data Now Available</h2>
    <p><strong>June 29, 2016</strong></p>



    <p>
        In collaboration with the Food and Drug Administration&rsquo;s (FDA)  Center 
       for Tobacco Products, Center for Food Safety and Applied Nutrition, and  
       Office of the Commissioner, we have just released
       <a href="http://hints.cancer.gov/dataset.aspx">HINTS-FDA</a>,
       a new nationally representative public use dataset. This dataset combines 
       the  traditional HINTS topics of health communication, cancer knowledge,
        and cancer  risk behaviors with an assessment of the public&rsquo;s 
       knowledge of risk perceptions  about new tobacco products, perceptions 
       of tobacco product harm, tobacco product  claims, diet supplement labeling,
        medical devices, and communications related  to product recalls.

    </p>




    <h2 id="May2016_infographics">New HINTS Infographics Now Available</h2>
    <p><strong>May 13, 2016</strong></p>
    <p>
        These infographics highlight key HINTS data points on the public's trust of health information from a variety of sources. Feel free to download and share them on social media, your website, or for an upcoming event.
    </p>
    <p>Click to enlarge the images below</p>
    <div style="text-align: center; width: 70%; margin-left: auto; margin-right: auto;">
        <div style="overflow: hidden; width: 100%; text-align: center;">
            <div class="imagediv">
                <a href="_images/infographics/HINTS-TRUST-Infographic-Cancer-Sources_Facebook-Optimized.jpg" target="_blank">
                    <img src="_images/infographics/thumbs/HINTS-TRUST-Infographic-Cancer-Sources_Facebook-Optimized_thumb.jpg"
                        alt="TITLE: American’s Trust in Cancer Information Sources
INTRO: In 2014, Americans told HINTS how much they trust cancer information from a variety of different sources. 
DATA POINTS:
Trust cancer information “a lot” or “some”:
•	A Doctor: 92%
•	Government Health Agencies: 70%
•	Internet: 66% 
•	Family and Friends: 55% 
•	Charitable Organizations: 55%
•	Newspapers or magazines: 42%
•	Television: 36%
•	Religious Organizations and Leaders: 32%
•	Radio: 25%
SOURCE: Health Information National Trends Survey (HINTS), 2014, National Cancer Institute
Since 2003, HINTS has tracked changes in the rapidly evolving health communication and information technology landscape. HINTS regularly collects nationally representative data about the American public’s knowledge of, attitudes toward, and use of cancer, and health related information. Get 2014 and all previous datasets at http://hints.cancer.gov in SPSS, SAS, or STATA formats. 
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
http://hints.cancer.gov"
                        title="TITLE: American’s Trust in Cancer Information Sources
INTRO: In 2014, Americans told HINTS how much they trust cancer information from a variety of different sources. 
DATA POINTS:
Trust cancer information “a lot” or “some”:
•	A Doctor: 92%
•	Government Health Agencies: 70%
•	Internet: 66% 
•	Family and Friends: 55% 
•	Charitable Organizations: 55%
•	Newspapers or magazines: 42%
•	Television: 36%
•	Religious Organizations and Leaders: 32%
•	Radio: 25%
SOURCE: Health Information National Trends Survey (HINTS), 2014, National Cancer Institute
Since 2003, HINTS has tracked changes in the rapidly evolving health communication and information technology landscape. HINTS regularly collects nationally representative data about the American public’s knowledge of, attitudes toward, and use of cancer, and health related information. Get 2014 and all previous datasets at http://hints.cancer.gov in SPSS, SAS, or STATA formats. 
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
http://hints.cancer.gov" /></a>

            </div>
            <div class="imagediv">
                <a href="_images/infographics/HINTS-TRUST-Infographic-Cancer-Sources_Horizontal.jpg" target="_blank">
                    <img src="_images/infographics/thumbs/HINTS-TRUST-Infographic-Cancer-Sources_Horizontal_thumb.jpg"
                        alt="TITLE: American’s Trust in Cancer Information Sources
INTRO: In 2014, Americans told HINTS how much they trust cancer information from a variety of different sources. 
DATA POINTS:
Trust cancer information “a lot” or “some”:
•	A Doctor: 92%
•	Government Health Agencies: 70%
•	Internet: 66% 
•	Family and Friends: 55% 
•	Charitable Organizations: 55%
•	Newspapers or magazines: 42%
•	Television: 36%
•	Religious Organizations and Leaders: 32%
•	Radio: 25%
SOURCE: Health Information National Trends Survey (HINTS), 2014, National Cancer Institute
Since 2003, HINTS has tracked changes in the rapidly evolving health communication and information technology landscape. HINTS regularly collects nationally representative data about the American public’s knowledge of, attitudes toward, and use of cancer, and health related information. Get 2014 and all previous datasets at http://hints.cancer.gov in SPSS, SAS, or STATA formats. 
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
http://hints.cancer.gov"
                        title="TITLE: American’s Trust in Cancer Information Sources
INTRO: In 2014, Americans told HINTS how much they trust cancer information from a variety of different sources. 
DATA POINTS:
Trust cancer information “a lot” or “some”:
•	A Doctor: 92%
•	Government Health Agencies: 70%
•	Internet: 66% 
•	Family and Friends: 55% 
•	Charitable Organizations: 55%
•	Newspapers or magazines: 42%
•	Television: 36%
•	Religious Organizations and Leaders: 32%
•	Radio: 25%
SOURCE: Health Information National Trends Survey (HINTS), 2014, National Cancer Institute
Since 2003, HINTS has tracked changes in the rapidly evolving health communication and information technology landscape. HINTS regularly collects nationally representative data about the American public’s knowledge of, attitudes toward, and use of cancer, and health related information. Get 2014 and all previous datasets at http://hints.cancer.gov in SPSS, SAS, or STATA formats. 
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
http://hints.cancer.gov" />
                </a>

            </div>
            <div class="imagediv">
                <a href="_images/infographics/HINTS-TRUST-Infographic-Cancer-Sources_Twitter-Optimized.jpg" target="_blank">
                    <img src="_images/infographics/thumbs/HINTS-TRUST-Infographic-Cancer-Sources_Twitter-Optimized_thumb.jpg"
                        alt="TITLE: American’s Trust in Cancer Information Sources
INTRO: In 2014, Americans told HINTS how much they trust cancer information from a variety of different sources. 
DATA POINTS:
Trust cancer information “a lot” or “some”:
•	A Doctor: 92%
•	Government Health Agencies: 70%
•	Internet: 66% 
•	Family and Friends: 55% 
•	Charitable Organizations: 55%
•	Newspapers or magazines: 42%
•	Television: 36%
•	Religious Organizations and Leaders: 32%
•	Radio: 25%
SOURCE: Health Information National Trends Survey (HINTS), 2014, National Cancer Institute
Since 2003, HINTS has tracked changes in the rapidly evolving health communication and information technology landscape. HINTS regularly collects nationally representative data about the American public’s knowledge of, attitudes toward, and use of cancer, and health related information. Get 2014 and all previous datasets at http://hints.cancer.gov in SPSS, SAS, or STATA formats. 
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
http://hints.cancer.gov"
                        title="TITLE: American’s Trust in Cancer Information Sources
INTRO: In 2014, Americans told HINTS how much they trust cancer information from a variety of different sources. 
DATA POINTS:
Trust cancer information “a lot” or “some”:
•	A Doctor: 92%
•	Government Health Agencies: 70%
•	Internet: 66% 
•	Family and Friends: 55% 
•	Charitable Organizations: 55%
•	Newspapers or magazines: 42%
•	Television: 36%
•	Religious Organizations and Leaders: 32%
•	Radio: 25%
SOURCE: Health Information National Trends Survey (HINTS), 2014, National Cancer Institute
Since 2003, HINTS has tracked changes in the rapidly evolving health communication and information technology landscape. HINTS regularly collects nationally representative data about the American public’s knowledge of, attitudes toward, and use of cancer, and health related information. Get 2014 and all previous datasets at http://hints.cancer.gov in SPSS, SAS, or STATA formats. 
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
http://hints.cancer.gov" /></a>

            </div>

        </div>

        <div style="overflow: hidden; width: 100%; text-align: center;">
            <div class="imagediv">
                <a href="_images/infographics/HINTS-TRUST-Infographic-Cancer-Sources_Vertical.jpg" target="_blank">
                    <img src="_images/infographics/thumbs/HINTS-TRUST-Infographic-Cancer-Sources_Vertical_thumb.jpg"
                        alt="TITLE: American’s Trust in Cancer Information Sources
INTRO: In 2014, Americans told HINTS how much they trust cancer information from a variety of different sources. 
DATA POINTS:
Trust cancer information “a lot” or “some”:
•	A Doctor: 92%
•	Government Health Agencies: 70%
•	Internet: 66% 
•	Family and Friends: 55% 
•	Charitable Organizations: 55%
•	Newspapers or magazines: 42%
•	Television: 36%
•	Religious Organizations and Leaders: 32%
•	Radio: 25%
SOURCE: Health Information National Trends Survey (HINTS), 2014, National Cancer Institute
Since 2003, HINTS has tracked changes in the rapidly evolving health communication and information technology landscape. HINTS regularly collects nationally representative data about the American public’s knowledge of, attitudes toward, and use of cancer, and health related information. Get 2014 and all previous datasets at http://hints.cancer.gov in SPSS, SAS, or STATA formats. 
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
http://hints.cancer.gov"
                        title="TITLE: American’s Trust in Cancer Information Sources
INTRO: In 2014, Americans told HINTS how much they trust cancer information from a variety of different sources. 
DATA POINTS:
Trust cancer information “a lot” or “some”:
•	A Doctor: 92%
•	Government Health Agencies: 70%
•	Internet: 66% 
•	Family and Friends: 55% 
•	Charitable Organizations: 55%
•	Newspapers or magazines: 42%
•	Television: 36%
•	Religious Organizations and Leaders: 32%
•	Radio: 25%
SOURCE: Health Information National Trends Survey (HINTS), 2014, National Cancer Institute
Since 2003, HINTS has tracked changes in the rapidly evolving health communication and information technology landscape. HINTS regularly collects nationally representative data about the American public’s knowledge of, attitudes toward, and use of cancer, and health related information. Get 2014 and all previous datasets at http://hints.cancer.gov in SPSS, SAS, or STATA formats. 
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
http://hints.cancer.gov" /></a>

            </div>
            <div class="imagediv">
                <a href="_images/infographics/HINTS-TRUST-Infographic-Family_Facebook-Optimized.jpg" target="_blank">
                    <img src="_images/infographics/thumbs/HINTS-TRUST-Infographic-Family_Facebook-Optimized_thumb.jpg"
                        alt="TITLE: American Trust in Health Information from family or friends
Americans who place a lot of trust in health information from family or friends
•	2005: 23%
•	2013: 8%
•	*15% difference
*P Less than 0.01
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov"
                        title="TITLE: American Trust in Health Information from family or friends
Americans who place a lot of trust in health information from family or friends
•	2005: 23%
•	2013: 8%
•	*15% difference
*P Less than 0.01
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov" /></a>

            </div>
            <div class="imagediv">
                <a href="_images/infographics/HINTS-TRUST-Infographic-Family_Twitter-Optimized.jpg" target="_blank">
                    <img src="_images/infographics/thumbs/HINTS-TRUST-Infographic-Family_Twitter-Optimized_thumb.jpg"
                        alt="TITLE: American Trust in Health Information from family or friends
Americans who place a lot of trust in health information from family or friends
•	2005: 23%
•	2013: 8%
•	*15% difference
*P Less than 0.01
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov"
                        title="TITLE: American Trust in Health Information from family or friends
Americans who place a lot of trust in health information from family or friends
•	2005: 23%
•	2013: 8%
•	*15% difference
*P Less than 0.01
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov" /></a>

            </div>
        </div>


        <div style="overflow: hidden; width: 100%; text-align: center;">
            <div class="imagediv">
                <a href="_images/infographics/HINTS-TRUST-Infographic-Government_Facebook-Optimized.jpg" target="_blank">
                    <img src="_images/infographics/thumbs/HINTS-TRUST-Infographic-Government_Facebook-Optimized_thumb.jpg"
                        alt="TITLE: American Trust in Health Information from Government Agencies
Americans who place a lot of trust in health information from Government Health Agencies
•	2008: 31%
•	2013: 26%
•	*5% difference
*P=0.03
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov"
                        title="TITLE: American Trust in Health Information from Government Agencies
Americans who place a lot of trust in health information from Government Health Agencies
•	2008: 31%
•	2013: 26%
•	*5% difference
*P=0.03
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov" /></a>

            </div>
            <div class="imagediv">
                <a href="_images/infographics/HINTS-TRUST-Infographic-Government_Twitter-Optimized.jpg" target="_blank">
                    <img src="_images/infographics/thumbs/HINTS-TRUST-Infographic-Government_Twitter-Optimized_thumb.jpg"
                        alt="TITLE: American Trust in Health Information from Government Agencies
Americans who place a lot of trust in health information from Government Health Agencies
•	2008: 31%
•	2013: 26%
•	*5% difference
*P=0.03
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov"
                        title="TITLE: American Trust in Health Information from Government Agencies
Americans who place a lot of trust in health information from Government Health Agencies
•	2008: 31%
•	2013: 26%
•	*5% difference
*P=0.03
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov" />
                </a>

            </div>
            <div class="imagediv">
                <a href="_images/infographics/HINTS-TRUST-Infographic-Radio_Facebook-Optimized.jpg" target="_blank">
                    <img src="_images/infographics/thumbs/HINTS-TRUST-Infographic-Radio_Facebook-Optimized_thumb.jpg"
                        alt="TITLE: American Trust in Health Information from the radio
Americans who trust health information from the radio
•	2005: 85%
•	2013: 72%
•	*7% difference
*P less than 0.01
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov"
                        title="TITLE: American Trust in Health Information from the radio
Americans who trust health information from the radio
•	2005: 85%
•	2013: 72%
•	*7% difference
*P less than 0.01
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov" /></a>

            </div>

        </div>


        <div style="overflow: hidden; width: 100%; text-align: center;">
            <div class="imagediv">
                <a href="_images/infographics/HINTS-TRUST-Infographic-Radio_Twitter-Optimized.jpg" target="_blank">
                    <img src="_images/infographics/thumbs/HINTS-TRUST-Infographic-Radio_Twitter-Optimized_thumb.jpg"
                        alt="TITLE: American Trust in Health Information from the radio
Americans who trust health information from the radio
•	2005: 85%
•	2013: 72%
•	*7% difference
*P less than 0.01
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov"
                        title="TITLE: American Trust in Health Information from the radio
Americans who trust health information from the radio
•	2005: 85%
•	2013: 72%
•	*7% difference
*P less than 0.01
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov" /></a>

            </div>
        </div>

    </div>

    <hr />
    <!-- **************************************************** -->


    <h2 id="APHA2015">Catch HINTS at APHA 2015!</h2>

    <p><strong>November 3, 2015</strong></p>

    <p>
        This year at the American Public Health Association's 2015 Annual Meeting, 
        there will be 11 presentations using HINTS data! Download the schedule below 
        and if you are in Chicago for the meeting, be sure to see one of these great 
        talks and stop by the NCI booth to learn more about HINTS!
    </p>



    <p align="center">
        <a href="/docs/NCI_HINTS_APHA_Handout.pdf" target="_blank">
            <img src="_images/announcements/thumbs/NCI_HINTS_APHA_Handout_thumb.png"
                alt="Catch HINTS at APHA 2015!"
                title="Catch HINTS at APHA 2015!" /><br />
            Click to view the PDF.</a>
    </p>


    <hr style="clear: both;" />

    <h2 id="PLOS">HINTS Featured in Post on Social Inequalities in Cancer Information Seeking</h2>

    <p><strong>October 12, 2015</strong></p>

    <p>
        In a recent PLOS Public Health Perspectives blog post on a study investigating 
    the relationships between literacy, cancer fatalism, and cancer information seeking,
     HINTS 4, Cycle 3 data was used to conduct the analysis. One of the main findings of
     the study was that people with low literacy are slightly more likely to hold fatalistic
     cancer beliefs, which in turn acts as a barrier to seeking out information.
    </p>
    <p>
        You can read the full post by visiting 
    <a href="http://blogs.plos.org/publichealth/2015/09/22/info-seeking/" target="_blank">http://blogs.plos.org/publichealth/2015/09/22/info-seeking/</a>.
    </p>

    <hr />

    <h2 id="newsocialmediaresources">New Social Media Resources for Students and Educators</h2>

    <p><strong>August 14, 2015</strong></p>

    <p>Whether you are an educator or student, HINTS has data you can use. The social media outreach toolkit found below offers resources that you can disseminate to encourage your membership base and followers to take a closer look at HINTS and consider how they might use these data in their research studies. Also, get the word out about our newest 2014 data with these academia focused HINTS infocards for graduate students and educators.</p>
    <p><a href="/docs/HINTS_Outreach_Toolkit_for_Academic_Institutions_FINAL.pdf">HINTS Outreach Toolkit for Academic Institutions</a></p>



    <p>Click to enlarge the images below</p>
    <div style="text-align: center; width: 60%; margin-left: auto; margin-right: auto;">
        <div style="overflow: hidden; width: 100%; text-align: center;">
            <div class="imagediv">
                <a href="_images/announcements/HINTS_Graduate_School1.png" target="_blank">
                    <img src="_images/announcements/thumbs/HINTS_Graduate_School1_thumb.jpg"
                        alt="HINTS Graduate School Image Vertical Layout"
                        title="HINTS Graduate School Image Vertical Layout" /></a>

            </div>
            <div class="imagediv">
                <a href="_images/announcements/HINTS_Graduate_School2.png" target="_blank">
                    <img src="_images/announcements/thumbs/HINTS_Graduate_School2_thumb.jpg"
                        alt="HINTS Graduate School Image Horizontal Layout"
                        title="HINTS Graduate School Image Horizontal Layout" />
                </a>

            </div>

        </div>
    </div>
    <hr />
    <h2 id="hintsvisitguam">HINTS Visits Guam!</h2>
    <p><strong>August 4, 2015</strong></p>
    <p>
        Richard Moser, NCI program director in the Behavioral Research Program’s Science of Research and Technology Branch, recently visited the University of Guam to discuss survey methods and the latest HINTS data. Learn more about his talk at: <a href="http://www.uog.edu/news-announcements/program-director-from-the-national-cancer-institute-to-present-at-uog" target="_blank">http://www.uog.edu/news-announcements/program-director-from-the-national-cancer-institute-to-present-at-uog</a>
    </p>

    <hr />
    <h2 id="downloadandshareinfographics">Download and Share HINTS Infographic and Infocards</h2>
    <p><strong>July 16, 2015</strong></p>
    <p>
        These graphics highlight key data points both within HINTS 4, Cycle 4 and 
        data trends across all HINTS 4 data cycles. Feel free to download and share
         them, so you can spread the word that HINTS 4, Cycle 4 data is now available 
        for download (sample Tweets and Facebook messages found below).
    </p>
    <p><strong>Sample Messages:</strong></p>
    <p><strong>Twitter:</strong> New HINTS  4, Cycle 4 #data are now available at <a target="_blank" href="http://go.usa.gov/3pYnV!">http://go.usa.gov/3pYnV!</a> #HealthData</p>
    <p><strong>Facebook:</strong> Here&rsquo;s a HINT…new HINTS 4, Cycle 4 data available now! Visit <a target="_blank" href="http://go.usa.gov/3pYnV">http://go.usa.gov/3pYnV</a> for the newest dataset! </p>
    <p>Click to enlarge the images below</p>
    <div style="text-align: center; width: 60%; margin-left: auto; margin-right: auto;">
        <div style="overflow: hidden; width: 100%; text-align: center;">
            <div class="imagediv">
                <a href="_images/infographics/HINTS4-Cycle4-Infocards-v4-1.png" target="_blank">
                    <img src="_images/infographics/thumbs/HINTS4-Cycle4-Infocards-v4-1_thumb.jpg"
                        alt="HINTS 4, Cycle 4 Infocards
TITLE: HINTS Data Trends 2011-2014
Americans who ever looked for cancer information
•	2011: 51%
•	2014: 54%
•	IMAGE: Overhead of two hands on a laptop computer
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov"
                        title="HINTS 4, Cycle 4 Infocards
TITLE: HINTS Data Trends 2011-2014
Americans who ever looked for cancer information
•	2011: 51%
•	2014: 54%
•	IMAGE: Overhead of two hands on a laptop computer
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov" /></a>

            </div>
            <div class="imagediv">
                <a href="_images/infographics/HINTS4-Cycle4-Infocards-v4-2.png" target="_blank">
                    <img src="_images/infographics/thumbs/HINTS4-Cycle4-Infocards-v4-2_thumb.jpg"
                        alt="HINTS 4, Cycle 4 Infocards
TITLE: HINTS Data Trends 2011-2014
Americans who agree it seems like everything causes cancer
•	2011:62%
•	2014:63%
•	IMAGE: Icons of items that people commonly believe cause cancer, like alcohol and cellphones
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov"
                        title="HINTS 4, Cycle 4 Infocards
TITLE: HINTS Data Trends 2011-2014
Americans who agree it seems like everything causes cancer
•	2011:62%
•	2014:63%
•	IMAGE: Icons of items that people commonly believe cause cancer, like alcohol and cellphones
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov" />
                </a>

            </div>
            <div class="imagediv">
                <a href="_images/infographics/HINTS4-Cycle4-Infocards-v4-3.png" target="_blank">
                    <img src="_images/infographics/thumbs/HINTS4-Cycle4-Infocards-v4-3_thumb.jpg"
                        alt="HINTS 4, Cycle 4 Infocards
TITLE: HINTS Data Trends 2011-2014
Americans who saw a healthcare professional and said the professional always explained things in a way that they understood
•	2011: 60%
•	2014: 63%
•	IMAGE: Patient talking to doctor
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov"
                        title="HINTS 4, Cycle 4 Infocards
TITLE: HINTS Data Trends 2011-2014
Americans who saw a healthcare professional and said the professional always explained things in a way that they understood
•	2011: 60%
•	2014: 63%
•	IMAGE: Patient talking to doctor
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov" /></a>

            </div>

        </div>

        <div style="overflow: hidden; width: 100%; text-align: center;">
            <div class="imagediv">
                <a href="_images/infographics/HINTS4-Cycle4-Infocards-v4-4.png" target="_blank">
                    <img src="_images/infographics/thumbs/HINTS4-Cycle4-Infocards-v4-4_thumb.jpg"
                        alt="HINTS 4, Cycle 4 Infocards
TITLE: HINTS Data Trends 2011-2014
Americans who accessed the internet through a cellular network
•	2011: 46%
•	2014: 58%
•	Statistically significant 12% increase 
•	IMAGE: Hand holding a smartphone
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov"
                        title="HINTS 4, Cycle 4 Infocards
TITLE: HINTS Data Trends 2011-2014
Americans who accessed the internet through a cellular network
•	2011: 46%
•	2014: 58%
•	Statistically significant 12% increase 
•	IMAGE: Hand holding a smartphone
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov" /></a>

            </div>
            <div class="imagediv">
                <a href="_images/infographics/HINTS4-Cycle4-Infocards-v4-5.png" target="_blank">
                    <img src="_images/infographics/thumbs/HINTS4-Cycle4-Infocards-v4-5_thumb.jpg"
                        alt="HINTS 4, Cycle 4 Infocards
TITLE: HINTS Data Trends 2011-2014
Americans who kept information from their healthcare provider because they were concerned about privacy/security of their medical record
•	2011: 12%
•	2014: 15%
•	Statistically significant 3% increase
•	IMAGE: Two women and a man standing, all with the same thought bubble image of a lock
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov"
                        title="HINTS 4, Cycle 4 Infocards
TITLE: HINTS Data Trends 2011-2014
Americans who kept information from their healthcare provider because they were concerned about privacy/security of their medical record
•	2011: 12%
•	2014: 15%
•	Statistically significant 3% increase
•	IMAGE: Two women and a man standing, all with the same thought bubble image of a lock
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
Learn more about HINTS and download datasets at http://hints.cancer.gov" /></a>

            </div>
            <div class="imagediv">
                <a href="_images/infographics/HINTS4-Cycle4-Infographic-v3.png" target="_blank">
                    <img src="_images/infographics/thumbs/HINTS4-Cycle4-Infographic-v3_thumb.jpg"
                        alt="HINTS 4, Cycle 4 Infographic
TITLE: Monitoring a Changing Health Information Environment
INTRO: Americans told HINTS how they’re getting and using health information right now
DATA POINTS:
•	34% have health apps
o	IMAGE: Smartphone with various app icons above
•	60% with health apps used them to reach a goal, like quitting smoking or losing weight
o	IMAGE: Hand holding a smartphone with an image of a trophy on screen
•	16% tried to get health insurance under the new federal healthcare law
o	IMAGE: Desktop computer screen and mouse with “Sign-Up” on the screen
•	33% were offered online access to personal health information by their health care provider
o	IMAGE: Two smiling doctors
•	27% accessed personal health information online at least once in the past year
o	IMAGE: Overhead of two hands on a laptop computer
•	23% of those diagnosed with cancer talked with health care providers about the impact of cancer or treatment on their ability to work
o	IMAGE: Patient talking to doctor
SOURCE: Health Information National Trends Survey (HINTS), 2014, National Cancer Institute
Since 2003, HINTS has tracked changes in the rapidly evolving health communication and information technology landscape. HINTS regularly collects nationally representative data about the American public’s knowledge of, attitudes toward, and use of cancer, and health related information. Get 2014 and all previous datasets at http://hints.cancer.gov in SPSS, SAS, or STATA formats. 
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
http://hints.cancer.gov
"
                        title="HINTS 4, Cycle 4 Infographic
TITLE: Monitoring a Changing Health Information Environment
INTRO: Americans told HINTS how they’re getting and using health information right now
DATA POINTS:
•	34% have health apps
o	IMAGE: Smartphone with various app icons above
•	60% with health apps used them to reach a goal, like quitting smoking or losing weight
o	IMAGE: Hand holding a smartphone with an image of a trophy on screen
•	16% tried to get health insurance under the new federal healthcare law
o	IMAGE: Desktop computer screen and mouse with “Sign-Up” on the screen
•	33% were offered online access to personal health information by their health care provider
o	IMAGE: Two smiling doctors
•	27% accessed personal health information online at least once in the past year
o	IMAGE: Overhead of two hands on a laptop computer
•	23% of those diagnosed with cancer talked with health care providers about the impact of cancer or treatment on their ability to work
o	IMAGE: Patient talking to doctor
SOURCE: Health Information National Trends Survey (HINTS), 2014, National Cancer Institute
Since 2003, HINTS has tracked changes in the rapidly evolving health communication and information technology landscape. HINTS regularly collects nationally representative data about the American public’s knowledge of, attitudes toward, and use of cancer, and health related information. Get 2014 and all previous datasets at http://hints.cancer.gov in SPSS, SAS, or STATA formats. 
FOOTER:
Follow us on Facebook and Twitter
•	IMAGES: Facebook Logo, Twitter Logo
IMAGE: HINTS Logo
http://hints.cancer.gov
" /></a>

            </div>
        </div>

    </div>

    <hr />

    <h2>HINTS Featured in PLOS Public Health Perspectives Post</h2>
    <p><strong>May 19, 2015</strong></p>

    <p>
        In a recent blog post on Google’s new health search addition featured in PLOS Public Health Perspectives, HINTS data was highlighted as one rationale for this new innovation. HINTS has shown that while people often turn to the internet first to find health information, trust in that information has been low. Google has taken steps to amend this disconnect by designing their search algorithm to provide basic health information results from a database fact-checked by physicians at the Mayo Clinic.
    </p>
    <p>
        You can read the full post by visiting <a href="http://blogs.plos.org/publichealth/2015/02/18/google-health/">http://blogs.plos.org/publichealth/2015/02/18/google-health/</a>.

    </p>
    <hr />

    <h2>Don&rsquo;t Miss HINTS at the Society of Behavioral Medicine (SBM) Annual Meeting!</h2>
    <p><strong>April 14, 2015</strong></p>
    <p>If you are going to be at SBM 2015 taking place April 22-25 in San Antonio, TX, don&rsquo;t miss the following presentations featuring HINTS.</p>
    <p>
        <strong>Paper Session 41: Health Communication and Information Seeking. </strong>
        <br />
        <strong>Time: Saturday April 25 at 8:45 a.m. – 10:15 a.m.</strong><br />
        <strong>Location: Salon D</strong>
    </p>
    <div id="div_announcebox">
        <h3>Willingness to Exchange Health Information Using Mobile Phones: A Quantitative Analysis. </h3>
        <p>Katrina J. Serrano, PhD, CHES, and Audie A. Atienza, PhD, National Cancer Institute Science of Research and Technology Branch, Bethesda, MD</p>
        <h3>Seeking Health Information Online among Older Adults from a National Representative Survey HINTS</h3>
        <p>Jinmyoung Cho, PhD, Baylor Scott &amp; White Health, Temple, TX; and Y. Alicia Hong, PhD, Texas A&amp;M Health Science Center School of Public Health, College Station, TX</p>
    </div>
    <h3>Other ways to get HINTS at SBM</h3>
    <p>Be sure to stop by the NCI booth (#105) during the meeting to speak with our experts about HINTS and the research and initiatives supported by NCI&rsquo;s Behavioral Research Program.</p>
    <p>Can&rsquo;t make it to the meeting? Follow us on Twitter, as the <a href="https://twitter.com/NCIHINTS">@NCIHINTS</a> account will be live tweeting presentations throughout the meeting. Feel free to jump in the meeting conversation by using the hashtag #SBM2015. </p>
</asp:Content>


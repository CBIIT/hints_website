<%@ Page Title="Health Information National Trends Survey | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="Health Information National Trends Survey | HINTS" />
    <meta name="Description" content="HINTS collects data about the use of cancer and health-related information by the American public and provides it for free public use." />

    
    <link rel="stylesheet" href="/css/home.css">
    <link rel="stylesheet" href="/css/randomimages.css">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div
        id="carouselExampleSlidesOnly"
        class="carousel slide"
        data-ride="carousel">

        <div class="carousel-inner">
            <div class="carousel-item active" id="homeSlider">

                <div class="container carousel-caption d-block col-lg-12 col-xl-7 custom-wrapper">
                    <h2>What is HINTS?</h2>
                    <p class="col-lg-12 col-xl-12 pl-0">The Health Information National Trends Survey (HINTS) regularly collects nationally representative data about the American public's knowledge of, attitudes toward, and use of cancer- and health-related information. HINTS data are used by researchers to monitor changes in the rapidly evolving fields of health communication and health information technology. Insights from HINTS data can be used by advocates and practitioners to inform the development of effective health communication strategies for different populations.
                        <br />
                         <a  href="/about-hints/learn-more-about-hints.aspx" alt="learn more" class="rwb_learnmore slider-btn learn-more">Learn More</a>
                  
                         <a  href="/about-hints/announcements.aspx" alt="latest HINTS updates" class="rwb_latestupdate slider-btn learn-more">Latest HINTS Updates</a>

                         <a  href="/about-hints/contacted-by-hints.aspx" alt="Were You Contacted to Participate in HINTS?" class="rwb_participate slider-btn learn-more">Selected to Participate in HINTS?</a>

                    </p>
               
                       
                </div>
            </div>
        </div>
    </div>

    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">
                    <div class="row py-3 resources">
                        <div class="col-xs-12 col-sm-4 pd-r padding-025" id="res-box">
                            <div
                                class="rounded-0 shadow bg-white box pd-5 pd">
                                <div class="hint-ribbon">
                                    <img
                                        src="/images/hints-logo.png"
                                        alt="National Cancer Institute" />
                                </div>
                                <div class="card-content">
                                    <h3 class="font-weight-bold">Access HINTS Datasets</h3>
                                    <p>Public-use HINTS datasets are free to download and analyze. HINTS data are available in SAS, SPSS, and STATA formats (more recent datasets are also available in R).</p>
                                    <a href="/data/download-data.aspx" alt="download data" class="font-weight-bold">Download Data ></a>
                                    <hr />
                                    <p>Controlled access datasets, including geocoded HINTS datasets, the HINTS-SEER dataset, and HINTS Data Linkage Project datasets can be accessed by submitting a request through dbGap.</p>
                                    <a href="/data/controlled-access-data.aspx" alt="request controlled access data" class="font-weight-bold">Request Controlled Access Data ></a>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 pd-r padding-0" id="res-box">
                            <div
                                class="rounded-0 shadow bg-white box pd-5 pd">
                                <div class="hint-ribbon">
                                    <img
                                        src="/images/hints-logo.png"
                                        alt="National Cancer Institute" />
                                </div>
                                <div class="card-content">
                                    <h3 class="font-weight-bold">HINTS Briefs</h3>
                                    <p>HINTS <em>Briefs</em> summarize results from recent peer-reviewed journal articles that analyze HINTS data, providing context and highlighting how findings can inform practice.</p>
                                    <a href="/publications-reports/hints-briefs.aspx" alt="HINTS Briefs" class="font-weight-bold">View All Briefs ></a>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 pd-l" id="res-box">
                            <div
                                class="rounded-0 shadow bg-white box pd-5 pd">
                                <div class="hint-ribbon">
                                    <img
                                        src="/images/hints-logo.png"
                                        alt="National Cancer Institute" />
                                </div>
                                <div class="card-content">
                                    <h3 class="font-weight-bold">HINTS Electronic Codebook</h3>
                                    <p class="text-left">The HINTS <em>electronic codebook</em> provides basic descriptive data (e.g., frequencies, percentages, unweighted and weighted population values) and meta-data (e.g., variable names and labels) for HINTS items across all iterations. The codebook also includes interactive charts and graphs that can be downloaded and includes trend data at the item level.</p>
                                    <a href="/view-questions/all-hints-questions.aspx" alt="View HINTS Online Codebook" class="font-weight-bold">View HINTS Electronic Codebook ></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>


    <div class="container col-lg-12 col-xl-7 col mt-5 mb-5 custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">
                    <div class="position-absolute top-center top-md-left circle-color mt-n8 ml-md-n8">
                        <svg width="185" height="186" viewBox="0 0 185 186" fill="none" xmlns="http://www.w3.org/2000/svg">

                            <circle cx="4" cy="4" r="4" fill="currentColor"></circle>
                            <circle cx="22" cy="4" r="4" fill="currentColor"></circle>
                            <circle cx="42" cy="4" r="4" fill="currentColor"></circle>
                            <circle cx="62" cy="4" r="4" fill="currentColor"></circle>
                            <circle cx="82" cy="4" r="4" fill="currentColor"></circle>
                            <circle cx="102" cy="4" r="4" fill="currentColor"></circle>
                            <circle cx="122" cy="4" r="4" fill="currentColor"></circle>
                            <circle cx="142" cy="4" r="4" fill="currentColor"></circle>
                            <circle cx="162" cy="4" r="4" fill="currentColor"></circle>
                            <circle cx="180" cy="4" r="4" fill="currentColor"></circle>
                            <circle cx="4" cy="22" r="4" fill="currentColor"></circle>
                            <circle cx="22" cy="22" r="4" fill="currentColor"></circle>
                            <circle cx="42" cy="22" r="4" fill="currentColor"></circle>
                            <circle cx="62" cy="22" r="4" fill="currentColor"></circle>
                            <circle cx="82" cy="22" r="4" fill="currentColor"></circle>
                            <circle cx="102" cy="22" r="4" fill="currentColor"></circle>
                            <circle cx="122" cy="22" r="4" fill="currentColor"></circle>
                            <circle cx="142" cy="22" r="4" fill="currentColor"></circle>
                            <circle cx="162" cy="22" r="4" fill="currentColor"></circle>
                            <circle cx="180" cy="22" r="4" fill="currentColor"></circle>
                            <circle cx="4" cy="42" r="4" fill="currentColor"></circle>
                            <circle cx="22" cy="42" r="4" fill="currentColor"></circle>
                            <circle cx="4" cy="62" r="4" fill="currentColor"></circle>
                            <circle cx="22" cy="62" r="4" fill="currentColor"></circle>
                            <circle cx="4" cy="82" r="4" fill="currentColor"></circle>
                            <circle cx="22" cy="82" r="4" fill="currentColor"></circle>
                            <circle cx="4" cy="102" r="4" fill="currentColor"></circle>
                            <circle cx="22" cy="102" r="4" fill="currentColor"></circle>
                            <circle cx="4" cy="122" r="4" fill="currentColor"></circle>
                            <circle cx="22" cy="122" r="4" fill="currentColor"></circle>
                            <circle cx="4" cy="142" r="4" fill="currentColor"></circle>
                            <circle cx="22" cy="142" r="4" fill="currentColor"></circle>
                            <circle cx="4" cy="162" r="4" fill="currentColor"></circle>
                            <circle cx="22" cy="162" r="4" fill="currentColor"></circle>

                        </svg>


                        <h1 class="news-title">What's New</h1>
                    </div>
                    <div class="row news-block">
                        <!-- Card -->
                        <!-- DMJ - Jira 6828: HINTS Homepage Redesign -->
                        <!-- Remove Twitter/X widget and expand What's new card from col-md-8 to col-md-12 -->
                        <div class="box bg-white p-2 col-md-12 custom-shadow">
                            <div class="card-stack-item mb-9">
                                <div class="card card-lg rounded overflow-hidden p-4" style="transform: translateY(calc(0rem)) scale(1);">
                                    <div class="row no-gutters" style="opacity: 1;">
                                        <div class="card-body text-left">



                                            <!-- Heading -->
                                            <h4 class="font-family-open-sans mb-2 mt-auto font-weight-bold">HINTS Data Linkage Project 2024 (HDLP 2024)</h4>

                                            <!-- Text -->
                                            <p>
                                               The HINTS Data Linkage Project 2024 (HDLP 2024) contains HINTS 7 (2024; n = 7,278) data merged with numerous external variables to support the analysis of linked data and enhance the types of analyses and corresponding research questions that can be answered with HINTS data.
                                            </p>

                                            <!-- Link -->
                                            <a class="h6 text-decoration-none mt-auto" href="/data/download-data.aspx#HDLP24">Request Access to HDLP 2024 ></a>
                                            <hr>



                                                                    <!-- Heading -->
                                            <h4 class="font-family-open-sans mb-2 mt-auto font-weight-bold">HINTS 7 (2024) public use data available for download
                                            </h4>

                                            <!-- Text -->
                                            <p>
                                            Our newest public use dataset, HINTS 7 (2024), is now available for download.
                                            </p>

                                            <!-- Link -->
                                            <a class="h6 text-decoration-none mt-auto" href="/data/download-data.aspx">Download Data ></a>
                                            <hr>





                                    <%--  De-Shunda Jones: 3/17/2024 Commenting out for now. Will include something new in this area later   --%>
                                   <%--         <!-- Heading -->
                                            <h4 class="font-family-open-sans mb-2 mt-auto font-weight-bold">2023 HINTS Data Users Conference</h4>

                                            <!-- Text -->
                                            <p>
                                               Access information and materials from the 2023 HINTS Data Users Conference, which happened September 21-22, 2023 in Bethesda, MD.
                                            </p>

                                            <!-- Link -->
                                            <a class="h6 text-decoration-none mt-auto" href="/meetings-trainings/hints-data-users-conferences.aspx">Visit page ></a>
                                            <hr>--%>








                                            <!-- Heading -->
                                            <h4 class="font-family-open-sans mb-2 mt-auto font-weight-bold">Sign Up for HINTS Updates
                                            </h4>

                                            <!-- Text -->
                                            <p>
                                                <a class="h6 text-decoration-none mt-auto" href="/subscribe/default.aspx">Sign up to get updates</a> on the latest HINTS data releases, publications, and website features.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>


    
    <div class="container col-lg-12  col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                
                <div class="col-md-8">

                <%--***** Random image wrapper VVVVVVV--%>
                <div class=" pd-r padding-025  rwbrnd_wrapper">
                    <div class="rounded-0 shadow bg-white box pd-5 pd">
                        <div class="hint-ribbon">
                            <img
                                src="/images/hints-logo.png"
                                alt="National Cancer Institute" />
                        </div>


                        <%--***** Random image card VVVVVVV--%>
                        <div class="card-content rwbrndmDiv">
                            <h3 class="font-weight-bold">HINTS Data Insight </h3>
                            <p class="randomImageText">How often did doctors, nurses, or other healthcare professionals involve you in decisions about your health care as much as you wanted? HINTS 7 (2024)</p>
                            <img src="/_images/randomimages/Random1_800.jpg" width="100%" alt="Chart Results for question">
                            <a href="https://hints.cancer.gov/view-questions/question-detail.aspx?PK_Cycle=15&qid=720" alt="View Question" class="font-weight-bold">View Question ></a>
                        </div>
                        <%--***** Random image card ^^^^^^^^^^^--%>
                    </div>
                </div>


                <%--***** Random image wrapper ^^^^^^^^^^^^^^^--%>

                    </div>
                
                <div class="col-md-4">



                               <div class=" pd-r padding-025">
                            <div
                                class="rounded-0 shadow bg-white box pd-5 pd">
                                <div class="hint-ribbon">
                                    <img
                                        src="/images/hints-logo.png"
                                        alt="National Cancer Institute" />
                                </div>
                                <div class="card-content">
                                    <h3 class="font-weight-bold">Were You Contacted to Participate in HINTS?</h3>
                                 
                            <p>Click below to learn more about the HINTS survey, why your participation matters, and who to contact with questions.</p>
                                    <a href="/about-hints/contacted-by-hints.aspx" alt="download data" class="font-weight-bold">Details ></a>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </section>
    </div>







    

        <%--Hiding breadcrumbs on this page--%>
    <script type="text/javascript">
        $("#breadcrumbs").hide();
    </script>

    
        <script src="/_scripts/randomimages.js"></script>

</asp:Content>



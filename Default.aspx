<%@ Page Title="Health Information National Trends Survey | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="Health Information National Trends Survey | HINTS" />
    <meta name="Description" content="HINTS collects data about the use of cancer and health-related information by the American public and provides it for free public use." />

    
    <link rel="stylesheet" href="/css/home.css">
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
                    <p class="col-lg-12 col-xl-12 pl-0">The Health Information National Trends Survey (HINTS) regularly collects nationally representative data about the American public’s knowledge of, attitudes toward, and use of cancer- and health-related information. HINTS data are used to monitor changes in the rapidly evolving fields of health communication and health information technology and to create more effective health communication strategies across different populations.
                        <br />
                         <a  href="/about-hints/learn-more-about-hints.aspx" alt="learn more" class="rwb_learnmore slider-btn learn-more">Learn More</a>
                  
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
                                    <h3 class="font-weight-bold">Download Data</h3>
                                    <p>Nationally representative HINTS data are free to download and analyze. HINTS data are available in SAS, SPSS, and STATA formats.</p>
                                    <a href="/data/download-data.aspx" alt="download data" class="font-weight-bold">Download Data ></a>
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
                                    <p>HINTS <em>Briefs</em> provide a snapshot of noteworthy, data-driven HINTS research findings. Many <em>Briefs</em> summarize research findings from recent peer-reviewed journal articles using HINTS data.</p>
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
                                    <h3 class="font-weight-bold">HINTS Items</h3>
                                    <p class="text-left">The HINTS <em>online codebook</em> provides summary data for HINTS items across all cycles, including estimated U.S. population values, interactive data visualizations, and the ability to look at trend data over time at the item level. </p>
                                    <a href="/view-questions-topics/all-hints-questions.aspx" alt="View HINTS Online Codebook" class="font-weight-bold">View HINTS Online Codebook></a>
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
                        <div class="box bg-white p-2 col-md-8 custom-shadow">
                            <div class="card-stack-item mb-9">
                                <div class="card card-lg rounded overflow-hidden p-4" style="transform: translateY(calc(0rem)) scale(1);">
                                    <div class="row no-gutters" style="opacity: 1;">
                                        <div class="card-body text-left">


                                            <!-- Heading -->
                                            <h4 class="font-family-open-sans mb-2 mt-auto font-weight-bold">HINTS 5, Cycle 3 (2019) Data Now Available
                                            </h4>

                                            <!-- Text -->
                                            <p>
                                                Our newest public use dataset, HINTS 5, Cycle 3 (2019), is now available for download in SPSS, SAS, and STATA formats.
                                            </p>

                                            <!-- Link -->
                                            <a class="h6 text-decoration-none mt-auto" href="/data/download-data.aspx">Access Data >
                                            </a>
                                            <hr>
                                            <!-- Heading -->
                                            <h4 class="font-family-open-sans mb-2 mt-auto font-weight-bold">Explore How to Merge HINTS Data
                                            </h4>

                                            <!-- Text -->
                                            <p>
                                               Learn how to merge HINTS data for statistical analysis in a series of videos.
                                            </p>

                                            <!-- Link -->
                                            <a class="h6 text-decoration-none mt-auto" href="/meetings-trainings/how-to-merge-hints-data.aspx">Learn More >
                                            </a>
                                            <hr>
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
                        <div class="box col-md-4 text-right twitter-stats">
                            <h3 class="font-family-open-sans font-weight-bold mt-5">Our Latest Tweets</h3>
<%--                            <ul>
                                <li>
                                    <span class="font-family-open-sans" style="font-size: 18px;">Want to learn more about HINTS data? Check out our How-To HINTS webinar online at</span><br>
                                    <a class="h6 text-decoration-none mt-auto" href="https://buff.ly/2S4vENi">https://buff.ly/2S4vENi</a>
                                </li>
                                <li>
                                    <span class="font-family-open-sans" style="font-size: 18px;">Want to learn more about HINTS data? Check out our How-To HINTS webinar online at</span><br>
                                    <a class="h6 text-decoration-none mt-auto" href="https://buff.ly/2S4vENi">https://buff.ly/2S4vENi</a>
                                </li>
                                <li>
                                    <span class="font-family-open-sans" style="font-size: 18px;">Want to learn more about HINTS data? Check out our How-To HINTS webinar online at</span><br>
                                    <a class="h6 text-decoration-none mt-auto" href="https://buff.ly/2S4vENi">https://buff.ly/2S4vENi</a>
                                </li>
                            </ul>--%>


                                     <div id="hints-tweets"></div>

                
                            <a target="_blank" href="https://twitter.com/NCIHINTS" class="h4 text-decoration-none mt-auto font-weight-bold">Visit our Twitter page >></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
                <div class="rwb_contactby btn-updated-dark ">
                            <p ><a  href="/about-hints/contacted-by-hints.aspx">Were you contacted to participate in HINTS?</a></p>
                            </div>


    
    <script type="text/javascript" src='/_scripts/twitterFetcher_min.js'></script>

        <%--Hiding breadcrumbs on this page--%>
    <script type="text/javascript">
        $("#breadcrumbs").hide();
    </script>


    
    <script type="text/javascript">
        window.onload = function () {
            var anchors = document.getElementById('hints-tweets').getElementsByTagName('a');
            for (var i = 0; i < anchors.length; i++) {
                anchors[i].setAttribute('target', '_blank');
            }
        }


        
        $(document).ready(function() {


            function StripDeliminators(strString, strToStrip) {
                while (strString.indexOf(strToStrip) >= 0) {
                    strString = strString.replace(strToStrip, " ");
                }
                return strString
            }

            var configProfile = {
                "profile": { "screenName": 'NCIHINTS' },
                "domId": 'hints-tweets',
                "maxTweets": 1,
                "enableLinks": true,
                "showUser": false,
                "showTime": true,
                "showImages": false,
                "lang": 'en'
            };
            twitterFetcher.fetch(configProfile);




        });

    </script>


</asp:Content>


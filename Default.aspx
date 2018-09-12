<%@ Page Title="Health Information National Trends Survey | HINTS" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="Health Information National Trends Survey | HINTS" />
    <meta name="Description" content="HINTS collects data about the use of cancer and health-related information by the American public and provides it for free public use." />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="grid">



        <div class="col_5">
            <div id="homepage_carousel" class="flexslider col_6">
                <ul class="slides">
                    
                    <li data-thumbcaption="Due to hurricane Florence, the HINTS Data  Users Conference has been cancelled." data-thumb="/_images/carousel/NCI_HINTS_Carousel_Registrations_and_Abstract_thumb.jpg">
                        <a href="/about-hints/announcements.aspx">
                            <img alt="Due to hurricane Florence, the HINTS Data  Users Conference has been cancelled." src="/_images/carousel/NCI_HINTS_Carousel_Registrations_and_Abstract.jpg" />
                        </a>
                        <p class="flex_caption">Due to hurricane Florence, <strong><u>the HINTS Data  Users Conference has been cancelled</u></strong>.</p>
                    </li>

                    
                    <li data-thumbcaption="HINTS Brief 35: Lost in Transition? Cancer Survivorship and Patient-Centered Communication" data-thumb="/_images/carousel/NCI_HINTS_DCCPS_Brief35_thumb.jpg">
                        <a href="/docs/Briefs/HINTS_Brief_35.pdf ">
                            <img alt="HINTS Brief 35: Lost in Transition? Cancer Survivorship and Patient-Centered Communication" src="/_images/carousel/NCI_HINTS_DCCPS_Brief35.jpg" />
                        </a>
                        <p class="flex_caption">HINTS Brief 35: Lost in Transition? Cancer Survivorship and Patient-Centered Communication</p>
                    </li>

                    
                    <li data-thumbcaption="Using Calorie Information on Restaurant Menus" data-thumb="/_images/carousel/NCI_HINTS_DCCPS_calorieuse_thumb.jpg">
                        <a href="/docs/Briefs/HINTS_Brief_34.pdf ">
                            <img alt="Using Calorie Information on Restaurant Menus" src="/_images/carousel/NCI_HINTS_DCCPS_calorieuse.jpg" />
                        </a>
                        <p class="flex_caption">HINTS May Data Focus</p>
                    </li>


                    <li data-thumbcaption="New HINTS 5, Cycle 1 and HINTS-FDA, Cycle 2 Data Now Available for Download" data-thumb="/_images/carousel/NCI_HINTS_DCCPS_Hints5Cycle1_thumb.jpg">
                        <a id="hints_download_carousel" runat="server" href="~/data/download-data.aspx">
                            <img alt="New HINTS 5, Cycle 1 and HINTS-FDA, Cycle 2 Data Now Available for Download" src="/_images/carousel/NCI_HINTS_DCCPS_Hints5Cycle1.jpg" /></a>
                        <p class="flex_caption">New HINTS 5, Cycle 1 and HINTS-FDA, Cycle 2 Data Now Available for Download</p>
                    </li>












                </ul>
            </div>

            <div class="homepage_boxes">
                <div class="col_4">
                    <div id="hintsbox1">
                        <img alt="What is HINTS?" src="/_images/greenpeople2.jpg" />
                        <h2>What is HINTS?</h2>
                        <p>HINTS collects data about the use of cancer-related information by the American public. These data provide opportunities to understand and improve health communication. <a href="/about-hints/learn-more-about-hints.aspx">Read More ></a></p>
                        <h2>Get and Use HINTS Data</h2>
                        <p>Download publically available, nationally representative HINTS data for your next secondary analysis. <a id="hints_access_data" runat="server" href="~/data/download-data.aspx">Access Data ></a><a id="hints_access_data_NoJs" runat="server" href="~/terms.aspx">Access Data ></a></p>
                        <h2>Sign Up for HINTS Updates</h2>
                        <p><a href="/subscribe/default.aspx">Sign up to get updates</a> on the latest HINTS data releases, publications, and website features.</p>
                    </div>
                </div>

                <div class="col_2">
                    <div class="topic_header">
                        <img alt="Twitter" src="/_images/twitter-bird_transparent.gif" /><p>Our Latest Tweets</p>
                    </div>
                    <div class="topic_list">
                        <ul>
                            <div class="twitter">
                                <div id="hints-tweets"></div>
                            </div>
                            <p id="visitTwitter"><a href="https://twitter.com/NCIHINTS" class="readmorelink" target="_blank">Visit our Twitter page ></a></p>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
        <!--Closes col_5-->

        <div class="col_1">
            <div id="smbox">
                <h2>Social Media</h2>
                <div id="smlinks">
                    <a href="http://www.twitter.com/NCIHINTS" target="_blank">
                        <img alt="Twitter" class="smimage" src="/_images/twitter.png" /></a>
                    <img alt="Share" class="smimage smbackground" src="/_images/shareplus.png" />
                    <img alt="Email" class="smimage smbackground" src="/_images/email.png" />
                    <div class="addthis_sharing_toolbox"></div>

                    <!-- 2 images above act as backgrounds so the icons appear imediatly when addthis is loading -->
                </div>
            </div>
            <div id="submitPubs">
                <h2>New HINTS Publication?</h2>
                <div id="submitPubsBtn"><a href="/publications-reports/submit-hints-publication.aspx">Submit Here</a></div>
            </div>
            <div id="newsbox">
                <h2>What's New</h2>

                <p><a href=" /about-hints/announcements.aspx">HINTS Data Users Conference Cancelled</a></p>
               
                
                
                 <p><a href="/about-hints/announcements.aspx#hints51Data">New HINTS data available for download!</a></p>
               
                
                 <%--<p class="newsdate">November 8, 2017</p>--%>

                  <%--        <p><a target="_blank" href="https://www.scgcorp.com/HINTSConference2018/">Save the Date: The Fifth HINTS Data Users Conference</a></p>
      <p class="newsdate">November 7, 2017</p>--%>

                <p><a href="/about-hints/announcements.aspx#Jul2017">Check out the HINTS-ASL Project</a></p>
             <%--   <p class="newsdate">July 19, 2017</p>--%>
                
                  <%--   
                
                <p><a href="/about-hints/announcements.aspx#Nov2016">Help spread the word about HINTS-FDA!</a></p>
                <p class="newsdate">November  16, 2016</p>

                <p><a href="/about-hints/announcements.aspx#Sept2016_webinar">How-To HINTS: A Practical Workshop</a></p>
                <p class="newsdate">September  21, 2016</p>
                      
            <p><a href="/about-hints/announcements.aspx#June2016_FDA">New HINTS Data Now Available</a></p>
            <p class="newsdate">June  29, 2016</p>  

            <p><a href="/subscribe/default.aspx">Sign up to get updates on the latest HINTS</a></p>
            <p class="newsdate">May  13, 2016</p>      

            <p><a href="/about-hints/announcements.aspx#May2016_infographics">New HINTS Infographics Now Available</a></p>
            <p class="newsdate">May  13, 2016</p>      


         
            <p><a href="/about-hints/announcements.aspx#APHA2015">Catch HINTS at APHA 2015!</a></p>
            <p class="newsdate">November 3, 2015</p>      



            <p><a href="/about-hints/announcements.aspx#PLOS">HINTS Featured in Post on Social Inequalities in Cancer Information Seeking</a></p>
            <p class="newsdate">October 12, 2015</p>

            <p><a href="/about-hints/announcements.aspx#newsocialmediaresources">New Social Media Resources for Students and Educators</a></p>
            <p class="newsdate">August 14, 2015</p>

            <p><a href="/about-hints/announcements.aspx#hintsvisitguam">HINTS Visits Guam!</a></p>
            <p class="newsdate">August 4, 2015</p>
            

          <p><a href="/about-hints/announcements.aspx#downloadandshareinfographics">Download and Share HINTS Infographic and Infocards</a></p>
            <p class="newsdate">July 16, 2015</p>      
                --%>

                <h3 id="currentbriefs">Current HINTS Briefs</h3>

                <asp:Repeater ID="RPTR_Briefs" runat="server">
                    <ItemTemplate>
                        <a class="twobriefs" runat="server" target="_blank" href='<%# Eval("LinkURL") %>'><%# Eval("Title") %></a>
                        <br />
                        <p class="newsdate">
                            <%# Eval("PubMonthEnglish")%>  <%# Eval("PubYear")%>
                          (<%# GetFileSize(Eval( "LinkURL" ))%>)
                        </p>
                    </ItemTemplate>
                </asp:Repeater>

                <p><a class="rm" href="/publications-reports/hints-briefs.aspx">View All Briefs ></a></p>

            </div>
        </div>

    </div>
    <link rel="stylesheet" href='<%=Me.ResolveUrl("~/_css/flexslider.css?v=2017_11_13")%>' type="text/css" />

    <script type="text/javascript" language="javascript">
        $(document).ready(function () {

            //toggle the links depending on JS turned on
            $('#hints_access_data_NoJs').css('display', 'none');
            $('#hints_access_data').css('display', 'block');
            $('#hints_download_carousel').css('display', 'block');


            checkCookie(); // see if cookies are enabled, force to page if so
            
            function checkCookie() {
                var cookieEnabled = navigator.cookieEnabled;
                if (!cookieEnabled) {
                    document.cookie = "TermsAccepted";
                    cookieEnabled = document.cookie.indexOf("TermsAccepted") != -1;
                }
                return cookieEnabled || showCookieFail();
            }


            function showCookieFail() {
                $('#hints_access_data_NoJs').css('display', 'block');
                $('#hints_access_data').css('display', 'none');
                $('#hints_download_carousel').css('display', 'none');
            }
        });



   
    </script>


    <script type="text/javascript" src='<%=me.ResolveUrl("~/_scripts/jquery.flexslider-min.js")%>'></script>
    <script type="text/javascript" src='<%=me.ResolveUrl("~/_scripts/carousel.js")%>'></script>
    <script type="text/javascript" src='<%=me.ResolveUrl("~/_scripts/twitter_2017_07_12.js")%>'></script>
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


            $('img').each(function () {
                var $img = $(this);
                var filename = $img.attr('src')
                var alttext = $img.attr('alt')

                if ((filename.indexOf("/_images/carousel/") == 0) && (filename.indexOf("_thumb") >= 1)) {
                    //console.log('----' + filename);
                    //console.log(filename.indexOf("/_images/carousel/"));
                    //console.log(filename.indexOf("_thumb"));
                    if (typeof attr == typeof undefined || attr == false) {
                        alttext = filename.substring(0, filename.lastIndexOf('.'));
                        alttext = alttext.replace("/_images/carousel/", "");
                        alttext = alttext.replace("_thumb", "");
                        alttext = StripDeliminators(alttext, "_")
                        $img.attr('alt', alttext);
                    }
                }

            });
        });

    </script>



</asp:Content>

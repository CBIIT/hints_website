<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href='<%=Me.ResolveUrl("~/_css/flexslider.css?v=2017_06_20")%>' type="text/css" />
    <script type="text/javascript" src='<%=me.ResolveUrl("~/_scripts/jquery.flexslider.js")%>'></script>
    <script type="text/javascript" src ='<%=me.ResolveUrl("~/_scripts/carousel.js")%>'></script>
    <script type="text/javascript" src ='<%=me.ResolveUrl("~/_scripts/twitter_2017_07_12.js")%>'></script>

    <script type="text/javascript" language="javascript">
        $(document).ready(function () {

            //toggle the links depending on JS turned on
            $('#hints_access_data_NoJs').css('display', 'none');
            $('#hints_access_data').css('display', 'block');
            $('#hints_download_carousel').css('display', 'block');


        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


<div class="grid">

    

    <div class="col_5">
    <div id="homepage_carousel" class="flexslider col_6" >
        <ul class="slides">
            <li data-thumbcaption="New HINTS-FDA Data Now Available for Download!" data-thumb="_images/carousel/NCI_HINTS_DCCPS_web_banner_v2.jpg">
                <a id="hints_download_carousel" runat="server" href ="~/terms.aspx">
                     <img alt="HINTS 4, Cycle 4 Data Now Available for Download!" src="_images/carousel/NCI_HINTS_DCCPS_web_banner_v2.jpg" /></a>
                <p class="flex_caption">New HINTS-FDA Data Now Available for Download!</p>
            </li>            
            <li data-thumbcaption="New HINTS Infocards and Infographics Now Available" data-thumb="_images/carousel/NCI_HINTS_Carousel_CigarettesHarm.jpg">
               <a href="/announcements.aspx#Nov2016 "> <img alt="New HINTS Infocards and Infographics Now Available" src="_images/carousel/NCI_HINTS_Carousel_CigarettesHarm.jpg" /> </a>
                <p class="flex_caption">New HINTS Infocards and Infographics Now Available</p>
            </li>
            <li data-thumbcaption="Brief 32: Men Not Adequately Involved in Discussions About Prostate Cancer Screening" data-thumb="_images/carousel/NCI_HINTS_Carousel_Brief32.jpg">
               <a href="/docs/Briefs/HINTS_Brief_32.pdf "> <img alt="Brief 32: Men Not Adequately Involved in Discussions About Prostate Cancer Screening" src="_images/carousel/NCI_HINTS_Carousel_Brief32.jpg" /> </a>
                <p class="flex_caption">Brief 32: Men Not Adequately Involved in Discussions About Prostate Cancer Screening</p>
            </li>
            <li data-thumbcaption="HINTS Data Spotlight: Health Communication" data-thumb="_images/carousel/NCI_HINTS_Carousel_InternetHealthInfo.jpg">
               <a href="/advanced.aspx?tpc=9 "> <img alt="HINTS Data Spotlight: Health Communication" src="_images/carousel/NCI_HINTS_Carousel_InternetHealthInfo.jpg" /> </a>
                <p class="flex_caption">HINTS Data Spotlight: Health Communication</p>
            </li>
        </ul>
    </div>

    <div class="homepage_boxes"> 
        <div class="col_4">
        <div id="hintsbox1"> 
            <img alt="What is HINTS?" src="_images/greenpeople2.png" />
            <h2>What is HINTS?</h2> 
            <p>HINTS collects data about the use of cancer-related information by the American public. These data provide opportunities to understand and improve health communication. <a href="about.aspx">Read More ></a></p>
            <h2>Get and Use HINTS Data</h2> 
            <p>Download publically available, nationally representative HINTS data for your next secondary analysis. <a id="hints_access_data" runat="server" href ="~/terms.aspx">Access Data ></a><a id="hints_access_data_NoJs" runat="server" href ="~/terms.aspx">Access Data ></a></p>
         <h2>Sign Up for HINTS Updates</h2> 
            <p> <a href="/subscribe/default.aspx">Sign up to get updates</a> on the latest HINTS data releases, publications, and website features.</p>
        </div>  
        </div>

       <div class="col_2">
       <div class="topic_header"><img alt="Twitter" src="_images/twitter-bird.png" /><p>Our Latest Tweets</p></div>
       <div class="topic_list"> 
            <ul>   
                <div class="twitter"><div id="hints-tweets"></div></div>
                <p id="visitTwitter"><a href="https://twitter.com/NCIHINTS" class="readmorelink" target="_blank">Visit our Twitter page ></a></p>
            </ul>
        </div>
        </div>
        </div>

    </div><!--Closes col_5-->

    <div class="col_1">
        <div id="smbox">
            <h2>Social Media</h2>
            <div id="smlinks">
                <a href="http://www.twitter.com/NCIHINTS" target="_blank"><img alt="Twitter" class="smimage" src="_images/twitter.png" /></a>
                <img alt="Share" class="smimage smbackground" src="_images/shareplus.png" />
                <img alt="Email" class="smimage smbackground" src="_images/email.png" />
                <div class="addthis_sharing_toolbox"></div>
                
                                <!-- 2 images above act as backgrounds so the icons appear imediatly when addthis is loading -->
            </div>
        </div>
        <div id="submitPubs">
            <h2>New HINTS Publication?</h2>
            <div id="submitPubsBtn"><a href="inform_us.aspx">Submit Here</a></div>
        </div>
        <div id="newsbox">
            <h2>What's New</h2>
            
            <p><a href="/announcements.aspx#Jul2017">Check out the HINTS-ASL Project</a></p>
            <p class="newsdate">July 19, 2017</p>  
            <p><a href="/announcements.aspx#Nov2016">Help spread the word about HINTS-FDA!</a></p>
            <p class="newsdate">November  16, 2016</p>  

            <p><a href="/announcements.aspx#Sept2016_webinar">How-To HINTS: A Practical Workshop</a></p>
            <p class="newsdate">September  21, 2016</p>  
      <%--           
            <p><a href="/announcements.aspx#June2016_FDA">New HINTS Data Now Available</a></p>
            <p class="newsdate">June  29, 2016</p>  

            <p><a href="/subscribe/default.aspx">Sign up to get updates on the latest HINTS</a></p>
            <p class="newsdate">May  13, 2016</p>      

            <p><a href="/announcements.aspx#May2016_infographics">New HINTS Infographics Now Available</a></p>
            <p class="newsdate">May  13, 2016</p>      


         
            <p><a href="/announcements.aspx#APHA2015">Catch HINTS at APHA 2015!</a></p>
            <p class="newsdate">November 3, 2015</p>      



            <p><a href="/announcements.aspx#PLOS">HINTS Featured in Post on Social Inequalities in Cancer Information Seeking</a></p>
            <p class="newsdate">October 12, 2015</p>

            <p><a href="/announcements.aspx#newsocialmediaresources">New Social Media Resources for Students and Educators</a></p>
            <p class="newsdate">August 14, 2015</p>

            <p><a href="/announcements.aspx#hintsvisitguam">HINTS Visits Guam!</a></p>
            <p class="newsdate">August 4, 2015</p>
            

          <p><a href="/announcements.aspx#downloadandshareinfographics">Download and Share HINTS Infographic and Infocards</a></p>
            <p class="newsdate">July 16, 2015</p>      
--%>

            <h3 id="currentbriefs">Current HINTS Briefs</h3>

              <asp:Repeater id="RPTR_Briefs" runat="server">
                  <ItemTemplate>
                     <a class="twobriefs" runat="server" target="_blank" href= '<%# Eval("LinkURL") %>'> <%# Eval("Title") %></a> <br/>       
                     <p class="newsdate"><%# Eval("PubMonthEnglish")%>  <%# Eval("PubYear")%>
                          (<%# GetFileSize(Eval( "LinkURL" ))%>) </p>
                  </ItemTemplate>
                </asp:Repeater>

            <p><a class="rm" href="briefs.aspx">View All Briefs ></a></p>

        </div>
    </div>

</div>

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
    </script>



</asp:Content>

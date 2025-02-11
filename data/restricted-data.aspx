<%@ Page Title="Request Restricted HINTS Datasets | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="restricted-data.aspx.vb" Inherits="data_restricted_data" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="Request Restricted HINTS Datasets | HINTS" />
    <meta name="Description" content="Request restricted-use HINTS datasets that contain geocodes and suppressed variables using the form found on this page." />


    <link rel="stylesheet" href="/css/questions.css?v=2020_05_28">
    <link rel="stylesheet" href="/css/restricteddata.css?v=2022_01_11">
    <link rel="stylesheet" href="/css/hpot.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">


                    <asp:PlaceHolder ID="PLC_form" runat="server">


                        <h1>Request Restricted HINTS Datasets</h1>
                        <p>In order to request a restricted-use dataset that contains geocodes and suppressed variables (see table at bottom of page for details on these variables) or restricted-use-only dataset files, please either fill out and submit the interactive form below or fill out the <a href="/docs/HINTS_Restricted_Data_Request_Form_2024.pdf" target="_blank">Restricted Data Request Form</a> and email it to <a href="mailto:NCIHINTS@mail.nih.gov">NCIHINTS@mail.nih.gov</a> for review.</p>
                      
                        <p>1. Which iteration(s) of the HINTS restricted use data are you requesting? (check all that apply)</p>

                        <div class="dv_question">
                            <asp:CheckBoxList summary="Layout for Cycles" ID="CKLIst_Cyle" DataTextField="cycleyear" DataValueField="cycleyear"
                                runat="server" RepeatColumns="2" RepeatDirection="Vertical">
                            </asp:CheckBoxList>
                        </div>


                        <div class="FormItemWrapper">
                            <div class="FormLeftItem">
                                <asp:Label ID="Label1" AssociatedControlID="txtproject" runat="server" Text="2. Briefly describe your project including a title, and research questions/objectives or hypotheses."></asp:Label>
                            </div>
                            <div class="FormRightItem">
                                <asp:TextBox ValidationGroup="grp_restform" ID="txtproject" runat="server" Rows="10" TextMode="MultiLine" CssClass="MultiLineTextBox_75"></asp:TextBox>

                                <asp:RegularExpressionValidator ID="rgConclusionValidator2"  ForeColor="Red"
                                ControlToValidate="txtproject" ValidationGroup="grp_restform" ErrorMessage="<br/>Answers can't exceed 1000 characters"
                                ValidationExpression="^[\s\S]{0,1000}$" runat="server" Display="dynamic"  SetFocusOnError="true" />
                            </div>
                            <br />
                        </div>


                        <div class="FormItemWrapper">
                            <div class="FormLeftItem">
                                <asp:Label ID="Label2" AssociatedControlID="txt_variables" runat="server" Text="3. Please list your main independent and dependent variables."></asp:Label>
                            </div>
                            <div class="FormRightItem">
                                <asp:TextBox ID="txt_variables" runat="server" Rows="10" TextMode="MultiLine" CssClass="MultiLineTextBox_75"></asp:TextBox>
                                
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  ForeColor="Red"
                                ControlToValidate="txt_variables" ValidationGroup="grp_restform" ErrorMessage="<br/>Answers can't exceed 1000 characters"
                                ValidationExpression="^[\s\S]{0,1000}$" runat="server" Display="dynamic"  SetFocusOnError="true" />
                            </div>
                            <br />
                        </div>





                        <div class="FormItemWrapper">
                            <div class="FormLeftItem">
                                <asp:Label ID="Label3" AssociatedControlID="txt_analyticplan" runat="server" Text="4. Describe your analytic plan. What type of statistical tests do you plan to employ? How do you plan to incorporate the restricted variables including any linking variables? How are these related to your research questions/objectives or hypotheses?"></asp:Label>
                            </div>
                            <div class="FormRightItem">
                                <asp:TextBox ID="txt_analyticplan" runat="server" Rows="10" TextMode="MultiLine" CssClass="MultiLineTextBox_75"></asp:TextBox>
                                
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2"  ForeColor="Red"
                                ControlToValidate="txt_analyticplan" ValidationGroup="grp_restform" ErrorMessage="<br/>Answers can't exceed 1000 characters"
                                ValidationExpression="^[\s\S]{0,1000}$" runat="server" Display="dynamic"  SetFocusOnError="true" />
                            </div>
                            <br />
                        </div>




                        <div class="FormItemWrapper">
                            <div class="FormLeftItem">
                                <asp:Label ID="Label4" AssociatedControlID="txt_smallmissing" runat="server" Text="5. Describe your plan for addressing potentially small (n=&lt;25) or missing data cells in order to either reduce disclosure risk, increase precision, or both — e.g., will you collapse across categories or suppress certain results? Do you anticipate any concerns with statistical power, i.e., having enough sample size to detect differences when they exist, and if so, what adjustments will you make, if any? Please elaborate."></asp:Label>
                            </div>
                            <div class="FormRightItem">
                                <asp:TextBox ID="txt_smallmissing" runat="server" Rows="10" TextMode="MultiLine" CssClass="MultiLineTextBox_75"></asp:TextBox>
                                               
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3"  ForeColor="Red"
                                ControlToValidate="txt_smallmissing" ValidationGroup="grp_restform" ErrorMessage="<br/>Answers can't exceed 1000 characters"
                                ValidationExpression="^[\s\S]{0,1000}$" runat="server" Display="dynamic"  SetFocusOnError="true" />
                            </div>
                            <br />
                        </div>



                        <div class="FormItemWrapper">
                            <div class="FormLeftItem">
                                <asp:Label ID="Label5" AssociatedControlID="txt_geocodes" runat="server" Text="6. If you are utilizing the geocodes, describe your plan for how you will incorporate these variables — e.g., are you planning to use the geocodes as individual categories, or are you using them as linking variables to other data? If the latter, to which data will you be linking?"></asp:Label>
                            </div>
                            <div class="FormRightItem">
                                <asp:TextBox ID="txt_geocodes" runat="server" Rows="10" TextMode="MultiLine" CssClass="MultiLineTextBox_75"></asp:TextBox>
                                
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4"  ForeColor="Red"
                                ControlToValidate="txt_geocodes" ValidationGroup="grp_restform" ErrorMessage="<br/>Answers can't exceed 1000 characters"
                                ValidationExpression="^[\s\S]{0,1000}$" runat="server" Display="dynamic"  SetFocusOnError="true" />
                            </div>
                            <br />
                        </div>


                        <div class="FormItemWrapper">
                            <div class="FormLeftItem">
                                <p>7. If your request is approved, to whom should the data be sent?</p>
                            </div>
                            <div class="FormRightItem">
                                <p>
                                    <asp:Label AssociatedControlID="txt_Name" ID="Label6" runat="server" Text="Name:"></asp:Label>&nbsp;
                                    <asp:TextBox ID="txt_Name" runat="server"></asp:TextBox>
                                </p>
                                <p>
                                    <asp:Label AssociatedControlID="txt_email" ID="Label7" runat="server" Text="Email Address:"></asp:Label>&nbsp;
                                    <asp:TextBox ID="txt_email" ValidationGroup="grp_restform" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="grp_restform" ID="RequiredFieldValidator_txtemail" runat="server" ControlToValidate="txt_email"
                                        ErrorMessage="Required Field" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="grp_restform" ID="RegularExpressionValidator_txtemail" runat="server" ControlToValidate="txt_email"
                                        Display="dynamic" ErrorMessage="Please enter a valid e-mail." ForeColor="Red"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Width="250"></asp:RegularExpressionValidator>
                                </p>

                                <div class="restricteddiv_wrapper">
                                    <div class="divleft">
                                        <p>Preferred Data Format (SAS, SPSS, STATA):</p>

                                    </div>
                                    <div class="divright">
                                        <asp:CheckBox ID="CK_SAS" Text="SAS" runat="server" /><br />
                                        <asp:CheckBox ID="CK_SPSS" Text="SPSS" runat="server" /><br />
                                        <asp:CheckBox ID="CK_STATA" Text="STATA" runat="server" /><br />

                                    </div>
                                </div>


                            </div>
                            <br />
                        </div>

                        <div class="rwbtrickery">
                            <asp:TextBox autocomplete="new-password" ID="rwbNotEmail" TabIndex="-1" Text="" runat="server" />
                            <label class="sr-only" for="rwbNotEmail">This is for bot prevention; leave this field blank</label>
                        </div>




                        <div class="FormItemWrapper">
                            <div class="FormLeftItem">
                                <asp:CheckBox ID="chkAcceptTerm_SinglePage" runat="server" />
                                <asp:Label CssClass="marginleft_5px" ID="Label8" runat="server" AssociatedControlID="chkAcceptTerm_SinglePage" Text="Sign up for email updates about HINTS "></asp:Label>
                                <br />
                                <br />
                            </div>
                        </div>


                        <div class="dv_controls">
                            <div>
                                <asp:Button ID="BTN_SubmitRestrictedData" ValidationGroup="grp_restform" class="btn-updated-dark" runat="server" Text="Submit" />
                            </div>
                        </div>

                        <h2 class="restricteddata_clearboth">Examples of Geocodes and Suppressed Variables</h2>

                        <img src="/_images/restricteddata.png" alt="Request Restricted HINTS Datasets" class="restricteddata_image" />

                        <p class="notes">Not every variable will be available in each HINTS dataset. Please refer to the codebooks to ascertain what variables are or are not available on a particular dataset.</p>


                        <br />

                        <h2>HINTS-SEER Overview</h2>

                        <p>The HINTS-SEER pilot study was conducted from January to July, 2021. HINTS-SEER was a unique HINTS data collection effort conducted by the National Cancer Institute (NCI) in partnership with the NCI Surveillance, Epidemiology, and End Results (SEER) Program (<a href="https://seer.cancer.gov/">https://seer.cancer.gov/</a>) and three SEER registries (Iowa, New Mexico, and Greater Bay Area), to assess cancer communication practices, information preferences, risk behaviors, attitudes, and cancer knowledge among a sample of cancer survivors. Because the HINTS-SEER dataset contains linked medical diagnosis variables and there is a small disclosure risk, HINTS-SEER is not a public-use data file that is available for download without first applying to use the data and signing a stringent data use agreement. To learn more about HINTS-SEER, please consult the <a href="/docs/methodologyreports/HINTS_SEER_MethodologyReport.pdf">methodology report</a>, <a href="/docs/Instruments/HINTS-SEER-AnnotatedInstrument.pdf">survey instrument</a>, <a href="/docs/Instruments/HINTS-SEER-CA-AnnotatedInstrument.pdf">CA survey instrument</a>, and <a href="/meetings-trainings/hints-educational-webinars.aspx">informational webinar</a>. </p>

                        <h2>HINTS-SEER Data Considerations</h2>

                        <p>When making a request to receive the restricted-use HINTS-SEER data file, keep in mind that the HINTS program does not recommend combining HINTS-SEER with other HINTS datasets to create a larger sample size given the differences in sampling methods between HINTS-SEER and the probability-based HINTS population surveys. Additionally, analysts should be careful about reporting results from cells with fewer than 25 responses and should consider the accuracy and precision of those results and report sample sizes in their publications. Please indicate a plan for dealing with small cell sizes when applying for HINTS-SEER data.</p>




                    </asp:PlaceHolder>
                    <asp:PlaceHolder ID="PLC_thankyou" Visible="false" runat="server">
                        <asp:Literal ID="LIT_Body" Visible="false" runat="server"></asp:Literal>
                        <p><strong>Thank you for your submission. Someone on the HINTS management team will reach out to you within two weeks.</strong></p>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder ID="PLC_Issue" Visible="false" runat="server">
                        <p><strong>We're sorry. There was an issue.</strong></p>

                        <p>It’s possible that the page is temporarily unavailable, has been removed or renamed, or no longer exists.</p>

                        <p>Please <a href="/default.aspx">return to the home page</a> to find the information you were looking for or contact an administrator.</p>


                    </asp:PlaceHolder>



                </div>

            </div>
        </section>
    </div>
</asp:Content>

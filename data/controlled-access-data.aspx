<%@ Page Title="Controlled-Access Data | HINTS" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false" CodeFile="controlled-access-data.aspx.vb" Inherits="data_controlled_access_data" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="Title" content="Controlled-Access Data | HINTS" />
    <meta name="Description" content="Understand the process to apply for HINTS controlled access data and visit dbGaP records for these data sets."/>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">

                    <h1><strong>Controlled-Access Data</strong></h1>

                    <p>While most HINTS datasets are available for public use and can be downloaded through the <a href="/data/download-data.aspx">Data Downloads page</a>, certain datasets need to be requested through the National Library of Medicine's <a href="https://dbgap.ncbi.nlm.nih.gov/home/" target="_blank">database of Genotypes and Phenotypes (dbGaP) system</a> because they contain small cell sizes, geo-codes, or other suppressed variables. Once a dbGaP request is approved, the data are then accessed via <a href="https://general.datacommons.cancer.gov/#/GeneralCommons" target="_blank">NCI's General Commons (GC)</a>, a part of the Cancer Research Data Commons system supported by the National Cancer Institute. </p>
                    <p>For instructions on how to navigate the dbGaP and GC systems, please visit the <a href="#RA_dbGaP">Requesting Access via dbGaP</a> and <a href="#AD_GC">Accessing Data via GC</a> sections on this page.</p>
                    <p>Currently, the following HINTS datasets can be requested through dbGaP:</p>



                    <h2><strong>HINTS Data Linkage Project 2024 (HDLP 2024) [Contains HINTS 7 data linked with external variables]</strong></h2>
                    <ul>
                        <li><a href="/data/download-data.aspx#HDLP24">Dataset Overview</a></li>
                        <li>Request Access: To request access to HDLP 2024 data, please visit the <a href="https://dbgap.ncbi.nlm.nih.gov/beta/study/phs004213.v1.p1/#study" target="_blank">HDLP 2024 dbGaP page</a>.</li>
                    </ul>



                    <h2><strong>HINTS Data Linkage Project 2022 (HDLP 2022) [Contains HINTS 6 data linked with external variables]</strong></h2>
                    <ul>
                        <li><a href="/data/download-data.aspx#HDLP22">Dataset Overview</a></li>
                        <li>Request Access: To request access to HDLP 2022 data, please visit the <a href="https://dbgap.ncbi.nlm.nih.gov/beta/study/phs004214.v1.p1/#study" target="_blank">HDLP 2022 dbGaP page</a>.</li>
                    </ul>



                    <h2><strong>HINTS-SEER (2021)</strong></h2>
                    <ul>
                        <li><a href="/data/download-data.aspx#SEER2021">Dataset Overview</a></li>
                        <li>Request Access: To request access to HINTS-SEER data, please visit the <a href="https://dbgap.ncbi.nlm.nih.gov/beta/study/phs004065.v1.p1/#study" target="_blank">HINTS-SEER  dbGaP page</a>. To review HINTS-SEER data details, please visit the <a href="https://general.datacommons.cancer.gov/#/study/phs004065" target="_blank">HINTS-SEER GC page</a>.</li>
                    </ul>



                    <h2><strong>HINTS Data Linkage Project 2020 (HDLP 2020) [Contains HINTS 5 Cycle 4 data linked with external variables]</strong></h2>
                    <ul>
                        <li><a href="/data/download-data.aspx#HDLP">Dataset Overview</a></li>
                        <li>Request Access: To request access to HDLP 2020 data, please visit the <a href="https://dbgap.ncbi.nlm.nih.gov/beta/study/phs004215.v1.p1/#study" target="_blank">HDLP 2020 dbGaP page</a>.</li>
                    </ul>



                    <h2><strong>HINTS 4 Cycle 1 (2011) through HINTS 5 Cycle 3 (2019) controlled access datasets</strong></h2>
                    <ul>
                        <li><a href="/data/download-data.aspx#H4C1-H5C3">Datasets Overview </a></li>
                        <li>Request Access: To request access to these datasets, please use the dbGaP links below.
                            <ul>
                                <li><a href="https://dbgap.ncbi.nlm.nih.gov/beta/study/phs004216.v1.p1/#study" target="_blank">HINTS 5, Cycle 3 dbGaP page</a></li>
                                <li><a href="https://dbgap.ncbi.nlm.nih.gov/beta/study/phs004217.v1.p1/#study" target="_blank">HINTS 5, Cycle 2 dbGaP page</a></li>
                                <li><a href="https://dbgap.ncbi.nlm.nih.gov/beta/study/phs004210.v1.p1/#study" target="_blank">HINTS 5, Cycle 1 dbGaP page</a></li>
                                <li><a href="https://dbgap.ncbi.nlm.nih.gov/beta/study/phs004209.v1.p1/#study" target="_blank">HINTS 4, Cycle 4 dbGaP page</a></li>
                                <li><a href="https://dbgap.ncbi.nlm.nih.gov/beta/study/phs004208.v1.p1/#study" target="_blank">HINTS 4, Cycle 3 dbGaP page</a></li>
                                <li><a href="https://dbgap.ncbi.nlm.nih.gov/beta/study/phs004207.v1.p1/#study" target="_blank">HINTS 4, Cycle 2 dbGaP page</a></li>
                                <li><a href="https://dbgap.ncbi.nlm.nih.gov/beta/study/phs004212.v1.p1/#study" target="_blank">HINTS 4, Cycle 1 dbGaP page</a></li>
                            </ul>
                        </li>
                    </ul>




                    <h2 id="RA_dbGaP"><strong>Requesting Access via dbGaP</strong></h2>
                    <h3><strong>Non-NIH Employees</strong></h3>
                    <p>For full and detailed instructions on how to request data access via dbGaP, please visit this <a href="https://grants.nih.gov/policy-and-compliance/policy-topics/sharing-policies/accessing-data/dbgap" target="_blank">overview from the NIH Grants & Funding website</a>.</p>
                    <ol>
                        <li>Confirm you meet the pre-requisites for requesting the data.
                            <ol type="a">
                                <li>There are several pre-requisites for requesting data via dbGaP, so please check that you:
                                    <ol>
                                        <li>Are a permanent member of your institution and have an institutional email.</li>
                                        <li>Are at a level equivalent to a tenure-track professor OR are a senior scientist with responsibilities that may include laboratory or research program administration and oversight.</li>
                                    </ol>
                                </li>

                            </ol>
                        </li>
                        <li>Create credentials to submit a request through dbGaP.
                            <ol type="a">
                                <li>You must have an <a href="https://era.nih.gov/register-accounts" target="_blank">eRA account</a> to submit requests through dbGaP.</li>
                                <li>Please use your institutional email address when creating an eRA account.</li>
                            </ol>
                        </li>
                        <li>Prepare the Data Request.
                            <ol type="a">
                                <li>Visit the dbGaP page for the dataset you wish to request and click “Authorized Access.”</li>
                                <li>Log into the system using your eRA credentials.</li>
                                <li>Once you are logged in you will be able to view your research projects and ongoing requests.</li>
                                <li>Under “My Projects,” select “Create New Research Project.”</li>
                                <li>Select “Begin New Research Project.” <i>Note: We strongly recommend reviewing the instructions prior to creating a new request.</i></li>
                                <li>You can then search for HINTS data if you have not yet selected them.</li>
                                <li>Click the checkbox next to “General Research Use” under the HINTS dataset label and press “Add Selected and Continue.”</li>
                                <li>Fill out the various sections of the submission form, which include project title, research use statement, non-technical summary, signing official, internal collaborators, and IT director.</li>
                                <li>Review the information on data use certifications, restrictions on use, limitations on use, and other documentation, then <strong>submit your application</strong>.</li>
                                <li>Once a data request is submitted, it is routed to your institution’s signing official for review, approval, and co-signature.</li>
                                <li>For tips on preparing a submission, please visit this <a href="https://grants.nih.gov/sites/default/files/flmngr/Tips for Preparing a Successful DAR.pdf" target="_blank">dbGaP Tip Sheet</a>. </li>
                            </ol>
                        </li>
                        <li>Data Access Committee (DAC) review.
                            <ol type="a">
                                <li>Each dataset request is reviewed by a DAC, a group of experts who assess whether the request complies with NIH policy and is appropriate.</li>
                                <li>If your request is approved by the DAC,  you will receive an email with additional instructions on accessing the dataset.</li>
                                <li>If your request is denied, you can revise your submission and resubmit. There are <a href="https://www.ncbi.nlm.nih.gov/books/n/helpdbgap/DAreq_ReviseAmndUpd/#DAreq_ReviseAmndUpd.Revise_Data_Access_R" target="_blank">specific steps for resubmission</a>.</li>
                            </ol>
                        </li>
                        <li>Accessing the Data.
                            <ol type="a">
                                <li>If your data request is approved via dbGaP, you will be referred to NCI’s General Commons to access the data.</li>
                            </ol>
                        </li>
                    </ol>



                    <h3><strong>NIH Employees</strong></h3>
                    <p>For full and detailed instructions on how to request data access via dbGaP, please visit the <a href="https://grants.nih.gov/sites/default/files/flmngr/NIH_Intramural_Request_Form_Final.pdf" target="_blank">NIH staff specific instructions</a>.</p>
                    <ol>
                        <li>Confirm you meet the pre-requisites for requesting data.
                            <ol type="a">
                                <li>There are several pre-requisites for requesting data via dbGaP:
                                    <ol>
                                        <li>NIH Intramural Investigators must be tenure-track investigators, senior investigators, senior scientists, senior clinicians, or staff scientists.</li>
                                        <li>NIH Extramural Scientific Staff must have administrative responsibility for the data, have substantial research involvement in the award that generated the data, or need access to carry out research unrelated to their portfolio management responsibilities.</li>
                                    </ol>
                                </li>

                            </ol>
                        </li>
                        <li>Get IC permission to request the data.
                            <ol type="a">
                                <li>You must get permission from your IC prior to requesting data through dbGaP. This includes filling out the <a href="https://grants.nih.gov/sites/default/files/flmngr/NIH_Intramural_Request_Form_Final.pdf" target="_blank">Permission Form for NIH Staff Access to Controlled-Access Data in dbGaP</a> and submitting it to your IC’s signing official (which may need to be done through your supervisor). </li>
                                <li>The signing official must sign off on any specific PI-submitted data access requests (DARs) to confirm your IC’s legal support for the PI to access the requested dataset. This is done for each separate data request.</li>
                            </ol>
                        </li>
                        <li>Prepare the Data Request.
                            <ol type="a">
                                <li>Once your permission form is approved, you will be registered in the dbGaP system as an approved user and will be notified by email when you can proceed to submit data access requests through dbGaP.</li>
                                <li>Once you have access to the dbGaP access portal you will be able to view your research projects and ongoing requests.</li>
                                <li>Under “My Projects,” select “Create New Research Project.”</li>
                                <li>Select “Begin New Research Project.” <i>Note: We strongly recommend reviewing the instructions prior to creating a new request.</i></li>
                                <li>You can then search for HINTS data.</li>
                                <li>Click the checkbox next to “General Research Use” under the HINTS dataset label and press “Add Selected and Continue.”</li>
                                <li>Fill out the sections of the submission form, which include project title, research use statement, non-technical summary, signing official, internal collaborators, and IT director.</li>
                                <li>Review the data use certifications, restrictions on use, limitations on use, and other documentation, then <strong>submit your application</strong>.</li>
                                <li>Once a data request is submitted, it is routed to your IC’s signing official for review, approval, and co-signature.</li>
                                <li>For tips on preparing a submission, please visit this <a href="https://grants.nih.gov/sites/default/files/flmngr/Tips for Preparing a Successful DAR.pdf" target="_blank">dbGaP Tip Sheet</a>. </li>
                            </ol>
                        </li>
                        <li>Data Access Committee (DAC) review.
                            <ol type="a">
                                <li>Each dataset request is reviewed by a DAC, a group of experts who assess whether the request complies with NIH policy and is appropriate.</li>
                                <li>If your request is approved by the DAC, you will receive an email with additional instructions on accessing the dataset.</li>
                                <li>If your request is denied, you can revise the submission and resubmit. There are <a href="https://www.ncbi.nlm.nih.gov/books/n/helpdbgap/DAreq_ReviseAmndUpd/#DAreq_ReviseAmndUpd.Revise_Data_Access_R" target="_blank">specific steps for resubmission</a>.</li>
                            </ol>
                        </li>
                        <li>Accessing the data.
                            <ol type="a">
                                <li>If your data request is approved via dbGaP, you will be referred to NCI’s General Commons to access the data.</li>
                            </ol>
                        </li>
                    </ol>



                    <h2 id="AD_GC"><strong>Accessing Data via the General Commons (GC)</strong></h2>
                    <p>A dbGaP data request must be approved prior to accessing data within the GC. For full and detailed instructions on how to access data within the GC system, visit the <a href="/docs/GeneralCommonsUserGuide.pdf" target="_blank">GC User Guide</a>.</p>
                    <ol>
                        <li>Once you are referred to the GC website, in the search bar, type in the name of the HINTS dataset you wish to download (or just search for HINTS and choose from the list).</li>
                        <li>You will see headers for "All", "Participants" etc. Click on "Studies".</li>
                        <li>Click on the HINTS dataset you were approved to access.</li>
                        <li>Scroll down, and you will see all available files.</li>
                        <li>Click on the file you would like to add to your collection and then scroll to the bottom and on the bottom right, click "ADD SELECTED FILES."</li>
                        <li>At the top of the page, you will see a shopping cart with any files you have selected. Click on the shopping cart.</li>
                        <li>In your shopping cart, there will be a button that says "AVAILABLE EXPORT OPTIONS" on the right side of the page. Click on it, and then click on "Export to Cancer Genomics Cloud."</li>
                        <li>You will then be prompted to sign in with your eRA Commons login.</li>
                        <li>If this is your first time signing into the GC you will need to fill in the user information, as well as read and agree to the Terms of Service and Privacy Policy before pressing "Proceed to the CGC."</li>
                        <li>You will then be prompted to choose a destination project. Click "Create new project" and assign it a name.</li>
                        <li>Read the usage information and click the "I understand…" button and then press "import data." </li>
                        <li>Once the data have been imported, you can toggle to "Projects" in the upper left-hand corner. Click on the project you have created.</li>
                        <li>Next to "Dashboard" (in the upper left-hand corner), click on "Files."</li>
                        <li>Here, you will find the HINTS data files you put into your cart.</li>
                        <li>Using the checkbox option to the left of each named data file, you may click to select the desired files. Selecting files allows you to  copy, rename, move, and download them.</li>
                    </ol>



                </div>
            </div>
        </section>
    </div>
</asp:Content>

<%@ Page Title="HINTS Data Terms of Use" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="termsofuse.aspx.vb" Inherits="data_termsofuse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
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
                    ForeColor="Red"></asp:CustomValidator>
            </p>
            <p>
                <asp:Label ID="Label1" runat="server" AssociatedControlID="txtemailTerms" Text="Please enter your email:"></asp:Label>
                <asp:TextBox ID="txtemailTerms" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtemailTerms"
                    Display="Dynamic" ErrorMessage="&lt;br/&gt;Please enter an email address." ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemailTerms"
                    Display="Dynamic" ErrorMessage="&lt;br/&gt;Please enter a valid email address."
                    ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:Button ID="btnSubmit_SinglePage" runat="server" Text="Accept" />
            </p>
</asp:Content>


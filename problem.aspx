<%@ Page Title="" Language="VB" MasterPageFile="~/hintsmain.master" AutoEventWireup="false"
    CodeFile="problem.aspx.vb" Inherits="problem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container col-lg-12 col-xl-7 col custom-wrapper">
        <section>
            <div class="row">
                <div class="col-md-12">

                    <p>
                        <strong>We're sorry. The page you’re looking for is not currently available.</strong>
                    </p>
                    <p>
                        It’s possible that the page is temporarily unavailable, has been removed or renamed,
        or no longer exists.
                    </p>
                    <p>
                        Please <a href="default.aspx">return to the home page</a> to find the information
        you were looking for.
                    </p>

                    <%--Hiding breadcrumbs on homepage--%>
                    <script type="text/javascript">
                        $("#breadcrumbs").hide();
                    </script>



                </div>
            </div>
        </section>
    </div>
</asp:Content>

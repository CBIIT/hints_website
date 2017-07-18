Imports System.Data
Imports System.Data.SqlClient
Imports GenericHelper.GenericHelper

Partial Class questions_by_article
    Inherits System.Web.UI.Page


    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim objDataAdapter As New SqlDataAdapter("", objConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader
    Dim objDataSet As New System.Data.DataSet
    Dim objDataView As DataView

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Cmd.CommandType = CommandType.StoredProcedure

        If Not Page.IsPostBack Then
            UC_Results.Visible = False
            If Test_RequestVar_IsNumeric(Server.HtmlEncode(Request.QueryString("PK_Article"))) = False Then
                Response.Redirect("~/default.aspx")
            Else

                Cmd.CommandText = "Get_Article"
                Cmd.Parameters.Add("@PK_Article", SqlDbType.Int).Value = Server.HtmlEncode(Request.QueryString("PK_Article"))
                objConnect.Open()
                objDR = Cmd.ExecuteReader()
                Do While objDR.Read()
                    LIT_Title.Text = CheckNull(objDR("Title"))
                    LIT_BriefTitle.Text = CheckNull(objDR("Title"))
                    If objDR("FK_ArticleType") = "1" Then
                        PLC_PUb.Visible = True
                        PLC_Brief.Visible = False
                    Else
                        PLC_PUb.Visible = False
                        PLC_Brief.Visible = True

                    End If
                    LIT_Author.Text = CheckNull(objDR("Authors"))
                    LIT_Journal.Text = CheckNull(objDR("Journal"))
                    LIT_PubDate.Text = CheckNull(objDR("PubMonth")) & " " & CheckNull(objDR("PubYear"))
                Loop
                objDR.Close()
                Cmd.Parameters.Clear()
                objConnect.Close()

                objDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure
                objDataAdapter.SelectCommand.CommandText = "List_QuestionsByArticle"
                objDataAdapter.SelectCommand.Parameters.Add("@FK_Article", SqlDbType.NVarChar).Value = Server.HtmlEncode(Request.QueryString("PK_Article"))
                objDataAdapter.Fill(objDataSet, "NewResultSet")
                objConnect.Close()
                objDataAdapter.SelectCommand.Parameters.Clear()

                UC_Results.BuildResults(objDataSet.Tables("NewResultSet").DefaultView)
                UC_Results.Visible = True

            End If
        End If
    End Sub
End Class

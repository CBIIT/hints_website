Imports System.Data
Imports System.Data.SqlClient
Imports GenericHelper.GenericHelper

Partial Class publicationsfolder_hints_journals
    Inherits System.Web.UI.Page


    Dim strConnect As String = ConfigurationManager.ConnectionStrings("dbConnectionString").ConnectionString
    Dim objConnect As New SqlConnection(strConnect)
    Dim Cmd As New SqlCommand("", objConnect)
    Dim objDR As SqlDataReader
    Dim objDataAdapter As New SqlDataAdapter("", objConnect)
    Dim objDataSet As New System.Data.DataSet
    Dim objDataView As DataView

    Dim RowColor As Boolean = True
    Dim TotalJournals As Integer = 0
    Dim OnRowCount As Integer = 0
    Dim RowsToDisplay_Row1 As Integer = 1
    Dim RowsToDisplay_Row2 As Integer = 1

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            Try

                Cmd.CommandType = CommandType.StoredProcedure
                objConnect.Open()
                Cmd.CommandText = "Get_Journal_Count"
                TotalJournals = Cmd.ExecuteScalar()
                Cmd.Parameters.Clear()

                LIT_JournalCount.Text = TotalJournals



                Cmd.CommandText = "Get_Publication_Count"
                LIT_ArticleCount.Text = Cmd.ExecuteScalar()
                Cmd.Parameters.Clear()



                RowsToDisplay_Row1 = (TotalJournals \ 2) + (TotalJournals Mod 2)

                RowsToDisplay_Row2 = (TotalJournals \ 2)

                'Response.Write("<strong> RowsToDisplay_Row1 ---- " & RowsToDisplay_Row1 & "---</strong><br/>")
                'Response.Write("<strong> RowsToDisplay_Row2 ---- " & RowsToDisplay_Row2 & "---</strong><br/>")
                'Response.Write("<strong> RowsToDisplay_Row3 ---- " & RowsToDisplay_Row3 & "---</strong><br/>")

                RowColor = False
                OnRowCount = 0
                Cmd.CommandText = "List_Journals"
                objDR = Cmd.ExecuteReader()
                RPTR_Col1.DataSource = objDR
                RPTR_Col1.DataBind()
                objDR.Close()
                Cmd.Parameters.Clear()

                RowColor = False
                OnRowCount = 0
                Cmd.CommandText = "List_Journals"
                objDR = Cmd.ExecuteReader()
                RPTR_Col2.DataSource = objDR
                RPTR_Col2.DataBind()
                objDR.Close()
                Cmd.Parameters.Clear()

                objConnect.Close()
            Catch ex As Exception

            End Try


        End If
    End Sub

    Function CheckVis_Col1() As Boolean
        OnRowCount += 1
        If OnRowCount > RowsToDisplay_Row1 Then
            Return False
        Else
            SwitchColors()
            Return True
        End If
    End Function

    Function CheckVis_Col2() As Boolean
        OnRowCount += 1

        If OnRowCount <= RowsToDisplay_Row1 Then
            Return False
        Else
            If OnRowCount >= RowsToDisplay_Row2 Then
                SwitchColors()
                Return True
            Else
                Return False
            End If
        End If
    End Function

    Function SET_BG() As String
        If RowColor = True Then
            Return "tr_even"
        Else
            Return "tr_odd"
        End If

    End Function

    Sub SwitchColors()
        If RowColor = True Then
            RowColor = False
        Else
            RowColor = True
        End If
    End Sub
End Class


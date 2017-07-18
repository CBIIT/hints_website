Imports Microsoft.VisualBasic



Namespace GenericHelper

    Public Class GenericHelper




        Public Shared Function CheckNull(ByVal TmpStr As Object) As String
            If TypeOf (TmpStr) Is DBNull Then
                Return ""
            Else
                Return TmpStr
            End If

        End Function

        Public Shared Function CheckNull_Integer(ByVal TmpStr As Object) As Decimal
            If TypeOf (TmpStr) Is DBNull Then
                Return 0
            Else
                Return CDec(TmpStr)
            End If

        End Function


        Public Shared Function Test_RequestVar_IsNumeric(ByVal Request_Variable As Object) As Boolean
            If Request_Variable Is Nothing Or Request_Variable = "" Then
                Return False
            Else
                'make sure the ID is an integer
                If IsNumeric(Request_Variable) = True Then
                    Return True
                Else
                    Return False
                End If
            End If
        End Function


        Public Shared Function Test_RequestVar_IsPopulated(ByVal Request_Variable As Object) As Boolean
            If Request_Variable Is Nothing Or Request_Variable = "" Then
                Return False
            Else
                Return True
            End If
        End Function

        Public Shared Sub PreSelectDDL(ByRef DDL As DropDownList, TstValue As Object)
            DDL.ClearSelection()
            Try
                DDL.Items.FindByValue(CheckNull(TstValue)).Selected = True
            Catch objError As Exception
                DDL.ClearSelection()
            End Try
        End Sub

    End Class

End Namespace
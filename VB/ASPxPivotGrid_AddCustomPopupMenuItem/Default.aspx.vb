Imports DevExpress.Web.ASPxPivotGrid
Imports System
Imports System.Data

Namespace ASPxPivotGrid_AddCustomPopupMenuItem
    Partial Public Class [Default]
        Inherits System.Web.UI.Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
            Dim ds As New DataSet()
            ds.ReadXml(Server.MapPath("~/App_Data/CustomerReports.xml"))
            ASPxPivotGrid1.DataSource = ds.Tables(0)
            ASPxPivotGrid1.DataBind()
        End Sub
        Protected Sub ASPxPivotGrid1_PopupMenuCreated(ByVal sender As Object, ByVal e As PivotPopupMenuCreatedEventArgs)
            If e.MenuType = PivotGridPopupMenuType.FieldValueMenu Then
                e.Menu.Items.Add("Hide this value", "hideValue")
            End If
        End Sub

        Protected Sub ASPxPivotGrid1_CustomCallback(ByVal sender As Object, ByVal e As PivotGridCustomCallbackEventArgs)
            Dim pivot As ASPxPivotGrid = DirectCast(sender, ASPxPivotGrid)
            pivot.JSProperties("cpAlertMessage") = Nothing
            Dim parameters() As String = e.Parameters.Split(New Char() { "|"c })
            If parameters.Length = 5 AndAlso parameters(0) = "MenuItemClick" Then
                If parameters(1) = "hideValue" Then
                    Dim isColumn As Boolean = parameters(4) = "ColumnArea"
                    Dim fieldValueInfo As PivotFieldValueEventArgs = pivot.GetFieldValueInfo(isColumn, Convert.ToInt32(parameters(3)))
                    If isColumn Then
                        pivot.JSProperties("cpAlertMessage") = String.Format("Cannot hide the {0} column", fieldValueInfo.Value)
                    Else
                        If fieldValueInfo.Field IsNot Nothing Then
                            fieldValueInfo.Field.FilterValues.Add(fieldValueInfo.Value)
                        End If
                    End If
                End If
            End If
        End Sub
    End Class
End Namespace

Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web.ASPxPivotGrid

Partial Public Class _Default
	Inherits System.Web.UI.Page
    Protected Sub ASPxPivotGrid1_PopupMenuCreated(ByVal sender As Object, _
                           ByVal e As DevExpress.Web.ASPxPivotGrid.PivotPopupMenuCreatedEventArgs)
        If e.MenuType = DevExpress.Web.ASPxPivotGrid.PivotGridPopupMenuType.FieldValueMenu Then
            e.Menu.Items.Add("Hide this value", "hideValue")
        End If
    End Sub

    Protected Sub ASPxPivotGrid1_CustomCallback(ByVal sender As Object, _
                           ByVal e As DevExpress.Web.ASPxPivotGrid.PivotGridCustomCallbackEventArgs)
        Dim pivot As ASPxPivotGrid = CType(sender, ASPxPivotGrid)
        Dim parametrs() As String = e.Parameters.Split(New Char() {"|"c})
        If parametrs.Length = 4 AndAlso parametrs(0) = "MenuItemClick" Then
            If parametrs(1) = "hideValue" Then
                Dim field As PivotGridField = pivot.Fields(parametrs(2))
                If field IsNot Nothing Then
                    field.FilterValues.Add(pivot.GetFieldValueByIndex(field, _
                                                                      Convert.ToInt32(parametrs(3))))
                End If
            End If
        End If

    End Sub
End Class

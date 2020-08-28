<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPxPivotGrid_AddCustomPopupMenuItem.Default" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.13.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <script type="text/javascript">
        function HideValue(s, e) {
            pivotGrid.PerformCallback('MenuItemClick|' +
                e.MenuItemName + '|' +
                e.FieldID + '|' +
                e.FieldValueIndex + '|' +
                e.Area
            );
        }
        function DisplayAlert(s, e) {
         if (s.cpAlertMessage != null)
          {
               alert(s.cpAlertMessage);
          }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server"
                ClientInstanceName="pivotGrid" OnCustomCallback="ASPxPivotGrid1_CustomCallback"
                OnPopupMenuCreated="ASPxPivotGrid1_PopupMenuCreated" 
                ClientIDMode="AutoID">
                <ClientSideEvents PopupMenuItemClick="HideValue" EndCallback="DisplayAlert" />
                <Fields>
                    <dx:PivotGridField ID="fieldProductName" AreaIndex="1"
                        FieldName="ProductName"
                        Area="RowArea">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldCompanyName" Area="RowArea" AreaIndex="0"
                        FieldName="CompanyName">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldOrderDate" Area="ColumnArea" AreaIndex="0"
                        FieldName="OrderDate"
                        GroupInterval="DateYear"
                        UnboundFieldName="fieldOrderDate">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldProductAmount" Area="DataArea" AreaIndex="0"
                        FieldName="ProductAmount">
                    </dx:PivotGridField>
                </Fields>
            </dx:ASPxPivotGrid>
        </div>
    </form>
</body>
</html>

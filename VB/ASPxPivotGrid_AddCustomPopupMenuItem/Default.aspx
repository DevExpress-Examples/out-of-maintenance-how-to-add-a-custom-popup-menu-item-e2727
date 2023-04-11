<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ASPxPivotGrid_AddCustomPopupMenuItem.Default" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v21.2, Version=21.2.13.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>

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
                ClientIDMode="AutoID" OptionsData-DataProcessingEngine="Optimized" IsMaterialDesign="False">
                <ClientSideEvents PopupMenuItemClick="HideValue" EndCallback="DisplayAlert" />
                <Fields>
                    <dx:PivotGridField ID="fieldProductName" AreaIndex="1"
                        Area="RowArea">
                        <DataBindingSerializable>
                            <dx:DataSourceColumnBinding ColumnName="ProductName" />
                        </DataBindingSerializable>
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldCompanyName" Area="RowArea" AreaIndex="0">
                        <DataBindingSerializable>
                            <dx:DataSourceColumnBinding ColumnName="CompanyName" />
                        </DataBindingSerializable>
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldOrderDate" Area="ColumnArea" AreaIndex="0"
                        UnboundFieldName="fieldOrderDate">
                        <DataBindingSerializable>
                            <dx:DataSourceColumnBinding ColumnName="OrderDate" GroupInterval="DateYear" />
                        </DataBindingSerializable>
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldProductAmount" Area="DataArea" AreaIndex="0">
                        <DataBindingSerializable>
                            <dx:DataSourceColumnBinding ColumnName="ProductAmount" />
                        </DataBindingSerializable>
                    </dx:PivotGridField>
                </Fields>

<OptionsData DataProcessingEngine="Optimized"></OptionsData>
            </dx:ASPxPivotGrid>
        </div>
    </form>
</body>
</html>
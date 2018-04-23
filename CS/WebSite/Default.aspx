<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v13.1, Version=13.1.8.0, 
                                                           Culture=neutral, 
                                                           PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dxwpg" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
                      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" >
        function HideValue(s, e) {
            pivotGrid.PerformCallback( 'MenuItemClick|' +
                                            e.MenuItemName + '|' +
                                            e.FieldID + '|' +
                                            e.FieldValueIndex);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dxwpg:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" DataSourceID="AccessDataSource1"
            ClientInstanceName="pivotGrid" OnCustomCallback="ASPxPivotGrid1_CustomCallback"
            OnPopupMenuCreated="ASPxPivotGrid1_PopupMenuCreated" ClientIDMode="AutoID">
            <ClientSideEvents PopupMenuItemClick="HideValue" />
            <Fields>
                <dxwpg:PivotGridField ID="fieldProductName" AreaIndex="1" 
                                      FieldName="ProductName"
                                      Area="RowArea">
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField ID="fieldCompanyName" Area="RowArea" AreaIndex="0" 
                                      FieldName="CompanyName">
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField ID="fieldOrderDate" Area="ColumnArea" AreaIndex="0" 
                                      FieldName="OrderDate"
                                      GroupInterval="DateYear" 
                                      UnboundFieldName="fieldOrderDate">
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField ID="fieldProductAmount" Area="DataArea" AreaIndex="0" 
                                      FieldName="ProductAmount">
                </dxwpg:PivotGridField>
            </Fields>
        </dxwpg:ASPxPivotGrid>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT * FROM [CustomerReports]"></asp:AccessDataSource>
    </div>
    </form>
</body>
</html>

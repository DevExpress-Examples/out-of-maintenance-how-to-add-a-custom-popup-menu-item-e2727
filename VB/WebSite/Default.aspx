<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v10.1, Version=10.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dxwpg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
	<div>

	</div>
	<dxwpg:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" 
		DataSourceID="AccessDataSource1" ClientInstanceName="pivotGrid" 
		oncustomcallback="ASPxPivotGrid1_CustomCallback" 
		onpopupmenucreated="ASPxPivotGrid1_PopupMenuCreated">
		<ClientSideEvents PopupMenuItemClick="function(s, e) {
	pivotGrid.PerformCallback( &quot;MenuItemClick|&quot; + e.MenuItemName+ &quot;|&quot; + e.FieldID + &quot;|&quot; + e.FieldValueIndex );
}" />
		<Fields>

			<dxwpg:PivotGridField ID="fieldProductName" AreaIndex="1" 
				FieldName="ProductName" Area="RowArea">
			</dxwpg:PivotGridField>
			<dxwpg:PivotGridField ID="fieldCompanyName" Area="RowArea" AreaIndex="0" 
				FieldName="CompanyName">
			</dxwpg:PivotGridField>
			<dxwpg:PivotGridField ID="fieldOrderDate" Area="ColumnArea" AreaIndex="0" 
				FieldName="OrderDate" GroupInterval="DateYear" 
				UnboundFieldName="fieldOrderDate">
			</dxwpg:PivotGridField>
			<dxwpg:PivotGridField ID="fieldProductAmount" Area="DataArea" AreaIndex="0" 
				FieldName="ProductAmount">
			</dxwpg:PivotGridField>

		</Fields>
	</dxwpg:ASPxPivotGrid>
	<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
		DataFile="~/App_Data/nwind.mdb" 
		SelectCommand="SELECT * FROM [CustomerReports]">
	</asp:AccessDataSource>
	</form>
</body>
</html>
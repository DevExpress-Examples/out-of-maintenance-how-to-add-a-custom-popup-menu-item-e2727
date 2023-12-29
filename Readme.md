<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/ASPxPivotGrid_AddCustomPopupMenuItem/Default.aspx) (VB: [Default.aspx.vb](./VB/ASPxPivotGrid_AddCustomPopupMenuItem/Default.aspx))
* [Default.aspx.cs](./CS/ASPxPivotGrid_AddCustomPopupMenuItem/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/ASPxPivotGrid_AddCustomPopupMenuItem/Default.aspx.vb))
<!-- default file list end -->
# How to Add a Custom Item to the ASPxPivotGrid Popup Menu


This example demonstrates how to add a custom menu item (<i>"Hide this value"</i>) to the field value popup menu and get information on a clicked field.

In this example, the following API is used:
* <a href="http://docs.devexpress.com/#AspNet/DevExpressWebASPxPivotGridASPxPivotGrid_PopupMenuCreatedtopic">ASPxPivotGrid.PopupMenuCreated</a> event is handled to add a custom menu item; 
* <a href="http://docs.devexpress.com/#AspNet/DevExpressWebASPxPivotGridASPxPivotGrid_CustomCallbacktopic">ASPxPivotGrid.CustomCallback </a> event is handled to process an item click on the server side;
* <a href="http://docs.devexpress.com/#AspNet/DevExpressWebASPxPivotGridScriptsASPxClientPivotGrid_PopupMenuItemClicktopic">ASPxClientPivotGrid.PopupMenuItemClick</a> client-side event performs a callback to the server to supply required values to the ASPxPivotGrid.CustomCallback event handler;
* <a href="https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxPivotGrid.ASPxPivotGrid.GetFieldValueInfo(System.Boolean-System.Int32)">ASPxPivotGrid.GetFieldValueInfo</a> method returns information about the clicked field;
* <a href="https://docs.devexpress.com/CoreLibraries/DevExpress.XtraPivotGrid.PivotFieldEventArgsBase-1.Field">PivotFieldValueEventArgs.Field</a> property gets the clicked field;
* <a href="https://docs.devexpress.com/CoreLibraries/DevExpress.XtraPivotGrid.PivotGridFieldBase.FilterValues">Field.FilterValues</a> property allows filter criteria addition to hide the specified value;
 * <a href="https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxPivotGrid.ASPxPivotGrid.JSProperties">ASPxPivotGrid.JSProperties</a> stores the notification string to display on the client side using the JS alert function.

 ![](./images/Screenshot.png)





<b>See Also:</b><br />
<a href="https://www.devexpress.com/Support/Center/p/E3909">How to show custom popup context menu items only for certain fields</a></p>




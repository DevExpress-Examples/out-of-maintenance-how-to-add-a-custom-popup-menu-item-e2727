using DevExpress.Web.ASPxPivotGrid;
using System;
using System.Data;

namespace ASPxPivotGrid_AddCustomPopupMenuItem
{
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath(@"~/App_Data/CustomerReports.xml"));
            ASPxPivotGrid1.DataSource = ds.Tables[0];
            ASPxPivotGrid1.DataBind();
        }
        protected void ASPxPivotGrid1_PopupMenuCreated(object sender, PivotPopupMenuCreatedEventArgs e)
        {
            if (e.MenuType == PivotGridPopupMenuType.FieldValueMenu)
            {
                e.Menu.Items.Add("Hide this value", "hideValue");
            }
        }

        protected void ASPxPivotGrid1_CustomCallback(object sender, PivotGridCustomCallbackEventArgs e)
        {
            ASPxPivotGrid pivot = (ASPxPivotGrid)sender;
            pivot.JSProperties["cpAlertMessage"] = null;
            string[] parameters = e.Parameters.Split(new char[] { '|' });
            if (parameters.Length == 5 && parameters[0] == "MenuItemClick")
            {
                if (parameters[1] == "hideValue")
                {
                    bool isColumn = parameters[4] == "ColumnArea";
                    PivotFieldValueEventArgs fieldValueInfo = pivot.GetFieldValueInfo(isColumn, Convert.ToInt32(parameters[3]));
                    if (isColumn)
                    {
                        pivot.JSProperties["cpAlertMessage"] = string.Format("Cannot hide the {0} column", fieldValueInfo.Value);
                    }
                    else
                    {
                        if (fieldValueInfo.Field != null)
                            fieldValueInfo.Field.FilterValues.Add(fieldValueInfo.Value);
                    }
                }
            }
        }
    }
}
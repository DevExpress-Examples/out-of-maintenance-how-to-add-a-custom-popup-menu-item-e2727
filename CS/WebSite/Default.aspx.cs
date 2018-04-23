using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxPivotGrid;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }


    protected void ASPxPivotGrid1_PopupMenuCreated(object sender, DevExpress.Web.ASPxPivotGrid.PivotPopupMenuCreatedEventArgs e)
    {
        if (e.MenuType == DevExpress.Web.ASPxPivotGrid.PivotGridPopupMenuType.FieldValueMenu)
        {            
            e.Menu.Items.Add("Hide this value", "hideValue");
        }
    }
    protected void ASPxPivotGrid1_CustomCallback(object sender, DevExpress.Web.ASPxPivotGrid.PivotGridCustomCallbackEventArgs e)
    {
        ASPxPivotGrid pivot = (ASPxPivotGrid)sender;
        string[] parametrs = e.Parameters.Split(new char[] {'|'});
        if (parametrs.Length == 4 && parametrs[0] == "MenuItemClick")
        {
            if (parametrs[1] == "hideValue" )
            {
                PivotGridField field = pivot.Fields[parametrs[2]];
                if (field != null)
                    field.FilterValues.Add(pivot.GetFieldValueByIndex(field, Convert.ToInt32(  parametrs[3] )));
            }
        }
 
    }
}

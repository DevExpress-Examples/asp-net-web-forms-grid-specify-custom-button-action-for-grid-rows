using System;
using DevExpress.Web.ASPxGridView;

public partial class _Default : System.Web.UI.Page {
    protected void gv_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
        ASPxGridView gridView = (ASPxGridView)sender;
        // Note that data modifications are not allowed in online demos
        gridView.CancelEdit();
        e.Cancel = true;
    }
}
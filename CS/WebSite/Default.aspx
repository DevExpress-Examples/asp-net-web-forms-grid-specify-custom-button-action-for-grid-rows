<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>









<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to disable the "Edit" button action in some rows of ASPxGridView</title>
    <script type="text/javascript">
        function gv_OnCustomButtonClick(s, e) {
            if (e.visibleIndex % 2 === 0)
                alert("You cannot edit this row!");
            else
                s.StartEditRow(e.visibleIndex);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/NorthWind.mdb"
            SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
        </asp:AccessDataSource>
        <dx:ASPxGridView ID="gv" ClientInstanceName="gv" runat="server" AutoGenerateColumns="False"
            KeyFieldName="CategoryID" DataSourceID="ads" OnRowUpdating="gv_RowUpdating">
            <ClientSideEvents CustomButtonClick="gv_OnCustomButtonClick" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="EditBnt" Text="Edit">
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="1" ReadOnly="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsLoadingPanel Mode="Disabled" />
        </dx:ASPxGridView>
    </form>
</body>
</html>

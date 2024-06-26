<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128539134/13.1.4%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E4283)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
[![](https://img.shields.io/badge/💬_Leave_Feedback-feecdd?style=flat-square)](#does-this-example-address-your-development-requirementsobjectives)
<!-- default badges end -->
# Grid View for ASP.NET Web Forms - How to specify a custom button action for particular grid rows

This example demonstrates how to create a custom **Edit** button and specify its action based on the row's visible index.

![customEditButton](images/customEditButton.png)

## Overview

Follow the steps below:

1. Create the [Grid View](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridView) control and bind it to a data source. Add a [GridViewCommandColumn](https://docs.devexpress.com/AspNet/DevExpress.Web.GridViewCommandColumn) and use the [CustomButtons](https://docs.devexpress.com/AspNet/DevExpress.Web.GridViewCommandColumn.CustomButtons) property to create a custom **Edit** button.

    ```aspx
    <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/NorthWind.mdb"
        SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
    </asp:AccessDataSource>
    <dx:ASPxGridView ID="gv" ClientInstanceName="gv" runat="server" AutoGenerateColumns="False"
        KeyFieldName="CategoryID" DataSourceID="ads" ...>
        <ClientSideEvents CustomButtonClick="gv_OnCustomButtonClick" />
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="EditBnt" Text="Edit" />
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <!-- ... -->
        </Columns>
        <!-- ... -->
    </dx:ASPxGridView>
    ```

2. Handle the grid's client-side [CustomButtonClick](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.CustomButtonClick) event. Use the row's visible index to indicate whether the row is odd or even. Call the grid's [StartEditRow](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.StartEditRow(visibleIndex)) method to start editing even rows. For odd rows, specify an alert message.

    ```js
    function gv_OnCustomButtonClick(s, e) {
        if (e.visibleIndex % 2 === 0)
            alert("You cannot edit this row!");
        else
            s.StartEditRow(e.visibleIndex);
    }
    ```

## Files to Review

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))

## Documentation

* [StartEditRow](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.StartEditRow(visibleIndex))
* [Custom Buttons](https://docs.devexpress.com/AspNet/DevExpress.Web.GridViewCommandColumn.CustomButtons)
* [CustomButtonClick](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.CustomButtonClick)
<!-- feedback -->
## Does this example address your development requirements/objectives?

[<img src="https://www.devexpress.com/support/examples/i/yes-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=asp-net-web-forms-grid-specify-custom-button-action-for-grid-rows&~~~was_helpful=yes) [<img src="https://www.devexpress.com/support/examples/i/no-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=asp-net-web-forms-grid-specify-custom-button-action-for-grid-rows&~~~was_helpful=no)

(you will be redirected to DevExpress.com to submit your response)
<!-- feedback end -->

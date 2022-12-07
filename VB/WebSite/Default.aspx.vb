Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub gv_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
		Dim gridView As ASPxGridView = CType(sender, ASPxGridView)
		' Note that data modifications are not allowed in online demos
		gridView.CancelEdit()
		e.Cancel = True
	End Sub
End Class
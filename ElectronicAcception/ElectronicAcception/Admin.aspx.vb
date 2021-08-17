Public Class Admin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
        DetailsView1.ChangeMode(DetailsViewMode.Insert)
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button3.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub ButtonAddDept_Click(ByVal sender As Object, ByVal e As EventArgs)
        DetailsView2.ChangeMode(DetailsViewMode.Insert)
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button4.Click
        MultiView1.ActiveViewIndex = 2
    End Sub
End Class
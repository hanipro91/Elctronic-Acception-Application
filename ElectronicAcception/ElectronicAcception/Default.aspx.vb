Public Class _Default
    Inherits System.Web.UI.Page

    Function getUnversities() As String
        Dim uns As String = ""
        ADS.SelectCommand = "SELECT * FROM [Universities]"
        Dim data As Data.DataView = ADS.Select(New UI.DataSourceSelectArguments())
        For Each x As Data.DataRow In data.Table.Rows
            If uns.Length Then uns += ", "
            uns += "{ID:" & x("ID") & ", Name:""" & x("Name") & """, Address:""" + x("Adderss") + """, Logo:""" + x("Logo") + """}"
        Next
        Return "[" + uns + "]"
    End Function

    Function getDepartments() As String
        Dim depts As String = ""
        ADS.SelectCommand = "SELECT * FROM [Depatrments]"
        Dim data As Data.DataView = ADS.Select(New UI.DataSourceSelectArguments())
        For Each x As Data.DataRow In data.Table.Rows
            If depts.Length Then depts += ", "
            ' [University], [MaxCapacity], [MinAvg], [StudyType] 
            depts += "{ID:" & x("ID") & ", Name:""" & x("Name") & """, University:" & x("University") & ", MaxCapacity:" & x("MaxCapacity") & ", MinAvg:" & x("MinAvg") & ", StudyType:" & x("StudyType") & "}"
        Next
        Return "[" + depts + "]"
    End Function

    Function getAcceptNumbers() As String
        Dim numbers As String = ""
        ADS.SelectCommand = "SELECT AccepNumber FROM [Students]"
        Dim data As Data.DataView = ADS.Select(New UI.DataSourceSelectArguments())
        For Each x As Data.DataRow In data.Table.Rows
            If numbers.Length Then numbers += ", "
            numbers &= x("AccepNumber")
        Next
        Return "[" + numbers + "]"
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If String.IsNullOrEmpty(Request("name")) Then
            Exit Sub
        End If

        Dim rName = Request("name")
        Dim Sex = Request("sex")
        Dim bDate = Request("date")
        Dim City = Request("city")
        Dim Type = Request("type")
        Dim Schoole = Request("school")
        Dim Average = Request("average")
        Dim AcceptDept = Request("dept")
        Dim AccNumber = Request("accNumber")

        ADS.InsertCommand = "INSERT INTO [Students] ([Name], Sex, BirthDate, City, StudyType, School, Average, AccepNumber, AcceptInDepartment, RegDate)" +
            "VALUES ('" + rName + "','" + Sex + "', '" + bDate + "', '" + City + "'," & Type & ", '" + Schoole + "', " & Average & "," & AccNumber & "," & AcceptDept & ", Date())"

        ADS.Insert()

    End Sub

End Class
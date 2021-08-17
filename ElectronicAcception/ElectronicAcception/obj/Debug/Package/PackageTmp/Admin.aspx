<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Admin.aspx.vb" Inherits="ElectronicAcception.Admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Adminstrator</title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="Scripts/element.js" type="text/javascript"></script>
    <link href="Styles/font-awesome-base64.css" rel="stylesheet" type="text/css" />
    <style>
        .grid
      {
          margin:20px 0;
      }
      .grid img
      {
          height:50px;
          width:50px;
      }
      .page
      {
          padding:20px;
          text-align:center;
      }
      td:first-child{font-weight:600;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="page">
        <div>
            <asp:Button cssClass="btn" ID="Button2" runat="server" Text="Universities"  /> 
            <asp:Button cssClass="btn" ID="Button3" runat="server" Text="Departments" />
            <asp:Button cssClass="btn" ID="Button4" runat="server" Text="Students" />
        </div>

        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
             ConflictDetection="CompareAllValues" 
             DataFile="~/App_Data/electronic.accdb" 
             SelectCommand="SELECT * FROM [Universities]" >
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
             DataFile="~/App_Data/electronic.accdb" 
             SelectCommand="SELECT * FROM [Depatrments]" >
        </asp:AccessDataSource>

        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
                    DataSourceID="AccessDataSource1" BackColor="White" BorderColor="#E7E7FF" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="grid" 
                    GridLines="Horizontal" Width="957px">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:CommandField 
                            ShowSelectButton="True" />
                        <asp:TemplateField HeaderText="Logo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Logo") %>'></asp:TextBox>
                                <img src="<%# Eval("Logo") %>"  />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <img src="<%# Eval("Logo") %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Adderss" HeaderText="Adderss" 
                            SortExpression="Adderss" />
                        <asp:BoundField DataField="EstablishmentDate" HeaderText="Establishment Year" 
                            SortExpression="EstablishmentDate" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>

                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" DataKeyNames="ID" DataSourceID="AccessDataSource2" 
                    ForeColor="Black" GridLines="Horizontal" Height="50px" Width="954px">
                    <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <EmptyDataTemplate>
                        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                            Text="Add University" />
                    </EmptyDataTemplate>
                    <Fields>
                        <asp:TemplateField HeaderText="Logo" SortExpression="Logo">
                            <EditItemTemplate>
                                <img style="width:200px; height:200px;" src="<%# Eval("Logo") %>" onclick="LoadImage(this)" onload="DetailsView1_hLogo.value=src" />
                                <input type=hidden runat=server id="hLogo" value='<%# Bind("Logo") %>'/>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                 <img style="width:200px; height:200px;" src="" onclick="LoadImage(this)" onload="DetailsView1_hLogo.value=src" />
                                 <input type=hidden runat=server id="hLogo" value='<%# Bind("Logo") %>'/>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <img style="width:200px; height:200px;" src="<%# Eval("Logo") %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Adderss" HeaderText="Adderss" 
                            SortExpression="Adderss" />
                        <asp:BoundField DataField="EstablishmentDate" HeaderText="EstablishmentDate" 
                            SortExpression="EstablishmentDate" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowInsertButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                </asp:DetailsView>

                <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                    ConflictDetection="CompareAllValues" DataFile="~/App_Data/electronic.accdb" 
                    DeleteCommand="DELETE FROM [Universities] WHERE [ID] = ? AND (([Name] = ?) OR ([Name] IS NULL AND ? IS NULL)) AND (([Adderss] = ?) OR ([Adderss] IS NULL AND ? IS NULL)) AND (([EstablishmentDate] = ?) OR ([EstablishmentDate] IS NULL AND ? IS NULL)) AND (([Logo] = ?) OR ([Logo] IS NULL AND ? IS NULL))" 
                    InsertCommand="INSERT INTO [Universities] ( [Name], [Adderss], [EstablishmentDate], [Logo]) VALUES ( ?, ?, ?, ?)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT * FROM [Universities] WHERE ([ID] = ?)" 
                    UpdateCommand="UPDATE [Universities] SET [Name] = ?, [Adderss] = ?, [EstablishmentDate] = ?, [Logo] = ? WHERE [ID] = ? AND (([Name] = ?) OR ([Name] IS NULL AND ? IS NULL)) AND (([Adderss] = ?) OR ([Adderss] IS NULL AND ? IS NULL)) AND (([EstablishmentDate] = ?) OR ([EstablishmentDate] IS NULL AND ? IS NULL)) AND (([Logo] = ?) OR ([Logo] IS NULL AND ? IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="Int32" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Adderss" Type="String" />
                        <asp:Parameter Name="original_Adderss" Type="String" />
                        <asp:Parameter Name="original_EstablishmentDate" Type="Int32" />
                        <asp:Parameter Name="original_EstablishmentDate" Type="Int32" />
                        <asp:Parameter Name="original_Logo" Type="String" />
                        <asp:Parameter Name="original_Logo" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Adderss" Type="String" />
                        <asp:Parameter Name="EstablishmentDate" Type="Int32" />
                        <asp:Parameter Name="Logo" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="ID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Adderss" Type="String" />
                        <asp:Parameter Name="EstablishmentDate" Type="Int32" />
                        <asp:Parameter Name="Logo" Type="String" />
                        <asp:Parameter Name="original_ID" Type="Int32" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Adderss" Type="String" />
                        <asp:Parameter Name="original_Adderss" Type="String" />
                        <asp:Parameter Name="original_EstablishmentDate" Type="Int32" />
                        <asp:Parameter Name="original_EstablishmentDate" Type="Int32" />
                        <asp:Parameter Name="original_Logo" Type="String" />
                        <asp:Parameter Name="original_Logo" Type="String" />
                    </UpdateParameters>
                </asp:AccessDataSource>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
                    DataSourceID="AccessDataSource3" CellPadding="4" CssClass="grid" 
                    GridLines="None" Width="957px" ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="University" HeaderText="University" 
                            SortExpression="University" />
                        <asp:BoundField DataField="MaxCapacity" HeaderText="MaxCapacity" 
                            SortExpression="MaxCapacity" />
                        <asp:BoundField DataField="MinAvg" HeaderText="MinAvg" 
                            SortExpression="MinAvg" />
                        <asp:BoundField DataField="StudyType" HeaderText="StudyType" 
                            SortExpression="StudyType" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>

                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" DataKeyNames="ID" DataSourceID="AccessDataSource4" 
                    ForeColor="#333333" GridLines="None" Height="50px" Width="954px">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <EmptyDataTemplate>
                        <asp:Button ID="Button1" runat="server" onclick="ButtonAddDept_Click" 
                            Text="Add Department" />
                    </EmptyDataTemplate>
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:TemplateField HeaderText="University" SortExpression="University">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server"
                                    Text='<%# Bind("University") %>'
                                    DataMember="DefaultView" DataSourceID="AccessDataSource1" DataTextField="Name" 
                                    DataValueField="ID">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataMember="DefaultView" 
                                    Text='<%# Bind("University") %>'
                                    DataSourceID="AccessDataSource1" DataTextField="Name" DataValueField="ID">
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("University") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="MaxCapacity" HeaderText="MaxCapacity" 
                            SortExpression="MaxCapacity" />
                        <asp:BoundField DataField="MinAvg" HeaderText="MinAvg" 
                            SortExpression="MinAvg" />
                        <asp:TemplateField HeaderText="StudyType" SortExpression="StudyType">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" Text='<%# Bind("StudyType") %>'>
                                    <asp:ListItem Selected="True" Value="0">Academy</asp:ListItem>
                                    <asp:ListItem Value="1">Literal</asp:ListItem>
                                    <asp:ListItem Value="2">Scientific</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" Text='<%# Bind("StudyType") %>'>
                                    <asp:ListItem Selected="True" Value="0">Academy</asp:ListItem>
                                    <asp:ListItem Value="1">Literal</asp:ListItem>
                                    <asp:ListItem Value="0">Scientific</asp:ListItem>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("StudyType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowInsertButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                </asp:DetailsView>

                <asp:AccessDataSource ID="AccessDataSource4" runat="server" 
                    ConflictDetection="CompareAllValues" DataFile="~/App_Data/electronic.accdb" 
                    DeleteCommand="DELETE FROM [Depatrments] WHERE [ID] = ? AND (([Name] = ?) OR ([Name] IS NULL AND ? IS NULL)) AND (([University] = ?) OR ([University] IS NULL AND ? IS NULL)) AND (([MaxCapacity] = ?) OR ([MaxCapacity] IS NULL AND ? IS NULL)) AND (([MinAvg] = ?) OR ([MinAvg] IS NULL AND ? IS NULL)) AND (([StudyType] = ?) OR ([StudyType] IS NULL AND ? IS NULL))" 
                    InsertCommand="INSERT INTO Depatrments(Name, University, MaxCapacity, MinAvg, StudyType) VALUES (?, ?, ?, ?, ?)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT * FROM [Depatrments] WHERE ([ID] = ?)" 
                    
                    
                    UpdateCommand="UPDATE [Depatrments] SET [Name] = ?, [University] = ?, [MaxCapacity] = ?, [MinAvg] = ?, [StudyType] = ? WHERE [ID] = ? ">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="Int32" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_University" Type="Int32" />
                        <asp:Parameter Name="original_University" Type="Int32" />
                        <asp:Parameter Name="original_MaxCapacity" Type="Int32" />
                        <asp:Parameter Name="original_MaxCapacity" Type="Int32" />
                        <asp:Parameter Name="original_MinAvg" Type="Int32" />
                        <asp:Parameter Name="original_MinAvg" Type="Int32" />
                        <asp:Parameter Name="original_StudyType" Type="Int32" />
                        <asp:Parameter Name="original_StudyType" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="University" Type="Int32" />
                        <asp:Parameter Name="MaxCapacity" Type="Int32" />
                        <asp:Parameter Name="MinAvg" Type="Int32" />
                        <asp:Parameter Name="StudyType" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView2" DefaultValue="0" Name="ID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="University" Type="Int32" />
                        <asp:Parameter Name="MaxCapacity" Type="Int32" />
                        <asp:Parameter Name="MinAvg" Type="Int32" />
                        <asp:Parameter Name="StudyType" Type="Int32" />
                        <asp:Parameter Name="original_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
                    DataSourceID="AccessDataSource5" CellPadding="3" CssClass="grid" 
                    GridLines="Horizontal" Width="957px" BackColor="White" 
                    BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
                        <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" 
                            SortExpression="BirthDate" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>

                <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" 
                    CellPadding="3" DataKeyNames="ID" DataSourceID="AccessDataSource6" 
                    GridLines="Horizontal" Height="50px" Width="954px" BackColor="White" 
                    BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
                        <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" 
                            SortExpression="BirthDate" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                        <asp:BoundField DataField="StudyType" HeaderText="StudyType" 
                            SortExpression="StudyType" />
                        <asp:BoundField DataField="School" HeaderText="School" 
                            SortExpression="School" />
                        <asp:BoundField DataField="Average" HeaderText="Average" 
                            SortExpression="Average" />
                        <asp:BoundField DataField="AccepNumber" HeaderText="AccepNumber" 
                            SortExpression="AccepNumber" />
                        <asp:BoundField DataField="AcceptInDepartment" HeaderText="AcceptInDepartment" 
                            SortExpression="AcceptInDepartment" />
                        <asp:BoundField DataField="RegDate" HeaderText="RegDate" 
                            SortExpression="RegDate" />
                    </Fields>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                </asp:DetailsView>

                <asp:AccessDataSource ID="AccessDataSource5" runat="server" DataFile="~/App_Data/electronic.accdb" 
                    OldValuesParameterFormatString="original_{0}" 
                    
                    SelectCommand="SELECT [ID], [Name], [Sex], [BirthDate], [City] FROM [Students]">
                </asp:AccessDataSource>
                <asp:AccessDataSource ID="AccessDataSource6" runat="server" 
                    DataFile="~/App_Data/electronic.accdb" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT * FROM [Students] WHERE ([ID] = ?)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView3" DefaultValue="0" Name="ID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </asp:View>
        </asp:MultiView>


        
        
    
    </div>
    </form>
</body>
</html>

<%@ Page Title="About Us" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="About.aspx.vb" Inherits="ElectronicAcception.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style>
        input
        {
            font-size:60px;
            padding:8px;
            text-align:center;
            font-weight:bold;
        }
        #dvForm
        {
            text-align:center;
        }
        .detailsView
        {
            display:inline-table;
            margin-top:20px;
        }
        .detailsView td:first-child{font-weight:600; text-align:justify}
    </style>
    <script src="Scripts/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="Scripts/element.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        About your Acception
    </h2>
    <p>Put your Accept Number to see your collage</p>
    <div id="dvForm">
        <inputx name="accNum" placeholder="000000" maxlength="6" />
        <asp:TextBox ID="AccNumber" runat="server" TextMode=SingleLine MaxLength=6 required=""></asp:TextBox>
        <br /><br />
        <button>Display</button>
    

    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/electronic.accdb" 
        SelectCommand="SELECT Universities.Name, Universities.Logo, Universities.Adderss, Universities.EstablishmentDate, Depatrments.Name AS Expr1, Depatrments.MinAvg, Students.Name AS Expr2, Students.Sex, Students.BirthDate, Students.City, Students.Average, Students.RegDate FROM ((Depatrments INNER JOIN Students ON Depatrments.ID = Students.AcceptInDepartment) INNER JOIN Universities ON Depatrments.University = Universities.ID) WHERE (Students.AccepNumber = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="AccNumber" DefaultValue="0" Name="?" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataSourceID="AccessDataSource1" ForeColor="Black" 
        GridLines="Horizontal" Height="50px" Width="405px" CssClass="detailsView">
        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:TemplateField InsertVisible="False">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Logo") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="University" SortExpression="Name" />
            <asp:BoundField DataField="Adderss" HeaderText="Adderss" />
            <asp:BoundField DataField="EstablishmentDate" HeaderText="Established in Year" />
            <asp:BoundField DataField="Expr1" HeaderText="Department" />
            <asp:BoundField DataField="MinAvg" HeaderText="Minimum Average" />
            <asp:BoundField DataField="Expr2" HeaderText="You" />
            <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
            <asp:BoundField DataField="BirthDate" HeaderText="Your Birth Date"/>
            <asp:BoundField DataField="City" HeaderText="Your City" SortExpression="City" />
            <asp:BoundField DataField="Average" HeaderText="Your Average" />
            <asp:BoundField DataField="RegDate" HeaderText="You Registered at"  />
        </Fields>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
    </asp:DetailsView>
    </div>
</asp:Content>

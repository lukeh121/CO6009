<%@ Page Title=" Asset+ | Support " Language="C#" MasterPageFile="~/UserArea/userMaster.Master" AutoEventWireup="true" CodeBehind="supportHelpdesk.aspx.cs" Inherits="OSS_Asset_Management.UserArea.supportHelpdesk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titleBodyPlaceHolder" runat="server">
    <h1 class ="pageTitle"> Support</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="userBodyPlaceHolder" runat="server">
    <h2><asp:Label ID="lblUserName" runat="server" Text="User"></asp:Label>'s Individual Helpdesk Tickets: </h2>
    <a href="../UserArea/supportTicket.aspx">+Create New Support Ticket</a>
    <asp:GridView ID="gridTickets" runat="server" AutoGenerateColumns="False" DataKeyNames="tID" DataSourceID="viewTickets" OnRowDataBound="gridTickets_RowDataBound">
        <Columns>
            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
            <asp:BoundField DataField="tID" HeaderText="Ticket ID" InsertVisible="False" ReadOnly="True" SortExpression="tID" />
            <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
            <asp:BoundField DataField="UserName" HeaderText="Logged By" SortExpression="UserName" />
            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
            <asp:BoundField DataField="completedBy" HeaderText="Support Completed By" SortExpression="completedBy" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="viewTickets" runat="server" ConnectionString="<%$ ConnectionStrings:assetuserConnectionString %>" SelectCommand="SELECT [status], [tID], [category], [UserName], [description], [completedBy] FROM [tblSupport]
WHERE UserName LIKE @loggedInUser">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblUserName" Name="loggedInUser" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

<%@ Page Title=" Asset+ | Support " Language="C#" MasterPageFile="~/UserArea/userMaster.Master" AutoEventWireup="true" CodeBehind="supportHelpdesk.aspx.cs" Inherits="OSS_Asset_Management.UserArea.supportHelpdesk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titleBodyPlaceHolder" runat="server">
    <h1 class ="pageTitle"> Support</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="userBodyPlaceHolder" runat="server">
    <h2> Your Individual Helpdesk Tickets: </h2>
    <a href="../UserArea/supportTicket.aspx">+Create New Support Ticket</a>
    <asp:GridView ID="gridTickets" runat="server" AutoGenerateColumns="False" DataKeyNames="tID" DataSourceID="viewTickets">
        <Columns>
            <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
            <asp:BoundField DataField="tID" HeaderText="tID" InsertVisible="False" ReadOnly="True" SortExpression="tID" />
            <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
            <asp:BoundField DataField="completedBy" HeaderText="completedBy" SortExpression="completedBy" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="viewTickets" runat="server" ConnectionString="<%$ ConnectionStrings:assetuserConnectionString %>" SelectCommand="SELECT [status], [tID], [category], [UserName], [description], [completedBy] FROM [tblSupport]"></asp:SqlDataSource>
</asp:Content>

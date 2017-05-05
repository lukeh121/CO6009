<%@ Page Title=" Asset+ | Home " Language="C#" MasterPageFile="~/UserArea/userMaster.Master" AutoEventWireup="true" CodeBehind="userDefault.aspx.cs" Inherits="OSS_Asset_Management.UserArea._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="titleContent" ContentPlaceHolderID="titleBodyPlaceHolder" runat="server">
    <h1 class ="pageTitle"> Home </h1> <!-- style for title in defaultStyles.css -->
</asp:Content>
<asp:Content ID ="bodyContent" ContentPlaceHolderID="userBodyPlaceHolder" runat="server"> <!-- User Body Placeholder -->
         <h1 class ="welcomeMessage"> Welcome <asp:Label ID="lblfName" runat="server" Text=""></asp:Label> </h1>
    <p> Welcome To Asset+ The Open Source Asset Management System</p>
    <div id=" assetPossesion">
        <h3> Notifications: </h3>
        <asp:GridView ID="gridPossesion" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="nTitle" HeaderText="Title" SortExpression="nTitle" />
                <asp:BoundField DataField="nBody" HeaderText="Body" SortExpression="nBody" />
                <asp:BoundField DataField="nDate" HeaderText="Date" SortExpression="nDate" />
            </Columns>
        </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:assetuserConnectionString %>" SelectCommand="SELECT [nTitle], [nBody], [nDate] FROM [tblNotifications]"></asp:SqlDataSource>
        
    </div>
</asp:Content>


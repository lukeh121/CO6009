<%@ Page Title="Asset+ | Create New Asset" Language="C#" MasterPageFile="~/UserArea/userMaster.Master" AutoEventWireup="true" CodeBehind="createAsset.aspx.cs" Inherits="OSS_Asset_Management.UserArea.createAsset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titleBodyPlaceHolder" runat="server">
    <h1 class ="pageTitle"> Create New Asset </h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="userBodyPlaceHolder" runat="server">
    <h2> Asset Creation Tool</h2>
    <div id ="serialNum">
        <asp:Label ID="lblSerialNumber" runat="server" Text="Serial Number: " AssociatedControlID="txtSerialNum"></asp:Label><asp:TextBox ID="txtSerialNum" runat="server"></asp:TextBox>
    </div>
    <div id ="name">
        <asp:Label ID="lblName" runat="server" Text="Name:" AssociatedControlID="txtName"></asp:Label><asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    </div>
    <div id ="category">
        <asp:Label ID="lblCategory" runat="server" Text="Category: " AssociatedControlID="drpCategory"></asp:Label><asp:DropDownList ID="drpCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Category"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:userConnectionString %>" SelectCommand="SELECT * FROM [tblCategory] ORDER BY [Category]"></asp:SqlDataSource>
    </div>
    <div id ="qty">
        <asp:Label ID="lblQty" runat="server" Text="Quantity: " AssociatedControlID="txtQty"></asp:Label><asp:TextBox ID="txtQty" runat="server"></asp:TextBox>
    </div>
     <div id ="description">
        <asp:Label ID="lblDescription" runat="server" Text="Description: " AssociatedControlID="txtQty"></asp:Label><asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
    </div>
    <div id="submit">
        <asp:Button ID="btnSubmit" runat="server" Text="Button" />
    </div>
</asp:Content>

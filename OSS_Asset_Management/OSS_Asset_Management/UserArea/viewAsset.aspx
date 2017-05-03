<%@ Page Title=" Asset+ | View Asset " Language="C#" MasterPageFile="~/UserArea/userMaster.Master" AutoEventWireup="true" CodeBehind="viewAsset.aspx.cs" Inherits="OSS_Asset_Management.UserArea.viewAsset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titleBodyPlaceHolder" runat="server">
    <h1 class ="pageTitle"> View Asset </h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="userBodyPlaceHolder" runat="server">
    <h2> Asset Record </h2>
    <asp:Label ID="lblAsset" runat="server" Text="Label"></asp:Label>
</asp:Content>

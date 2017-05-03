<%@ Page Title=" Asset+ | Asset Catalogue " Language="C#" MasterPageFile="~/UserArea/userMaster.Master" AutoEventWireup="true" CodeBehind="assetCatalogue.aspx.cs" Inherits="OSS_Asset_Management.UserArea.assetCatalogue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titleBodyPlaceHolder" runat="server">
     <h1 class ="pageTitle"> Asset Catalogue </h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="userBodyPlaceHolder" runat="server">
    <h2> Complete Asset Register </h2>
    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
</asp:Content>

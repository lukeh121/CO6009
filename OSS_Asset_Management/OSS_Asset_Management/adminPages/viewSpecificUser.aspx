<%@ Page Title="Asset+ | View " Language="C#" MasterPageFile="~/UserArea/userMaster.Master" AutoEventWireup="true" CodeBehind="viewSpecificUser.aspx.cs" Inherits="OSS_Asset_Management.adminPages.viewSpecificUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titleBodyPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="userBodyPlaceHolder" runat="server">
    <a href="viewUserList.aspx"> < Back To Users List </a>
      <h1 class="pageTitle">User Profile: </h1>
    <asp:Literal ID="litUserName" runat="server"></asp:Literal>
</asp:Content>


<%@ Page Title=" Asset+ | Admin Tools" Language="C#" MasterPageFile="~/adminPages/adminMstr.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="OSS_Asset_Management.adminPages.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <h1 class ="pageTitle"> Administrator Tools </h1>
    <nav>
        <ul>
            <li><a class="admin" href = "createUser.aspx"> Create User </a></li>
            <li><a class="admin" href = "deleteUser.aspx"> Remove User Access </a></li>
        </ul>
    </nav>
</asp:Content>

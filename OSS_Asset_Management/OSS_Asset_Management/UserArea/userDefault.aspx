<%@ Page Title=" Asset+ | Home " Language="C#" MasterPageFile="~/UserArea/userMaster.Master" AutoEventWireup="true" CodeBehind="userDefault.aspx.cs" Inherits="OSS_Asset_Management.UserArea._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="titleContent" ContentPlaceHolderID="titleBodyPlaceHolder" runat="server">
    <h1 class ="pageTitle"> Home </h1> <!-- style for title in defaultStyles.css -->
</asp:Content>
<asp:Content ID ="bodyContent" ContentPlaceHolderID="userBodyPlaceHolder" runat="server"> <!-- User Body Placeholder -->
      <h1 class ="welcomeMessage"> Welcome <asp:Label ID="lblfName" runat="server" Text=""></asp:Label> </h1>
</asp:Content>


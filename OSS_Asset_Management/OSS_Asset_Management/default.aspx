<%@ Page Title="" Language="C#" MasterPageFile="~/defaultMaster.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="OSS_Asset_Management._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <div class="loginCard">
      <p class="loginText"> Welcome To Asset+ </p>
      <p class="loginText"> Please Enter Your Login Credentials</p>
      
           <div id="username">
             <asp:Label ID="lblUser" runat="server" Text="Username: " AssociatedControlID="txtUser" CssClass="labelFields"></asp:Label>
             <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
           </div>
            <div id ="password">
             <asp:Label ID="lblPassword" runat="server" Text="Password: " AssociatedControlID="txtPassword" CssClass="labelFields"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
           </div>
        
  </div>



</asp:Content>

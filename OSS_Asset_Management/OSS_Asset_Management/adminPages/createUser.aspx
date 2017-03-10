<%@ Page Title=" Asset+ | Create User " Language="C#" MasterPageFile="~/adminPages/adminMstr.Master" AutoEventWireup="true" CodeBehind="createUser.aspx.cs" Inherits="OSS_Asset_Management.adminPages.createUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <h1 class="pageTitle"> User Creation </h1>
    <div id="userCreation">
        <div class="successLiteral">
             <asp:literal runat="server" ID="registerLiteral"></asp:literal>
        </div>
       
        <div id="user">
            <asp:TextBox ID="txtNewUser" runat="server" CssClass="txtBoxNewLogin"></asp:TextBox>
        </div>
        <div id="name">
           <asp:TextBox ID="txtName" runat="server" CssClass="txtBoxNewLogin"></asp:TextBox>
        </div>
        <div id ="userEmail">
             <asp:TextBox ID="txtEmail" runat="server" CssClass="txtBoxNewLogin"></asp:TextBox>
        </div>
        <div id="pass">
             <asp:TextBox ID="txtNewPassword" runat="server" CssClass="txtBoxNewLogin"></asp:TextBox>
        </div>
       
        <div id ="registerButton">
            <asp:Button ID="btnRegister" runat="server" Text="Submit" CssClass="btnSubmit" OnClick="btnRegister_Click"/>
        </div>

        

    </div>
</asp:Content>

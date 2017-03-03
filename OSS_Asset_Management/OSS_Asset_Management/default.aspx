<%@ Page Title=" Asset+ | Login " Language="C#" MasterPageFile="~/defaultMaster.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="OSS_Asset_Management._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <div class="loginCard">
       <div id="loginContainer">
          <p class="loginText"> <span id="loginGreeting">Welcome To Asset+ </span></p>
          <p class="loginText"> Please Enter Your Login Credentials</p>
      
           <div id="username">
             <asp:TextBox ID="txtUser" runat="server" CssClass="txtBoxLogin"></asp:TextBox>
           </div>
            <div id ="password">
            <asp:TextBox ID="txtPassword" runat="server" CssClass="txtBoxLogin" TextMode="Password"></asp:TextBox>
           </div>
             <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btnLogin" OnClick="btnLogin_Click"/>
           <div class="errorLit">
             <asp:Literal ID="litError" runat="server" ></asp:Literal> 
           </div>
       </div>
</div>




</asp:Content>

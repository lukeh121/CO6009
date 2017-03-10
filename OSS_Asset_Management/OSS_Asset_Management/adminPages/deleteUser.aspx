<%@ Page Title="Asset+ | DeleteUser" Language="C#" MasterPageFile="~/adminPages/adminMstr.Master" AutoEventWireup="true" CodeBehind="deleteUser.aspx.cs" Inherits="OSS_Asset_Management.adminPages.deleteUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    
     <h1 class="pageTitle"> Remove User Access </h1>
    <div id="removeUserCard">
        <div id="litDel"><asp:Literal ID="litDelete" runat="server"></asp:Literal></div>
        <p class="LoginText"> To Delete A User Complete The Form Below: </p>
        <asp:Label ID="lblSelectUser" runat="server" Text="Select User:  " AssociatedControlID="drpSelectUser"></asp:Label>
        <asp:DropDownList ID="drpSelectUser" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="deleteUserDSource" DataTextField="fullName" DataValueField="fullName" OnSelectedIndexChanged="drpSelectUser_SelectedIndexChanged">
            <asp:ListItem>-Select User-</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="deleteUserDSource" runat="server" ConnectionString="<%$ ConnectionStrings:userConnectionString %>" SelectCommand="SELECT fullName FROM tblUserNameToName"></asp:SqlDataSource>
        <div id="uName">
        <asp:Label ID="lblUserName" runat="server" Text="Username:  " AssociatedControlID="txtUserName"></asp:Label>
        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
        </div>
        <div id="submit">
            <asp:Button ID="btnDelete" runat="server" Text="Submit" OnClick="btnDelete_Click" />
        </div>
     </div>    
</asp:Content>

<%@ Page Title="Asset+ | Support Ticket" Language="C#" MasterPageFile="~/UserArea/userMaster.Master" AutoEventWireup="true" CodeBehind="supportTicket.aspx.cs" Inherits="OSS_Asset_Management.UserArea.supportTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titleBodyPlaceHolder" runat="server">
    <h1 class="pageTitle"> Support </h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="userBodyPlaceHolder" runat="server">
    <h2> Create Support Ticket </h2>
    <div class ="successLiteral">
    <asp:Literal ID="litSuccess" runat="server"></asp:Literal>
    </div>
    <table>

    <tr>
    <div id ="category">
       <td> <asp:Label ID="lblCat" runat="server" Text="Category: "></asp:Label></td>
       <td> <asp:DropDownList ID="drpCategory" runat="server" DataSourceID="viewCategory" DataTextField="Category" DataValueField="Category" AppendDataBoundItems="True">
           <asp:ListItem>-Select-</asp:ListItem>
           </asp:DropDownList>
         <asp:SqlDataSource ID="viewCategory" runat="server" ConnectionString="<%$ ConnectionStrings:assetuserConnectionString %>" SelectCommand="SELECT * FROM [tblCategory]"></asp:SqlDataSource>
        </td>
    </div>

    </tr>
    <tr>
    <div id ="user">
       <td> <asp:Label ID="lblUser" runat="server" Text="Username: "></asp:Label></td>
       <td> <asp:TextBox ID="txtUser" runat="server"></asp:TextBox></td>
    </div>
    </tr>
    <tr>
    <div id="description">
       <td><asp:Label ID="lblDescription" runat="server" Text="Description of Request: "></asp:Label></td>
       <td><asp:TextBox ID="txtDesc" runat="server" Height="78px" TextMode="MultiLine" Width="256px"></asp:TextBox></td>
    </div>
    </tr>
        <tr>
            <td></td>
            <td> <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /> </td>
        </tr>
        </table>
</asp:Content>

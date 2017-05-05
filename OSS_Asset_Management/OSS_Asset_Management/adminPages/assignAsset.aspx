<%@ Page Title=" Asset+ | Assign Device" Language="C#" MasterPageFile="~/UserArea/userMaster.Master" AutoEventWireup="true" CodeBehind="assignAsset.aspx.cs" Inherits="OSS_Asset_Management.adminPages.assignAsset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titleBodyPlaceHolder" runat="server">
    <h1 class="pageTitle">Assign Device</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="userBodyPlaceHolder" runat="server">
    <h2>Assign Device To User: </h2>
    <div class="successLiteral">
    <asp:Literal ID="successLiteral" runat="server"></asp:Literal>

    </div>
    <div id ="category">
        <asp:Label ID="lblCategory" runat="server" Text="Category: " AssociatedControlID="drpCategory"></asp:Label>
        <asp:DropDownList ID="drpCategory" runat="server" DataSourceID="categorySelection" DataTextField="Category" DataValueField="Category" AutoPostBack="True" OnSelectedIndexChanged="drpCategory_SelectedIndexChanged" AppendDataBoundItems="True">
            <asp:ListItem>-Select Category-</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="categorySelection" runat="server" ConnectionString="<%$ ConnectionStrings:assetuserConnectionString %>" SelectCommand="SELECT * FROM [tblCategory]"></asp:SqlDataSource>
    </div>
    <div id ="selectAsset">
         <asp:Label ID="lblSelectAsset" runat="server" Text="Select Asset: " AssociatedControlID="drpAsset"></asp:Label>
        <asp:DropDownList ID="drpAsset" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="assetName" DataValueField="assetName"></asp:DropDownList>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:assetuserConnectionString %>" SelectCommand="Select assetName from dbo.tblAssets 
Inner Join dbo.tblAssetAvailability
On dbo.tblAssetAvailability.aID = dbo.tblAssets.aID
where category like @category and dbo.tblAssetAvailability.availability like 'Available'">
             <SelectParameters>
                 <asp:ControlParameter ControlID="drpCategory" Name="category" PropertyName="SelectedValue" />
             </SelectParameters>
         </asp:SqlDataSource>
    </div>
    <asp:Label ID="lblUser" runat="server" Text="Select User:"></asp:Label>
    <asp:DropDownList ID="drpUser" runat="server" AppendDataBoundItems="True" DataSourceID="selectUser" DataTextField="fullName" DataValueField="fullName">
        <asp:ListItem>-Select-</asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="selectUser" runat="server" ConnectionString="<%$ ConnectionStrings:assetuserConnectionString %>" SelectCommand="SELECT [fullName] FROM [tblUserNameToName]"></asp:SqlDataSource>
    <div>
    <asp:Label ID="lblReturnDate" runat="server" Text="Return Date: "></asp:Label>
    <asp:TextBox ID="txtReturnDate" runat="server"></asp:TextBox>

    </div>
    <div> 
    <asp:Button ID="btnAssign" runat="server" Text="Assign Asset" OnClick="btnAssign_Click" />
   </div>
</asp:Content>

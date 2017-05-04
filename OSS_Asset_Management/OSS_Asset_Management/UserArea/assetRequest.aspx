<%@ Page Title="Asset+ | Asset Request" Language="C#" MasterPageFile="~/UserArea/userMaster.Master" AutoEventWireup="true" CodeBehind="assetRequest.aspx.cs" Inherits="OSS_Asset_Management.UserArea.assetRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titleBodyPlaceHolder" runat="server">
    <h1 class ="pageTitle"> Request an Asset</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="userBodyPlaceHolder" runat="server">
    <h2> Asset Request Form </h2>
    <div class ="successLiteral">
            <asp:Literal ID="successLiteral" runat="server"></asp:Literal>
    </div>
    <div id ="user">
        <asp:Label ID="lblUser" runat="server" Text="User: " AssociatedControlID="txtUser"></asp:Label><asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
    </div>
    <div id ="fullName">
        <asp:Label ID="lblfName" runat="server" Text="Full Name:" AssociatedControlID="txtfName"></asp:Label><asp:TextBox ID="txtfName" runat="server"></asp:TextBox>
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
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:assetuserConnectionString %>" SelectCommand="Select assetName from dbo.tblAssets where category like @category">
             <SelectParameters>
                 <asp:ControlParameter ControlID="drpCategory" Name="category" PropertyName="SelectedValue" />
             </SelectParameters>
         </asp:SqlDataSource>
    </div>
    <div id ="qty">
        <asp:Label ID="lblQty" runat="server" Text="Quantity: " AssociatedControlID="txtQty"></asp:Label><asp:TextBox ID="txtQty" runat="server"></asp:TextBox>
    </div>

     <div id ="date">
        <asp:Label ID="lblRDate" runat="server" Text="Required Date: " AssociatedControlID="txtQty"></asp:Label>
            <asp:TextBox ID="txtDate" runat="server" OnTextChanged="txtDate_TextChanged"></asp:TextBox>
    </div>
    <div id ="duration">
        <asp:Label ID="lblDuration" runat="server" Text="Duration In Days:  " AssociatedControlID="txtQty"></asp:Label>
            <asp:TextBox ID="txtDuration" runat="server" OnTextChanged="txtDate_TextChanged"></asp:TextBox>
    </div>
    <div id="calculatedReturn"><asp:Label ID="lblReturnDate" runat="server" Text="Exected Return Date:" AssociatedControlID="txtExpectedReturnDate"></asp:Label>
        <asp:TextBox ID="txtExpectedReturnDate" runat="server" OnTextChanged="txtExpectedReturnDate_TextChanged"></asp:TextBox>
         <asp:Button ID="btnCalReturn" runat="server" OnClick="Button1_Click" Text="Calculate Return"  />
    </div>
    <div id="submit">
        
        <asp:Button ID="btnSubmit" runat="server" Text="Create Asset" CssClass="btnSubmit" OnClick="btnSubmit_Click"/>
    </div>
</asp:Content>

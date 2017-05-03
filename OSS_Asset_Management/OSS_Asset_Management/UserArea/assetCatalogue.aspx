<%@ Page Title=" Asset+ | Asset Catalogue " Language="C#" MasterPageFile="~/UserArea/userMaster.Master" AutoEventWireup="true" CodeBehind="assetCatalogue.aspx.cs" Inherits="OSS_Asset_Management.UserArea.assetCatalogue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titleBodyPlaceHolder" runat="server">
     <h1 class ="pageTitle"> Asset Catalogue </h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="userBodyPlaceHolder" runat="server">
    <h2> Complete Asset Register </h2>
    <asp:GridView ID="gridCatalogue" runat="server" AutoGenerateColumns="False" DataKeyNames="aID" DataSourceID="SqlDataSource1" CssClass="grid">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="aID" DataNavigateUrlFormatString="viewAsset.aspx?aID={0}" Text="View" />
            <asp:BoundField DataField="aID" HeaderText="Asset ID" InsertVisible="False" ReadOnly="True" SortExpression="aID" />
            <asp:BoundField DataField="serialNo" HeaderText="Serial Number" SortExpression="serialNo" />
            <asp:BoundField DataField="assetName" HeaderText="Name" SortExpression="assetName" />
            <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
            <asp:BoundField DataField="manufacturer" HeaderText="Manufacturer" SortExpression="manufacturer" />
            <asp:BoundField DataField="model" HeaderText="Model" SortExpression="model" />
            <asp:BoundField DataField="qty" HeaderText="Quantity" SortExpression="qty" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:userConnectionString %>" SelectCommand="SELECT * FROM [tblAssets]"></asp:SqlDataSource>
</asp:Content>

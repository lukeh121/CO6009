<%@ Page Title=" Asset+ | Search " Language="C#" MasterPageFile="~/UserArea/userMaster.Master" AutoEventWireup="true" CodeBehind="searchAsset.aspx.cs" Inherits="OSS_Asset_Management.UserArea.searchAsset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titleBodyPlaceHolder" runat="server">
     <h1 class ="pageTitle"> Home </h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="userBodyPlaceHolder" runat="server">
    <h2> Search The Asset Catalogue</h2>
    <div id = "sID">
        <asp:Label ID="lblID" runat="server" Text="Search By ID:" AssociatedControlID="txtID"></asp:Label>
        <asp:TextBox ID="txtID" runat="server"></asp:TextBox><asp:Button ID="btnID" runat="server" Text="Search" OnClick="btnID_Click" />
    </div>
    <div id ="sName">
        <asp:Label ID="lblName" runat="server" Text="Search By Name:" AssociatedControlID="txtName"></asp:Label>
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox><asp:Button ID="btnName" runat="server" Text="Search" OnClick="btnName_Click" />
    </div>
    <div id="sCategory">
        <asp:Label ID="lblCat" runat="server" Text="Search By Category:" AssociatedControlID="txtCat"></asp:Label>
        <asp:DropDownList ID="txtCat" runat="server" DataSourceID="displayCategory" DataTextField="Category" DataValueField="Category"></asp:DropDownList>
        <asp:SqlDataSource ID="displayCategory" runat="server" ConnectionString="<%$ ConnectionStrings:assetuserConnectionString %>" SelectCommand="SELECT * FROM [tblCategory]"></asp:SqlDataSource>
        <asp:Button ID="btnCat" runat="server" Text="Seach" OnClick="btnCat_Click" />
    </div>
    <div id ="sLocation">
        <asp:Label ID="lblLoc" runat="server" Text="Search By Location:" AssociatedControlID="txtLoc"></asp:Label>
        <asp:TextBox ID="txtLoc" runat="server"></asp:TextBox><asp:Button ID="btnLoc" runat="server" Text="Search" OnClick="btnLoc_Click" />
    </div>
    <div id ="grids">
        <asp:GridView ID="gridSID" runat="server" Visible="False" AutoGenerateColumns="False" DataKeyNames="aID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="aID" HeaderText="aID" InsertVisible="False" ReadOnly="True" SortExpression="aID" />
                <asp:BoundField DataField="assetName" HeaderText="assetName" SortExpression="assetName" />
                <asp:BoundField DataField="availability" HeaderText="availability" SortExpression="availability" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:assetuserConnectionString %>" SelectCommand="Select dbo.tblAssets.aID , dbo.tblAssets.assetName , dbo.tblAssetAvailability.availability 
From dbo.tblAssets
Inner Join dbo.tblAssetAvailability
On tblAssets.aID = tblAssetAvailability.aID
Where tblAssets.aID LIKE @aIDVal;">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtID" Name="aIDVal" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="gridSName" runat="server" Visible="False" AutoGenerateColumns="False" DataKeyNames="aID" DataSourceID="searchName">
            <Columns>
                <asp:BoundField DataField="aID" HeaderText="aID" InsertVisible="False" ReadOnly="True" SortExpression="aID" />
                <asp:BoundField DataField="assetName" HeaderText="assetName" SortExpression="assetName" />
                <asp:BoundField DataField="availability" HeaderText="availability" SortExpression="availability" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="searchName" runat="server" ConnectionString="<%$ ConnectionStrings:assetuserConnectionString %>" SelectCommand="Select dbo.tblAssets.aID , dbo.tblAssets.assetName , dbo.tblAssetAvailability.availability 
From dbo.tblAssets
Inner Join dbo.tblAssetAvailability
On tblAssets.aID = tblAssetAvailability.aID
Where tblAssets.assetName LIKE @searchName;">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtName" Name="searchName" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="gridSCat" runat="server" Visible="false"></asp:GridView>
        <asp:GridView ID="gridSLoc" runat="server" Visible="false"></asp:GridView>
    </div>
</asp:Content>

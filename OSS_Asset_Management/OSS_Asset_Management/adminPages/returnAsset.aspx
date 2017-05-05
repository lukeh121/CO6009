<%@ Page Title=" Asset+ | Return Device " Language="C#" MasterPageFile="~/UserArea/userMaster.Master" AutoEventWireup="true" CodeBehind="returnAsset.aspx.cs" Inherits="OSS_Asset_Management.adminPages.returnAsset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titleBodyPlaceHolder" runat="server">
    <h1 class="returnAsset"> Return Asset </h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="userBodyPlaceHolder" runat="server">
    <asp:GridView ID="gridReturn" runat="server" AutoGenerateColumns="False" DataSourceID="returnAssetGrid" OnSelectedIndexChanged="gridReturn_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Return Asset To Inventory" />
            <asp:BoundField DataField="aID" HeaderText="Asset ID" SortExpression="aID" />
            <asp:BoundField DataField="availability" HeaderText="Availability" SortExpression="availability" />
            <asp:BoundField DataField="fullName" HeaderText="User " SortExpression="fullName" />
            <asp:BoundField DataField="loanDate" HeaderText="Date of Loan" SortExpression="loanDate" />
            <asp:BoundField DataField="returnDate" HeaderText="Return Date" SortExpression="returnDate" />
        </Columns>
    </asp:GridView>
    
    <asp:SqlDataSource ID="returnAssetGrid" runat="server" ConnectionString="<%$ ConnectionStrings:assetuserConnectionString %>" SelectCommand="SELECT [aID], [availability], [fullName], [loanDate], [returnDate] FROM [tblAssetAvailability]"></asp:SqlDataSource>
    
</asp:Content>

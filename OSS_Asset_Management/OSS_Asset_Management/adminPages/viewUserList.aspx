<%@ Page Title=" Asset+ | View Users " Language="C#" MasterPageFile="~/UserArea/userMaster.Master" AutoEventWireup="true" CodeBehind="viewUserList.aspx.cs" Inherits="OSS_Asset_Management.adminPages.viewUserList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titleBodyPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="userBodyPlaceHolder" runat="server">
     <h1 class="pageTitle"> Current Users </h1>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:userConnectionString %>" SelectCommand="SELECT DISTINCT tblUserNameToName.fullName, AspNetUsers.UserName, AspNetUsers.Email FROM tblUserNameToName INNER JOIN AspNetUsers ON AspNetUsers.UserName = tblUserNameToName.UserName"></asp:SqlDataSource>

    <asp:GridView ID="gridUsers" runat="server" AutoGenerateColumns="False" CellSpacing="-1" CssClass="gridUsers" DataSourceID="SqlDataSource1" GridLines="None" OnSelectedIndexChanged="OnSelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="fullName" HeaderText="Full Name" SortExpression="fullName" />
            <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:TemplateField>
             <ItemTemplate>  
                            <asp:Button ID="btnSelect" runat="server" Width="60" Text="Select" CommandName="selectButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                 </ItemTemplate>
        </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageRoles.aspx.cs" Inherits="Acreageway.ManageRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Button ID="Addrole" runat="server" Text="Add Role" OnClick="Addrole_Click" />
    <asp:Button ID="AddUserRole" runat="server" Text="Add User Role" OnClick="AddUserRole_Click" />
</asp:Content>

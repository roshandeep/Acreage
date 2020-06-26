<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="Acreageway.UserDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        <tr>
            <td>
                <asp:Button ID="btn_Investments" runat="server" Text="Investments" OnClick="btn_Investments_Click" Enabled="false"/>
            </td>
            <td>
                <asp:Button ID="btn_kyc" runat="server" Text="KYC" OnClick="btn_kyc_Click" />
            </td>
            <td>
                <asp:Button ID="btn_fav" runat="server" Text="Favourites" OnClick="btn_fav_Click" Enabled="false"/>
            </td>
            <td>
                <asp:Button ID="btn_opportunities" runat="server" Text="Favourites" OnClick="btn_opportunities_Click" Enabled="false"/>
            </td>
        </tr>
    </table>
</asp:Content>

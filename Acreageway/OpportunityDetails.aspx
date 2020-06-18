<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OpportunityDetails.aspx.cs" Inherits="Acreage.OpportunityDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <table>
        <tr>
            <td>Name : </td>
            <td>
                <asp:Label ID="lbl_name" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>Overview </td>
            <td>
                <asp:Label ID="lbl_short_desc" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>Detail </td>
            <td>
                <asp:Label ID="lbl_long_desc" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>Category : </td>
            <td>
                <asp:Label ID="lbl_category" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>Type Of Security :  </td>
            <td>
                <asp:Label ID="lbl_type_of_security" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>Offering Type :  </td>
            <td>
                <asp:Label ID="lbl_offeringType" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Image ID="img_Logo" runat="server" Style="width: 100px; height: 100px;" /></td>
        </tr>
        <tr>
            <td>Created By : </td>
            <td>
                <asp:Label ID="lbl_created_by" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>Created TimeStamp : </td>
            <td>
                <asp:Label ID="lbl_created_timestamp" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>Valid Upto : </td>
            <td>
                <asp:Label ID="lbl_expiry_timestamp" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>Total Amount : </td>
            <td>
                <asp:Label ID="lbl_total_amt" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>Amount Raised : </td>
            <td>
                <asp:Label ID="lbl_amt_left" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>Price Per Security : </td>
            <td>
                <asp:Label ID="lbl_price_per_security" runat="server" Text="" Font-Bold="true"></asp:Label>
        </tr>
        <tr>
            <td>Minimum Investment Per Investor : </td>
            <td>
                <asp:Label ID="lbl_minimum_investment_per_investor" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>Total Number Of Investors : </td>
            <td>
                <asp:Label ID="lbl_total_investors" runat="server" Text="" Font-Bold="true" /></td>
        </tr>
        <tr>
            <td>
                <div class="progress">
                    <div id="progress_bar" class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%" runat="server">
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btn_Back" runat="server" Text="Back" OnClick="btn_Back_Click" />
            </td>
            <td>
                <asp:Button ID="btn_Invest" runat="server" Text="Invest" OnClick="btn_Invest_Click" />
                <asp:Button ID="btn_favourite" runat="server" Text="Favourite" OnClick="btn_favourite_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

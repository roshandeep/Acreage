<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InvestInOpportunity.aspx.cs" Inherits="Acreageway.InvestInOpportunity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <div class="container" id="display-container" style="margin-top: 5rem; border: 10px solid #ddd; border-radius: 5px; padding: 4rem;">
        <div class="col-sm-6" style="float: left;">
            <asp:Image ID="img_Logo" runat="server" Style="width: 100%; height: 100%;" />
        </div>

        <div class="col-sm-6" style="float: right">
            <table>
                <tr class="row" style="text-align: center; color: White; text-transform: capitalize;">
                    <td>
                        <asp:Label ID="lbl_name" runat="server" Text="" Font-Bold="true" Style="margin: 0 auto" /></td>
                </tr>
                <tr class="row">
                    <td class="col-sm-6" id="opportunitydetailidtwo">Overview :</td>
                    <td class="col-sm-6">
                        <asp:Label ID="lbl_short_desc" runat="server" Text="" Font-Bold="true" /></td>
                </tr>
                <tr class="row">
                    <td class="col-sm-6" id="opportunitydetailidtwo">Detail :</td>
                    <td class="col-sm-6">
                        <asp:Label ID="lbl_long_desc" runat="server" Text="" Font-Bold="true" /></td>
                </tr>
                <tr class="row">
                    <td class="col-sm-6" id="opportunitydetailidtwo">Total Amount : </td>
                    <td class="col-sm-6">
                        <asp:Label ID="lbl_total_amt" runat="server" Text="" Font-Bold="true" /></td>
                </tr>
                <tr class="row">
                    <td class="col-sm-6" id="opportunitydetailidtwo">Amount Raised : </td>
                    <td class="col-sm-6">
                        <asp:Label ID="lbl_amt_left" runat="server" Text="" Font-Bold="true" /></td>
                </tr>
                <tr class="row">
                    <td class="col-sm-6" id="opportunitydetailidtwo">Minimum Investment Per Investor : </td>
                    <td class="col-sm-6">
                        <asp:Label ID="lbl_minimum_investment_per_investor" runat="server" Text="" Font-Bold="true" /></td>
                </tr>
                <tr class="row">
                    <td class="col-sm-6">
                        <div class="progress">
                            <div id="progress_bar" class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%" runat="server">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr class="row">
                    <td class="col-sm-6" id="opportunitydetailidtwo">Enter the Amount you would like to invest : </td>
                    <td class="col-sm-6">
                        <asp:TextBox ID="txt_investAmt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="txt_investAmt" ErrorMessage="*" ForeColor="Red" />
                    </td>
                </tr>
                <tr class="row">
                    <td class="col-sm-4">
                        <asp:Button ID="btn_return" runat="server" Text="Return" OnClick="btn_return_Click" />
                    </td>
                    <td class="col-sm-4">
                        <asp:Button ID="btn_Invest" runat="server" Text="Invest" OnClick="btn_Invest_Click" />
                    </td>
                    <td class="col-sm-4">
                        <asp:Label ID="lbl_msg" runat="server" Text="" Font-Bold="true" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

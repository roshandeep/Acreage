<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OpportunityDetails.aspx.cs" Inherits="Acreageway.OpportunityDetails" %>
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
                    <td class="col-sm-6" id="opportunitydetailidtwo">Category : </td>
                    <td class="col-sm-6">
                        <asp:Label ID="lbl_category" runat="server" Text="" Font-Bold="true" /></td>
                </tr>
                <tr class="row">
                    <td class="col-sm-6" id="opportunitydetailidtwo">Type Of Security :  </td>
                    <td class="col-sm-6">
                        <asp:Label ID="lbl_type_of_security" runat="server" Text="" Font-Bold="true" /></td>
                </tr>
                <tr class="row">
                    <td class="col-sm-6" id="opportunitydetailidtwo">Offering Type :  </td>
                    <td class="col-sm-6">
                        <asp:Label ID="lbl_offeringType" runat="server" Text="" Font-Bold="true" /></td>
                </tr>

                <tr class="row">
                    <td class="col-sm-6" id="opportunitydetailidtwo">Created By : </td>
                    <td class="col-sm-6">
                        <asp:Label ID="lbl_created_by" runat="server" Text="" Font-Bold="true" /></td>
                </tr>
                <tr class="row">
                    <td class="col-sm-6" id="opportunitydetailidtwo">Created TimeStamp : </td>
                    <td class="col-sm-6">
                        <asp:Label ID="lbl_created_timestamp" runat="server" Text="" Font-Bold="true" /></td>
                </tr>
                <tr class="row">
                    <td class="col-sm-6" id="opportunitydetailidtwo">Valid Upto : </td>
                    <td class="col-sm-6">
                        <asp:Label ID="lbl_expiry_timestamp" runat="server" Text="" Font-Bold="true" /></td>
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
                    <td class="col-sm-6" id="opportunitydetailidtwo">Price Per Security : </td>
                    <td class="col-sm-6">
                        <asp:Label ID="lbl_price_per_security" runat="server" Text="" Font-Bold="true"></asp:Label>
                </tr>
                <tr class="row">
                    <td class="col-sm-6" id="opportunitydetailidtwo">Minimum Investment Per Investor : </td>
                    <td class="col-sm-6">
                        <asp:Label ID="lbl_minimum_investment_per_investor" runat="server" Text="" Font-Bold="true" /></td>
                </tr>
                <tr class="row">
                    <td class="col-sm-6" id="opportunitydetailidtwo">Total Number Of Investors : </td>
                    <td class="col-sm-6">
                        <asp:Label ID="lbl_total_investors" runat="server" Text="" Font-Bold="true" /></td>
                </tr>
                <tr class="row">
                    <td class="col-sm-6">
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
                        <asp:Button ID="btn_favourite" runat="server" Text="Favourite"/>
                    </td>
                </tr>
            </table>
        </div>
    </div>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btn_favourite" PopupControlID="Panel1" CancelControlID="btn_DoNotAccept"></ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" align="center" Style="display: none">
        <div style="height: 60px; background-color: aliceblue;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div>
                        By submitting this form, the Client(s) certify that all information disclosed in this form is complete and true and acknowledge that such information shall be deemed complete, true and unchanged until such time as Durham Asset Management Inc. is advised in writing by the Client(s) of any change pertaining thereto. The Client(s) certify that it is their responsibility to notify Durham Asset Management Inc. of any changes to the above information.
                
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <asp:Button runat="server" ID="btn_Accept" Text="Accept" OnClick="btn_Accept_Click"/>
        <asp:Button runat="server" ID="btn_DoNotAccept" Text="DoNotAccept"/>
    </asp:Panel>
</asp:Content>

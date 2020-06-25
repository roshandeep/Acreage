<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserKYCDetails.aspx.cs" Inherits="Acreageway.UserKYCDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div runat="server" id="kyc_table"> 
        <table border="1" style="margin: auto auto; padding: 10px;">
            <tr>
                <td>
                    <asp:Label ID="Kyc_ID" runat="server" Text="KYC ID" Font-Bold="true"/>
                </td>
                <td>
                    <asp:Label ID="lbl_kyc_id" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="UserType" runat="server" Text="User Type" Font-Bold="true"/>
                </td>
                <td>
                    <asp:Label ID="lbl_user_type" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Full_Name" runat="server" Text="Full Name" Font-Bold="true"/>
                </td>
                <td>
                    <asp:Label ID="lbl_fullname" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="marital_status" runat="server" Text="Marital Status" Font-Bold="true"/>
                </td>
                <td>
                    <asp:Label ID="lbl_marital_status" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="email_address" runat="server" Text="Email Address" Font-Bold="true"/>
                </td>
                <td>
                    <asp:Label ID="lbl_email_address" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="dob" runat="server" Text="Date Of Birth" Font-Bold="true"/>
                </td>
                <td>
                    <asp:Label ID="lbl_date_of_birth" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="phone_no" runat="server" Text="Phone No" Font-Bold="true"/>
                </td>
                <td>
                    <asp:Label ID="lbl_phone_no" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="mailing_address" runat="server" Text="Mailing Address" Font-Bold="true"/>
                </td>
                <td>
                    <asp:Label ID="lbl_mailing_address" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="city" runat="server" Text="City" Font-Bold="true"/>
                </td>
                <td>
                    <asp:Label ID="lbl_city" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="province" runat="server" Text="Province" Font-Bold="true"/>
                </td>
                <td>
                    <asp:Label ID="lbl_province" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="postal_code" runat="server" Text="Postal Code" Font-Bold="true"/>
                </td>
                <td>
                    <asp:Label ID="lbl_postal_code" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="country" runat="server" Text="Country" Font-Bold="true"/>
                </td>
                <td>
                    <asp:Label ID="lbl_country" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="residential_address" runat="server" Text="Residential Address" Font-Bold="true"/>
                </td>
                <td>
                    <asp:Label ID="lbl_residential_address" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="residential_city" runat="server" Text="City" Font-Bold="true"/>
                </td>
                <td>
                    <asp:Label ID="lbl_residential_city" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="residential_province" runat="server" Text="Province" Font-Bold="true"/>
                </td>
                <td>
                    <asp:Label ID="lbl_residential_province" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="residential_postal_code" runat="server" Text="Postal Code" Font-Bold="true"/>
                </td>
                <td>
                    <asp:Label ID="lbl_residential_postal_code" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="kyc_timestamp" runat="server" Text="KYC Timestamp" Font-Bold="true"/>
                </td>
                <td>
                    <asp:Label ID="lbl_kyc_timestamp" runat="server" Text="" />
                </td>
            </tr>
        </table>
    </div>
    <div>
        <table>
            <tr>
                <td>
                <asp:Label ID="lbl_msg" runat="server" Text=""></asp:Label>
                    </td>
            </tr>
            <tr>
                <td>
                <asp:Button ID="btn_return" runat="server" Text="Return" OnClick="btn_return_Click" />
                    </td>
            </tr>
        </table>
    </div>
</asp:Content>

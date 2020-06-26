<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserFavourites.aspx.cs" Inherits="Acreageway.UserFavourites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center;">
        <asp:DataList ID="rpt_UserfavOpportunity" runat="server">
            <HeaderTemplate>
                <table border="1" style="margin: auto auto; padding: 10px;">
                    <tr>
                        <th>
                            <asp:Label ID="lbl_th_oppotunity_name" runat="server" Text="Opportunity Name" />
                        </th>
                        <th>
                            <asp:Label ID="lbl_th_opportunity_status" runat="server" Text="Opportunity Status" />
                        </th>
                        <th>
                            <asp:Label ID="lbl_th_total_amt" runat="server" Text="Total Amount" />
                        </th>
                        <th>
                            <asp:Label ID="lbl_th_amt_left" runat="server" Text="Amount Left" />
                        </th>
                        <th>
                            <asp:Label ID="lbl_th_offering_type" runat="server" Text="Offering Type" />
                        </th>
                        <th>
                            <asp:Label ID="lbl_th_type_of_security" runat="server" Text="Type Of Security" />
                        </th>
                        <th>
                            <asp:Label ID="lbl_th_price_per_security" runat="server" Text="Price Per Security" />
                        </th>
                        <th>
                            <asp:Label ID="lbl_th_category" runat="server" Text="Category" />
                        </th>
                        <th>
                            <asp:Label ID="lbl_th_short_desc" runat="server" Text="Description" />
                        </th>
                        <th>
                            <asp:Label ID="lbl_th_date_favourited" runat="server" Text="Date Favourited" />
                        </th>
                        <th>
                            <asp:Label ID="img_th_Logo" runat="server" Text="Logo"/>
                        </th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="lbl_oppotunity_name" runat="server" Text='<%# Eval("oppotunity_name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lbl_opportunity_status" runat="server" Text='<%# Eval("opportunity_status") %>' />
                    </td>
                    <td>
                        $<asp:Label ID="lbl_total_amt" runat="server" Text='<%# Eval("total_amt") %>' />
                    </td>
                    <td>
                        $<asp:Label ID="lbl_amt_left" runat="server" Text='<%# Eval("amt_left") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lbl_offering_type" runat="server" Text='<%# Eval("offering_type") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lbl_type_of_security" runat="server" Text='<%# Eval("type_of_security") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lbl_price_per_security" runat="server" Text='<%# Eval("price_per_security") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lbl_category" runat="server" Text='<%# Eval("category") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lbl_short_desc" runat="server" Text='<%# Eval("short_desc") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lbl_date_favourited" runat="server" Text='<%# Eval("date_favourited") %>' />
                    </td>
                    <td>
                        <asp:Image ID="img_Logo" runat="server" ImageUrl='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("image_data")) %>' Width="100" Height="100"/>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:DataList>
    </div>
    <div>
        <asp:Button ID="btn_return" runat="server" Text="Return" OnClick="btn_return_Click"/>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OpportunityList.aspx.cs" Inherits="Acreageway.OpportunityList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div style="text-align: center;">
            <asp:Button ID="btn_Add" runat="server" Text="Add Opportunities" OnClick="btn_Add_Click" Enabled="false" Visible="false" />
            <asp:DataList ID="rpt_Opportunity" runat="server">
                <HeaderTemplate>
                    <table cellspacing="2" border="1" style="margin: auto auto;">
                        <tr>
                            <th>
                                <asp:Label ID="lbl_th_name" runat="server" Text="Name" /></th>
                            <th>
                                <asp:Label ID="lbl_th_details" runat="server" Text="Details" /></th>
                            <th>
                                <asp:Label ID="lbl_th_crtd" runat="server" Text="Created By" /></th>
                            <th>
                                <asp:Label ID="lbl_th_totcap" runat="server" Text="Total Capital" /></th>
                            <th>
                                <asp:Label ID="lbl_th_amt" runat="server" Text="Amount To Be Raised" /></th>
                            <%-- <th runat="server" id="fav_th">
                            <asp:Label ID="lbl_th_fav" runat="server" Text="Add To Favoutites" /></th>--%>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# string.Format("~/OpportunityDetails.aspx?Id={0}&Name={1}",HttpUtility.UrlEncode(Eval("opportunity_id").ToString()), HttpUtility.UrlEncode(Eval("oppotunity_name").ToString())) %>' Text='<%# Eval("oppotunity_name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lbl_Details" runat="server" Text='<%# Eval("short_desc") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lbl_createdBy" runat="server" Text='<%# Eval("created_by") %>' />
                        </td>
                        <td>$<asp:Label ID="lbl_totalCapital" runat="server" Text='<%# Eval("total_amt") %>' />
                        </td>
                        <td>$<asp:Label ID="lbl_amountRaised" runat="server" Text='<%# Eval("amt_left") %>' />
                        </td>
                        <%--<td>
                        <asp:LinkButton ID="lnk_favourite" runat="server" OnCommand="lnk_favourite_Command" CommandName="favourite" Text='<%# Eval("Isfavourite") %>' CommandArgument='<%# Eval("opportunity_id") %>'></asp:LinkButton>
                    </td>--%>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:DataList>
            <asp:Label ID="lbl_msg" runat="server"></asp:Label>
        </div>
    </section>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OpportunityList.aspx.cs" Inherits="Acreage.OpportunityList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <asp:Repeater ID="rpt_Opportunity" runat="server" OnItemDataBound="rpt_Opportunity_ItemDataBound">
            <HeaderTemplate>
                <table cellspacing="2" border="1">
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
                        <th runat="server" id="fav_th">
                            <asp:Label ID="lbl_th_fav" runat="server" Text="Add To Favoutites" /></th>
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
                    <td>
                        <asp:LinkButton ID="lnk_favourite" runat="server" OnCommand="lnk_favourite_Command" CommandName="favourite" Text='<%# Eval("Isfavourite") %>' CommandArgument='<%# Eval("opportunity_id") %>'></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:Label ID="lbl_msg" runat="server"></asp:Label>
    </div>
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="HiddenTargetControlForModalPopup" PopupControlID="Panel1" CancelControlID="btn_DoNotAccept"></ajaxToolkit:ModalPopupExtender>
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
        <asp:Button runat="server" ID="HiddenTargetControlForModalPopup" Style="display: none" />
    </asp:Panel>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OpportunityList.aspx.cs" Inherits="Acreageway.OpportunityList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="slider1 slider cid-s2j9GcazEP" id="slider1-5">
        <div class="container">
            <div class="slider-box">
                <amp-carousel class="carousel" height="300" layout="fixed-height" type="carousel">
                <div class="carousel-img mbr-col-sm-12">
                    <amp-img class="mobirise-loader" src="assets/images/05.jpg" alt="Mobirise" width="450" height="300" layout="responsive">
                        <div placeholder="" class="placeholder">
                                <div class="mobirise-spinner">
                                    <em></em>
                                    <em></em>
                                    <em></em>
                                </div></div>
                        
                    </amp-img>
                </div><div class="carousel-img mbr-col-sm-12">
                    <amp-img class="mobirise-loader" src="assets/images/01.jpg" alt="Mobirise" width="450" height="300" layout="responsive">
                            <div placeholder="" class="placeholder">
                                <div class="mobirise-spinner">
                                    <em></em>
                                    <em></em>
                                    <em></em>
                                </div></div>
                            
                    </amp-img>
                </div><div class="carousel-img mbr-col-sm-12">
                    <amp-img class="mobirise-loader" src="assets/images/02.jpg" alt="Mobirise" width="450" height="300" layout="responsive">
                        <div placeholder="" class="placeholder">
                                <div class="mobirise-spinner">
                                    <em></em>
                                    <em></em>
                                    <em></em>
                                </div></div>
                        
                    </amp-img>
                </div><div class="carousel-img mbr-col-sm-12">
                    <amp-img class="mobirise-loader" src="assets/images/03.jpg" alt="Mobirise" width="450" height="300" layout="responsive">
                        <div placeholder="" class="placeholder">
                                <div class="mobirise-spinner">
                                    <em></em>
                                    <em></em>
                                    <em></em>
                                </div></div>
                        
                    </amp-img>
                </div><div class="carousel-img mbr-col-sm-12">
                    <amp-img class="mobirise-loader" src="assets/images/mbr-900x600.jpg" alt="Mobirise" width="450" height="300" layout="responsive">
                        <div placeholder="" class="placeholder">
                                <div class="mobirise-spinner">
                                    <em></em>
                                    <em></em>
                                    <em></em>
                                </div></div>
                        
                    </amp-img>
                </div><div class="carousel-img mbr-col-sm-12">
                    <amp-img class="mobirise-loader" src="assets/images/mbr-900x557.jpg" alt="Mobirise" width="484.73967684021545" height="300" layout="responsive">
                        <div placeholder="" class="placeholder">
                                <div class="mobirise-spinner">
                                    <em></em>
                                    <em></em>
                                    <em></em>
                                </div></div>
                        
                    </amp-img>
                </div>
                </amp-carousel>
            </div>
        </div>
    </section>
    <section>
        <div>
            <asp:Repeater ID="rpt_Opportunity" runat="server">
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
            </asp:Repeater>
            <asp:Label ID="lbl_msg" runat="server"></asp:Label>
        </div>
    </section>

    <section class="engine"><a href="https://mobirise.info/c">website builder</a></section>
    <section class="clients cid-s14EDXQOL0" data-interval="false" id="clients-a">
        <div class="container mb-5">
            <div class="media-container-row">
                <div class="col-12 align-center">
                    <h2 class="mbr-section-title pb-3 mbr-fonts-style display-2">Our Partners &amp; Clients</h2>
                    <h3 class="mbr-section-subtitle mbr-light mbr-fonts-style display-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Recusandae cupiditate rerum ipsum tempora vero. Fugit facilis possimus assumenda ipsa, sapiente eius sunt fuga saepe nemo. Necessitatibus consequuntur, recusandae consequatur suscipit.</h3>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="carousel slide" role="listbox" data-pause="true" data-keyboard="false" data-ride="carousel" data-interval="5000">
                <div class="carousel-inner" data-visible="5">
                    <div class="carousel-item ">
                        <div class="media-container-row">
                            <div class="col-md-12">
                                <div class="wrap-img ">
                                    <img src="assets/images/1.png" class="img-responsive clients-img">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item ">
                        <div class="media-container-row">
                            <div class="col-md-12">
                                <div class="wrap-img ">
                                    <img src="assets/images/2.png" class="img-responsive clients-img">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item ">
                        <div class="media-container-row">
                            <div class="col-md-12">
                                <div class="wrap-img ">
                                    <img src="assets/images/3.png" class="img-responsive clients-img">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item ">
                        <div class="media-container-row">
                            <div class="col-md-12">
                                <div class="wrap-img ">
                                    <img src="assets/images/4.png" class="img-responsive clients-img">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item ">
                        <div class="media-container-row">
                            <div class="col-md-12">
                                <div class="wrap-img ">
                                    <img src="assets/images/5.png" class="img-responsive clients-img">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-controls">
                    <a data-app-prevent-settings="" class="carousel-control carousel-control-prev" role="button" data-slide="prev">
                        <span aria-hidden="true" class="mbri-left mbr-iconfont"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a data-app-prevent-settings="" class="carousel-control carousel-control-next" role="button" data-slide="next">
                        <span aria-hidden="true" class="mbri-right mbr-iconfont"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

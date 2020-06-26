<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Acreageway._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
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
                                </div>
                        </div>
                    </amp-img>
                </div>
                </amp-carousel>
            </div>
        </div>
    </section>
    <div style="text-align: center;">
        <asp:Button ID="btn_ViewAll" runat="server" Text="View All >>" OnClick="btn_ViewAll_Click"/>
        <asp:DataList ID="Repeater1" RepeatDirection="Horizontal" runat="server">
            <ItemTemplate>
                <div>
                    <a href='<%# string.Format("OpportunityDetails.aspx?Id={0}&Name={1}",HttpUtility.UrlEncode(Eval("opportunity_id").ToString()), HttpUtility.UrlEncode(Eval("oppotunity_name").ToString())) %>'>
                        <asp:Image ID="img_Logo" alt='<%#Eval("opportunity_imgName")%>' ImageUrl='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("image_data")) %>' runat="server" Width="200" Height="200" />
                    </a>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
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
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="lnkDummy" PopupControlID="Panel2" CancelControlID="btn_close"></ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="Panel2" runat="server" align="center" Style="display: none">
        <div style="height: 60px; background-color: aliceblue; border: 2px double;">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div>
                        Welcome, <%: Context.User.Identity.GetUserName()  %> !
                        <br />
                        Yor KYC is done and is awaiting Admin Approval. Kindly proceed ahead to iew exsisting proposals.
                       Happy Investments
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
        <asp:Button runat="server" ID="btn_close" Text="Close" />
    </asp:Panel>
</asp:Content>

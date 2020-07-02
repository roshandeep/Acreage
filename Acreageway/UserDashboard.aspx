<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="Acreageway.UserDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        form {
            margin-top: -5.4rem;
        }

        #container body-content {
            width: 100%;
        }

        body {
            width: 100%;
        }
    </style>
    <section class="header12 cid-s22LhUYpgP mbr-fullscreen mbr-parallax-background" id="header12-i" style="background-image: url(./assets/images/background1.jpg);">
        <div class="mbr-overlay">
        </div>
        <div class="container">
            <div class="media-container">
                <div class="col-md-12 align-center">

                    <div class="icons-media-container mbr-white">
                        <div class="card col-12 col-md-6 col-lg-3" id="div_investments" runat="server" visible="false">
                            <div class="icon-block">
                                <asp:Button ID="btn_Investments" runat="server" Text="Investments" OnClick="btn_Investments_Click" Visible="false" class="mbr-fonts-style display-5" style="font-size: 2rem;background: black;"/>
                            <span class="mbri-layers mbr-iconfont" style="font-size: x-large;"></span>
                            </div>
                        </div>
                        <div class="card col-12 col-md-6 col-lg-3" runat="server">
                            <div class="icon-block">
                                <asp:Button ID="btn_kyc" runat="server" Text="KYC" OnClick="btn_kyc_Click" class="mbr-fonts-style display-5" style="font-size: 2rem;background: black;"/>
                                <span class="mbri-sun mbr-iconfont" style="font-size: x-large;"></span>
                            </div>
                        </div>
                        <div class="card col-12 col-md-6 col-lg-3" id="div_fav" runat="server" visible="false">
                            <div class="icon-block">
                                <asp:Button ID="btn_fav" runat="server" Text="Favourites" OnClick="btn_fav_Click" Visible="false" class="mbr-fonts-style display-5" style="font-size: 2rem; background: black;"/>
                                <span class="mbri-cash mbr-iconfont" style="font-size: x-large"></span>
                            </div>
                        </div>
                        <div class="card col-12 col-md-6 col-lg-3" id="div_opportunities" runat="server" visible="false">
                            <div class="icon-block">
                                <asp:Button ID="btn_opportunities" runat="server" Text="Opportunities" OnClick="btn_opportunities_Click" Visible="false" class="mbr-fonts-style display-5" style="font-size: 2rem;background: black;"/>
                                <span class="mbr-iconfont mbrib-hearth" style="font-size: x-large;"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

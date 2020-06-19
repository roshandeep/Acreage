<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="SuitabilityTest1.aspx.cs" Inherits="Acreageway.SuitabilityTest1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h4>Suitablity Profile</h4>
    <table class="container">
        <tr class="row">
            <td class="col-md-6">
                <asp:Label ID="lbl_investmentKnow" runat="server" Text="Investment Knowledge "></asp:Label>
            </td>
            <td class="col-md-6">
                <asp:DropDownList ID="ddl_investmentKnow" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Sophisticated" Value="Sophisticated"></asp:ListItem>
                    <asp:ListItem Text="Good" Value="Good"></asp:ListItem>
                    <asp:ListItem Text="Limited/Poor" Value="Limited/Poor"></asp:ListItem>
                    <asp:ListItem Text="None" Value="None"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_investmentKnow" ControlToValidate="ddl_investmentKnow" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
        </tr>
        <tr class="row">
            <td class="col-md-6">
                <asp:Label ID="lbl_RiskTolerance" runat="server" Text="Risk Tolerance "></asp:Label>
            </td>
            <td class="col-md-6">
                <asp:DropDownList ID="ddl_riskTolerance" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="--SELECT--" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="High" Value="High"></asp:ListItem>
                    <asp:ListItem Text="Medium" Value="Medium"></asp:ListItem>
                    <asp:ListItem Text="Low To Medium" Value="Low To Medium"></asp:ListItem>
                    <asp:ListItem Text="Low" Value="Low"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_riskTolerance" ControlToValidate="ddl_riskTolerance" ErrorMessage="* Required" ForeColor="Red" InitialValue="--SELECT--" />
            </td>
        </tr>
        <tr class="row">
            <td class="col-md-6">
                <asp:Label ID="lbl_Income" runat="server" Text="Income "></asp:Label>
            </td>
            <td class="col-sm-6">
                <asp:DropDownList ID="ddl_income" runat="server" OnSelectedIndexChanged="ddl_income_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Text="--SELECT--" Value="--SELECT--" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="1st Priority" Value="1st Priority"></asp:ListItem>
                    <asp:ListItem Text="2nd Priority" Value="2nd Priority"></asp:ListItem>
                    <asp:ListItem Text="3rd Priority" Value="3rd Priority"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_income" ControlToValidate="ddl_income" ErrorMessage="* Required" ForeColor="Red" InitialValue="--SELECT--" />

            </td>
        </tr>
        <tr class="row" >
            <td class="col-sm-6">
                <asp:Label ID="lbl_Balance" runat="server" Text="Balance "></asp:Label>
            </td>
            <td class="col-sm-6">
                <asp:DropDownList ID="ddl_Balance" runat="server" OnSelectedIndexChanged="ddl_Balance_SelectedIndexChanged" AutoPostBack="true" Enabled="false">
                    <asp:ListItem Text="--SELECT--" Value="--SELECT--" Selected="True"></asp:ListItem>
                     <asp:ListItem Text="1st Priority" Value="1st Priority"></asp:ListItem>
                    <asp:ListItem Text="2nd Priority" Value="2nd Priority"></asp:ListItem>
                    <asp:ListItem Text="3rd Priority" Value="3rd Priority"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_Balance" ControlToValidate="ddl_Balance" ErrorMessage="* Required" ForeColor="Red" InitialValue="--SELECT--" />

            </td>
        </tr>
        <tr class="row">
            <td class="col-sm-6">
                <asp:Label ID="lbl_Growth" runat="server" Text="Growth "></asp:Label>
            </td>
            <td class="col-sm-6">
                <asp:DropDownList ID="ddl_Growth" runat="server" OnSelectedIndexChanged="ddl_Growth_SelectedIndexChanged" AutoPostBack="true" Enabled="false">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                     <asp:ListItem Text="1st Priority" Value="1st Priority"></asp:ListItem>
                    <asp:ListItem Text="2nd Priority" Value="2nd Priority"></asp:ListItem>
                    <asp:ListItem Text="3rd Priority" Value="3rd Priority"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_Growth" ControlToValidate="ddl_Growth" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />

            </td>
        </tr>
        <tr class="row">
            <td class="col-sm-6">
                <asp:Button ID="btn_Save" runat="server" Text="Save" OnClick="btn_Save_Click"/>
            </td>
            <td class="col-sm-6">
                <asp:Button ID="btn_Next" runat="server" Text="Next" OnClick="btn_Next_Click" Enabled="false"/>
            </td>
        </tr>
    </table>
</asp:Content>

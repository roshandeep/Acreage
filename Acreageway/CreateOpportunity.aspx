<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateOpportunity.aspx.cs" Inherits="Acreageway.CreateOpportunity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/jquery-3.3.1.intellisense.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <link href="Scripts/jquery-ui.theme.css" rel="stylesheet" />
    <link href="Scripts/jquery-ui.structure.css" rel="stylesheet" />
    <link href="Scripts/jquery-ui.css" rel="stylesheet" />
    <script>
        var dateToday = new Date();
        $(function () {
            $("#<%= txt_startdate.ClientID %>").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    minDate: dateToday,
                });
        })
        $(function () {
            $("#<%= txt_enddate.ClientID %>").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    minDate: dateToday,
                });
        })
    </script>
    <table style="margin-top:30px;">
        <tr>
            <td>
                <asp:Label ID="lbl_oppotunity_name" runat="server" Text="Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_oppotunity_name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_oppotunity_name" ControlToValidate="txt_oppotunity_name" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_offeringType" runat="server" Text="Offering Type"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_offeringType" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Equity" Value="Equity"></asp:ListItem>
                    <asp:ListItem Text="Debt" Value="Debt"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_offeringType" ControlToValidate="ddl_offeringType" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_type_of_security" runat="server" Text="Financial Assets "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_type_of_security" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Regular Shares" Value="Regular Shares"></asp:ListItem>
                    <asp:ListItem Text="Preffered Shares" Value="Preffered Shares"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_type_of_security" ControlToValidate="ddl_type_of_security" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_category" runat="server" Text="Category"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_category" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Fund" Value="Fund"></asp:ListItem>
                    <asp:ListItem Text="MIC" Value="MIC"></asp:ListItem>
                    <asp:ListItem Text="StartUp" Value="StartUp"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_category" ControlToValidate="ddl_category" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_short_desc" runat="server" Text="Short Description"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_short_desc" runat="server" TextMode="MultiLine" Width="400px" Height="100px"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_risktolerance" ControlToValidate="txt_short_desc" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_long_desc" runat="server" Text="Long Description"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_long_desc" runat="server" TextMode="MultiLine" Width="400px" Height="200px"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_long_desc" ControlToValidate="txt_long_desc" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:FileUpload ID="fu_logo" runat="server" ToolTip="Select Only JPEG/PNG File" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_startdate" runat="server" Text="Start date"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_startdate" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_enddate" runat="server" Text="End date"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_enddate" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_totalamount" runat="server" Text="Total Amount"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_totalamount" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator runat="server" ID="rexNumber" ControlToValidate="txt_totalamount" ValidationExpression="^[0-9]*$" ErrorMessage="Please enter numeric value!" ForeColor="Red" Display="Dynamic" EnableClientScript="true" />
                <asp:RequiredFieldValidator runat="server" ID="req_totalamount" ControlToValidate="txt_totalamount" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_price_per_security" runat="server" Text="Price Per Security"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_price_per_security" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="txt_price_per_security" ValidationExpression="^[0-9]*$" ErrorMessage="Please enter numeric value!" ForeColor="Red" Display="Dynamic" EnableClientScript="true" />
                <asp:RequiredFieldValidator runat="server" ID="req_price_per_security" ControlToValidate="txt_price_per_security" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_minimum_investment_per_investor" runat="server" Text="Minimum Investment Per Investor"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_minimum_investment_per_investor" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ControlToValidate="txt_minimum_investment_per_investor" ValidationExpression="^[0-9]*$" ErrorMessage="Please enter numeric value!" ForeColor="Red" Display="Dynamic" EnableClientScript="true" />
                <asp:RequiredFieldValidator runat="server" ID="req_minimum_investment_per_investor" ControlToValidate="txt_minimum_investment_per_investor" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_total_investors" runat="server" Text="Total Number Of Investors"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_total_investors" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ControlToValidate="txt_total_investors" ValidationExpression="^[0-9]*$" ErrorMessage="Please enter numeric value!" ForeColor="Red" Display="Dynamic" EnableClientScript="true" />
                <asp:RequiredFieldValidator runat="server" ID="req_total_investors" ControlToValidate="txt_total_investors" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btn_Create" runat="server" Text="Create" OnClick="btn_Create_Click" />
                <asp:Label ID="lbl_msg" runat="server" Text=""></asp:Label>
            </td>
            <td>
                <asp:Button ID="btn_Return" runat="server" Text="Return" OnClick="btn_Return_Click" CausesValidation="false"/>
            </td>
        </tr>
    </table>
</asp:Content>

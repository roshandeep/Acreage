<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="KYC.aspx.cs" Inherits="Acreageway.KYC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

        $(function () {
            $("[id*=chkbx_address]").click(function () {

                var req_resAddress = document.getElementById('<%= req_resAddress.ClientID %>');
                var req_resProvince = document.getElementById('<%= req_resProvince.ClientID %>');
                var req_resCity = document.getElementById('<%= req_resCity.ClientID %>');
                var reg_resCity = document.getElementById('<%= reg_resCity.ClientID %>');
                var req_resPostalCode = document.getElementById('<%= req_resPostalCode.ClientID %>');
                var reg_resPostalCode = document.getElementById('<%= reg_resPostalCode.ClientID %>');

                if ($(this).is(":checked")) {
                    $('#<%= residential_address1.ClientID %>').hide();
                    $('#<%= residential_address2.ClientID %>').hide();
                    //alert("checked");
                    ValidatorEnable($('#<%= req_resAddress.ClientID %>'), false);
                    ValidatorEnable($('#<%= req_resProvince.ClientID %>'), false);
                    ValidatorEnable($('#<%= req_resCity.ClientID %>'), false);
                    ValidatorEnable($('#<%= reg_resCity.ClientID %>'), false);
                    ValidatorEnable($('#<%= req_resPostalCode.ClientID %>'), false);
                    ValidatorEnable($('#<%= reg_resPostalCode.ClientID %>'), false);

                } else {
                    $('#<%= residential_address1.ClientID %>').show();
                    $('#<%= residential_address2.ClientID %>').show();
                    //alert("unchecked");
                    ValidatorEnable($('#<%= req_resAddress.ClientID %>'), true);
                    ValidatorEnable($('#<%= req_resProvince.ClientID %>'), true);
                    ValidatorEnable($('#<%= req_resCity.ClientID %>'), true);
                    ValidatorEnable($('#<%= reg_resCity.ClientID %>'), true);
                    ValidatorEnable($('#<%= req_resPostalCode.ClientID %>'), true);
                    ValidatorEnable($('#<%= reg_resPostalCode.ClientID %>'), true);
                }
            });
        });

        function SelectDate(e) {
            var PresentDay = new Date();
            var dateOfBirth = e.get_selectedDate();
            var months = (PresentDay.getMonth() - dateOfBirth.getMonth() + (12 * (PresentDay.getFullYear() - dateOfBirth.getFullYear())));
            var age = Math.round(months / 12);

            var txt_dob = document.getElementById('<%= txt_dob.ClientID %>');
            if (age < 18) {
                alert("You must be 18 Years of age");
                txt_dob.value = "";
            }
        }

        $(document).ready(function () {
            $('#<%=ddl_country.ClientID%>').on('change', function () {
                var ddlvalue = $(this).val();
                if (ddlvalue != 'Canada') {
                    alert('Currently the services are available only for Canadian investors');
                }
            });
        });
    </script>
    <style>
        form {
            background: black;
            color: #22C0A1;
        }

        #kycregistrationtable {
            margin-top: 5rem;
        }
    </style>
    <table id="kycregistrationtable" class="container">
        <tr class="row">

            <td class="col-sm-6">Name
            </td>
            <td class="col-sm-6">
                <asp:DropDownList ID="ddl_salutation" runat="server" Style="width: 12rem">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Mr." Value="Mr."></asp:ListItem>
                    <asp:ListItem Text="Mrs." Value="Mrs."></asp:ListItem>
                    <asp:ListItem Text="Ms." Value="Ms."></asp:ListItem>
                    <asp:ListItem Text="Dr." Value="Dr."></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_salutation" ControlToValidate="ddl_salutation" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />

                <asp:TextBox ID="txt_Fname" runat="server" placeholder="Firstname"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_Fname" ControlToValidate="txt_Fname" ErrorMessage="* Required" ForeColor="Red" />
                <asp:TextBox ID="txt_Lname" runat="server" placeholder="Lastname"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_Lname" ControlToValidate="txt_Lname" ErrorMessage="* Required" ForeColor="Red" />
            </td>

        </tr>
        <br />
        <tr class="row" style="margin-top: 1rem;">

            <td class="col-sm-6">Marital Status
            </td>
            <td class="col-sm-6">
                <asp:DropDownList ID="ddl_maritalStatus" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Single" Value="Single"></asp:ListItem>
                    <asp:ListItem Text="Married" Value="Married"></asp:ListItem>
                    <asp:ListItem Text="Common-Law Partner" Value="Common-Law Partner"></asp:ListItem>
                    <asp:ListItem Text="Separated" Value="Separated"></asp:ListItem>
                    <asp:ListItem Text="Divorced" Value="Divorced"></asp:ListItem>
                    <asp:ListItem Text="Widowed" Value="Widowed"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_maritalStatus" ControlToValidate="ddl_maritalStatus" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>



        </tr>

        <tr class="row">
            <td class="col-sm-6">Email
            </td>
            <td class="col-sm-6">
                <asp:TextBox ID="txt_email" runat="server" Style="width: 25rem"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_email" ControlToValidate="txt_email" ErrorMessage="* Required" ForeColor="Red" />
                <asp:RegularExpressionValidator ID="reg_email" runat="server" ErrorMessage="* Invalid Email Address" ControlToValidate="txt_email" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
            </td>
        </tr>

        <tr class="row">

            <td class="col-sm-6">Date Of Birth
            </td>
            <td class="col-sm-6">
                <asp:TextBox ID="txt_dob" runat="server" CssClass="disable_future_dates"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_dob" Format="MM/dd/yyyy" OnClientDateSelectionChanged="SelectDate" />
                <asp:RequiredFieldValidator runat="server" ID="req_dob" ControlToValidate="txt_dob" ErrorMessage="* Required" ForeColor="Red" />
            </td>
        </tr>

        <tr class="row">
            <td class="col-sm-6">Phone Number
            </td>
            <td class="col-sm-6">
                <asp:TextBox ID="txt_phoneNo" runat="server" placeholder="(xxx) (xxx) (xxxx)"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_phoneNo" ControlToValidate="txt_phoneNo" ErrorMessage="* Required" ForeColor="Red" />
                <asp:RegularExpressionValidator ID="reg_phoneNo" runat="server" ForeColor="Red" ControlToValidate="txt_phoneNo" ErrorMessage="Enter 10 digit Phone Number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr class="row">
            <td class="col-sm-6">Address
                <asp:CheckBox ID="chkbx_address" runat="server" Text="Mailing Address same as Residential Address" Checked="true" ClientIDMode="Static" />
            </td>
            <td class="col-sm-6">
                <asp:TextBox ID="txt_address" runat="server" placeholder="House No. / Street Name" Style="width: 25rem"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_address" ControlToValidate="txt_address" ErrorMessage="* Required" ForeColor="Red" />
            </td>
        </tr>
        <tr class="row">
            <td class="col-sm-6">Country
            </td>
            <td class="col-sm-6">
                <asp:DropDownList ID="ddl_country" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_country" ControlToValidate="ddl_country" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
        </tr>
        <tr class="row">
            <td class="col-sm-6">Province
            </td>
            <td class="col-sm-6">
                <asp:DropDownList ID="ddl_province" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Alberta" Value="Alberta"></asp:ListItem>
                    <asp:ListItem Text="British Columbia" Value="British Columbia"></asp:ListItem>
                    <asp:ListItem Text="Manitoba" Value="Manitoba"></asp:ListItem>
                    <asp:ListItem Text="New Brunswick" Value="New Brunswick"></asp:ListItem>
                    <asp:ListItem Text="Newfoundland and Labrador" Value="Newfoundland and Labrador"></asp:ListItem>
                    <asp:ListItem Text="Northwest Territories" Value="Northwest Territories"></asp:ListItem>
                    <asp:ListItem Text="Nova Scotia" Value="Nova Scotia"></asp:ListItem>
                    <asp:ListItem Text="Nunavut" Value="Nunavut"></asp:ListItem>
                    <asp:ListItem Text="Ontario" Value="Ontario"></asp:ListItem>
                    <asp:ListItem Text="Prince Edward Island" Value="Prince Edward Island"></asp:ListItem>
                    <asp:ListItem Text="Quebec" Value="Quebec"></asp:ListItem>
                    <asp:ListItem Text="Saskatchewan" Value="Saskatchewan"></asp:ListItem>
                    <asp:ListItem Text="Yukon" Value="Yukon"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_province" ControlToValidate="ddl_province" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" />
            </td>
        </tr>
        <tr class="row">
            <td class="col-sm-6">City
            </td>
            <td class="col-sm-6">
                <asp:TextBox ID="txt_city" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_city" ControlToValidate="txt_city" ErrorMessage="* Required" ForeColor="Red" />
                <asp:RegularExpressionValidator ID="reg_city" runat="server" ForeColor="Red" ControlToValidate="txt_city" ErrorMessage="Enter a Valid City name" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr class="row">
            <td class="col-sm-6">Postal Code
            </td>
            <td class="col-sm-6">
                <asp:TextBox ID="txt_postalCode" runat="server" placeholder="(xxx)(xxx)"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_postCode" ControlToValidate="txt_postalCode" ErrorMessage="* Required" ForeColor="Red" />
                <asp:RegularExpressionValidator ID="req_postalCode" runat="server" ForeColor="Red" ControlToValidate="txt_postalCode" ErrorMessage="Enter a Valid Postal Code" ValidationExpression="[a-zA-Z0-9 ]{6}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr id="residential_address1" style="display: none" runat="server" class="row">

            <td class="col-sm-6">Residential Address
            </td>
            <td class="col-sm-6">
                <asp:TextBox ID="txt_residentialaddress" runat="server" placeholder="House No. / Street Name" Style="width: 25rem"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_resAddress" ControlToValidate="txt_residentialaddress" ErrorMessage="* Required" ForeColor="Red" ClientIDMode="Static" Enabled="false" />
            </td>
            <td class="col-sm-6">Residential Province
            </td>
            <td class="col-sm-6">
                <asp:DropDownList ID="ddl_resProvince" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Alberta" Value="Alberta"></asp:ListItem>
                    <asp:ListItem Text="British Columbia" Value="British Columbia"></asp:ListItem>
                    <asp:ListItem Text="Manitoba" Value="Manitoba"></asp:ListItem>
                    <asp:ListItem Text="New Brunswick" Value="New Brunswick"></asp:ListItem>
                    <asp:ListItem Text="Newfoundland and Labrador" Value="Newfoundland and Labrador"></asp:ListItem>
                    <asp:ListItem Text="Northwest Territories" Value="Northwest Territories"></asp:ListItem>
                    <asp:ListItem Text="Nova Scotia" Value="Nova Scotia"></asp:ListItem>
                    <asp:ListItem Text="Nunavut" Value="Nunavut"></asp:ListItem>
                    <asp:ListItem Text="Ontario" Value="Ontario"></asp:ListItem>
                    <asp:ListItem Text="Prince Edward Island" Value="Prince Edward Island"></asp:ListItem>
                    <asp:ListItem Text="Quebec" Value="Quebec"></asp:ListItem>
                    <asp:ListItem Text="Saskatchewan" Value="Saskatchewan"></asp:ListItem>
                    <asp:ListItem Text="Yukon" Value="Yukon"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_resProvince" ControlToValidate="ddl_resProvince" ErrorMessage="* Required" ForeColor="Red" ClientIDMode="Static" Enabled="false" />
            </td>

        </tr>
        <tr id="residential_address2" style="display: none" runat="server" class="row">
            <td class="col-sm-6">Residential City
            </td>
            <td class="col-sm-6">
                <asp:TextBox ID="txt_resCity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_resCity" ControlToValidate="txt_resCity" ErrorMessage="* Required" ForeColor="Red" ClientIDMode="Static" Enabled="false" />
                <asp:RegularExpressionValidator ID="reg_resCity" runat="server" ForeColor="Red" ControlToValidate="txt_resCity" ErrorMessage="Enter a Valid City name" ValidationExpression="[a-zA-Z ]*$" ClientIDMode="Static" Enabled="false"></asp:RegularExpressionValidator>
            </td>
            <td class="col-sm-6">Residential Postal Code
            </td>
            <td class="col-sm-6">
                <asp:TextBox ID="txt_resPostalCode" runat="server" placeholder="(xxx)(xxx)"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_resPostalCode" ControlToValidate="txt_resPostalCode" ErrorMessage="* Required" ForeColor="Red" ClientIDMode="Static" Enabled="false" />
                <asp:RegularExpressionValidator ID="reg_resPostalCode" runat="server" ForeColor="Red" ControlToValidate="txt_resPostalCode" ErrorMessage="Enter a Valid Postal Code" ValidationExpression="[a-zA-Z0-9 ]{6}" ClientIDMode="Static" Enabled="false"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr class="row">
            <td class="col-sm-4">
                <asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" />
            </td>
            <td class="col-sm-4">
                <asp:Label ID="lbl_msg" runat="server" Text=""></asp:Label>
            </td>
            <td class="col-sm-4">
                <asp:Button ID="btn_return" runat="server" Text="Happy Investments! Proceed Ahead" OnClick="btn_return_Click" Visible="false" Enabled="false" />
            </td>
        </tr>
    </table>
</asp:Content>

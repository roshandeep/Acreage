<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Acreageway.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." SetFocusOnError="true" Text="*" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." SetFocusOnError="true" Text="*" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." Text="*" />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." SetFocusOnError="true" Text="*" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FirstName" CssClass="col-md-2 control-label">First Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName"
                    CssClass="text-danger" autocomplete="off" ErrorMessage="The first name field is required." SetFocusOnError="true" Text="*" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="LastName" CssClass="col-md-2 control-label">Last Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="LastName" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName"
                    CssClass="text-danger" autocomplete="off" ErrorMessage="The last name field is required." SetFocusOnError="true" Text="*" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="MailingAddress" CssClass="col-md-2 control-label">Mailing Address</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="MailingAddress" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="MailingAddress"
                    CssClass="text-danger" autocomplete="off" ErrorMessage="The mailing address field is required." SetFocusOnError="true" Text="*" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="City" CssClass="col-md-2 control-label">City</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="City" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="City"
                    CssClass="text-danger" autocomplete="off" ErrorMessage="The city field is required." SetFocusOnError="true" Text="*" />
            </div>
        </div>
        <%--<div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Province" CssClass="col-md-2 control-label">Province</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Province" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="City"
                    CssClass="text-danger" ErrorMessage="The province field is required." Text="*" />
            </div>
        </div>--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Province" CssClass="col-md-2 control-label">Province</asp:Label>
            <div class="col-md-2">
                <asp:DropDownList runat="server" ID="Province" CssClass="form-control" >
                    <asp:ListItem Value="0">--Select One--</asp:ListItem>
                    <asp:ListItem Value="AB">AB</asp:ListItem>
                    <asp:ListItem Value="BC">BC</asp:ListItem>
                    <asp:ListItem Value="MB">MB</asp:ListItem>
                    <asp:ListItem Value="NB">NB</asp:ListItem>
                    <asp:ListItem Value="NL">NL</asp:ListItem>
                    <asp:ListItem Value="NS">NS</asp:ListItem>
                    <asp:ListItem Value="ON">ON</asp:ListItem>
                    <asp:ListItem Value="PE">PE</asp:ListItem>
                    <asp:ListItem Value="QC">QC</asp:ListItem>
                    <asp:ListItem Value="SK">SK</asp:ListItem>
                    <asp:ListItem Value="NT">NT</asp:ListItem>
                    <asp:ListItem Value="NU">NU</asp:ListItem>
                    <asp:ListItem Value="YT">YT</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Province" InitialValue="0" ErrorMessage="The province field is required." CssClass="text-danger" Text="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="PostalCode" CssClass="col-md-2 control-label">Postal Code</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="PostalCode" CssClass="form-control" TextMode="SingleLine" MaxLength="7" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="PostalCode"
                    CssClass="text-danger" ErrorMessage="The postal code field is required." SetFocusOnError="true" Text="*" />
                <asp:RegularExpressionValidator runat="server" ValidationExpression="[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ] ?[0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]" 
                    ControlToValidate="PostalCode" autocomplete="off" ErrorMessage="Invalid postal code." SetFocusOnError="true" CssClass="text-danger" Text="*"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="PhoneNumber" CssClass="col-md-2 control-label">Phone Number</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="PhoneNumber" CssClass="form-control" TextMode="Phone" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneNumber"
                    CssClass="text-danger" ErrorMessage="The phone number field is required." Text="*" />
                <asp:RegularExpressionValidator runat="server" ValidationExpression="^(\(?[0-9]{3}\)?)?\-?[0-9]{3}\-?[0-9]{4}$" ControlToValidate="PhoneNumber" 
                    ErrorMessage="invalid phone number." autocomplete="off" SetFocusOnError="true" CssClass="text-danger" Text="*" ></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:RadioButtonList ID="UserType" runat="server">
                <asp:ListItem Text="Investor" Value="1"/>
                <asp:ListItem Text="Issuer" Value="2"/>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserType"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="You must select a user type." SetFocusOnError="true" Text="*" />
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>


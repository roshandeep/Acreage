<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="Acreageway.Admin.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:LinkButton ID="LinkButton1" runat="server" Text="Investor Management" OnClick="LinkButton1_Click" >Investor Management</asp:LinkButton>
    <asp:LinkButton ID="LinkButton2" runat="server" Text="Issuer Management" OnClick="LinkButton2_Click">Issuer Management</asp:LinkButton>

    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnAddUserRole" Width="40%">
        <ul style="list-style-type:none;">
            <li>
                <asp:Label ID="Label1" runat="server" Text="Add User to Role" Font-Bold="true"></asp:Label>
            </li>
            <li>
                <asp:TextBox ID="UserEmail" Placeholder="User Email" runat="server" Width="182px" ValidationGroup='valGroup1'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter User Email" Text="*" ControlToValidate="UserEmail" CssClass="text-danger" ValidationGroup='valGroup1'></asp:RequiredFieldValidator>
                <asp:DropDownList ID="UserRolesList" runat="server" Height="18px" Width="99px" ValidationGroup='valGroup1'>
                    <asp:ListItem Text="Investor" Value="1"/>
                    <asp:ListItem Text="Issuer" Value="2"/>
                    <asp:ListItem Text="Admin" Value="3"/>
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select User Role" Text="*" ControlToValidate="UserRolesList" ValidationGroup='valGroup1'></asp:RequiredFieldValidator>
                <asp:Button ID="btnAddUserRole" runat="server" Text="Confirm Change" OnClick="btnAddUserRole_Click" Width="127px" ValidationGroup='valGroup1'/>
                <br />
                <asp:Label ID="lblAddRoleException" runat="server" Text="Error: Email not found." Visible="false"></asp:Label>
            </li>
        </ul>
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel2" runat="server" DefaultButton="btnRemoveRole" Width="40%">
        <ul style="list-style-type:none;">
            <li>
                <asp:Label ID="Label2" runat="server" Text="Remove User from Role" Font-Bold="true"></asp:Label>
            </li>
            <li>
                <%--<asp:TextBox ID="txtRemoveUser" Placeholder="User Email"  runat="server" Width="182px"></asp:TextBox>--%>
                <asp:TextBox ID="removeUser" runat="server" Placeholder="User Email" Width="182px" ValidationGroup='valGroup2'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter User Email" Text="*" ControlToValidate="removeUser" CssClass="text-danger" ValidationGroup='valGroup2'></asp:RequiredFieldValidator>
                <asp:DropDownList ID="RemoveRolesList" runat="server" Height="18px" Width="99px" ValidationGroup='valGroup2'>
                    <asp:ListItem Text="Investor" Value="1"/>
                    <asp:ListItem Text="Issuer" Value="2"/>
                    <asp:ListItem Text="Admin" Value="3"/>
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please select User Role to remove " Text="*" ControlToValidate="RemoveRolesList" ValidationGroup='valGroup2'></asp:RequiredFieldValidator>
                <asp:Button ID="btnRemoveRole" runat="server" Text="Confirm Change" CssClass="submitBtn" OnClick="btnRemoveRole_Click1" Width="127px" ValidationGroup='valGroup2'/>
                <br />
                <asp:Label ID="lblRemoveRoleException" runat="server" Text="Error: Email not found." Visible="false"></asp:Label>
               <%-- <script type="text/javascript" language="javascript" >
                    function validate() {
                        if (Page_ClientValidate())
                            return confirm('It is possible to remove a user\'s last role. Are you sure you want to proceed ?');
                    }
                </script>--%>
            </li>
        </ul>
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel3" runat="server" Width="40%" DefaultButton="btnGetRoles">
        <ul style="list-style-type:none;">
            <li>
                <asp:Label ID="Label3" runat="server" Text="Get User's Roles" Font-Bold="true"></asp:Label>
            </li>
            <li>
                <asp:TextBox ID="TxtGetRoles" runat="server" Placeholder="User Email" Width="182px" ValidationGroup="valGroup3"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter User Email" Text="*" ControlToValidate="TxtGetRoles" CssClass="text-danger" ValidationGroup='valGroup3'></asp:RequiredFieldValidator>
                <asp:Button ID="btnGetRoles" runat="server" Text="Submit" OnClick="btnGetRoles_Click" Width="127px" ValidationGroup='valGroup3'/>
                <br />
                <asp:Label ID="lblGetRolesException" runat="server" Text="Error: Email not found." Visible="false"></asp:Label>
                <br/>
                <asp:ListBox ID="RolesListBox" runat="server" Visible="false" Height="112px" Width="70%" ValidationGroup='valGroup3'></asp:ListBox>
            </li>
        </ul>
    </asp:Panel>
    <br />


</asp:Content>

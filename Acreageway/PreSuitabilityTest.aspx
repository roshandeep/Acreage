﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PreSuitabilityTest.aspx.cs" Inherits="Acreage.PreSuitabilityTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table>

        <tr>
            <td>
                <asp:Label ID="lbl_ques1" runat="server" Text="How much you want to invest? (Amount in $CAD)"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_ans1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_ans1" ControlToValidate="txt_ans1" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator runat="server" ID="validate" ControlToValidate="txt_ans1" ValidationExpression="\d{10}" ErrorMessage="Enter numbers only" ForeColor="red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_ques2" runat="server" Text="Individual Annual Income"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rdb_ans2" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Under $75,000</asp:ListItem>
                    <asp:ListItem>$75,000 to $200,000</asp:ListItem>
                    <asp:ListItem>$200,000 to $500,000</asp:ListItem>
                    <asp:ListItem>Over $500,000</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="req_ans2" ControlToValidate="rdb_ans2" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_ques3" runat="server" Text="Combined Annual Income (From all sources)"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rdb_ans3" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Under $125,000</asp:ListItem>
                    <asp:ListItem>$125,000 to $300,000</asp:ListItem>
                    <asp:ListItem>$300,000 to $1,000,000</asp:ListItem>
                    <asp:ListItem>Over $1,000,000</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="req_ans3" ControlToValidate="rdb_ans2" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_ques4" runat="server" Text="Financial Assets (All liquid assets (Do Not include real estate or equity in real estate))"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rdb_ans4" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Under $100,000</asp:ListItem>
                    <asp:ListItem>$100,000 to $500,000</asp:ListItem>
                    <asp:ListItem>$500,000 to $1,000,000</asp:ListItem>
                    <asp:ListItem>Over $1,000,000</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="req_ans4" ControlToValidate="rdb_ans4" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_ques5" runat="server" Text="Net Assets *All assets including real estate minus all obligations and debt"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rdb_ans5" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Under $500,000</asp:ListItem>
                    <asp:ListItem>$500,000 to $1,000,000</asp:ListItem>
                    <asp:ListItem>$1,000,000 to $5,000,000</asp:ListItem>
                    <asp:ListItem>Over $5,000,000</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="req_ans5" ControlToValidate="rdb_ans5" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_emailId" runat="server" Text="Email Address"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_email" ControlToValidate="txt_email" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email" ErrorMessage="Please enter valid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"> </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_fullname" runat="server" Text="Full Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_fullname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_fullname" ControlToValidate="txt_fullname" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_fullname" ValidationExpression="[a-zA-Z ]*$" ErrorMessage="*Valid characters: Alphabets and space." />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" />
            </td>
            <td>
                <asp:Label ID="lbl_msg" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

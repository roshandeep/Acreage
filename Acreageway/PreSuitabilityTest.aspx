<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PreSuitabilityTest.aspx.cs" Inherits="Acreageway.PreSuitabilityTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table id="presuitabilitytest" style="margin-top: 5rem;" class="container">

        <tr class="row">
            <td class="col-sm-6">
                <asp:Label ID="lbl_ques1" runat="server" Text="How much you want to invest? (Amount in $CAD)"></asp:Label>
            </td>
            <td class="col-sm-6">
                <asp:TextBox ID="txt_ans1" runat="server"></asp:TextBox>
                <asp:CheckBox ID="chk_NoLimit" runat="server" Text="No Limit" OnCheckedChanged="chk_NoLimit_CheckedChanged" />
                <asp:RequiredFieldValidator runat="server" ID="req_ans1" ControlToValidate="txt_ans1" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator runat="server" ID="validate" ControlToValidate="txt_ans1" ValidationExpression="^[0-9]{0,10}$" ErrorMessage="Enter numbers only" ForeColor="red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr class="row">
            <td class="col-sm-6">
                <asp:Label ID="lbl_ques2" runat="server" Text="Individual Annual Income"></asp:Label>
            </td>
            <td class="col-sm-6">
                <asp:RadioButtonList ID="rdb_ans2" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Under $75,000</asp:ListItem>
                    <asp:ListItem>$75,000 to $200,000</asp:ListItem>
                    <asp:ListItem>$200,000 to $500,000</asp:ListItem>
                    <asp:ListItem>Over $500,000</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="req_ans2" ControlToValidate="rdb_ans2" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr class="row">
            <td class="col-sm-6">
                <asp:Label ID="lbl_ques3" runat="server" Text="Combined Annual Income (From all sources)"></asp:Label>
            </td>
            <td class="col-sm-6">
                <asp:RadioButtonList ID="rdb_ans3" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Under $125,000</asp:ListItem>
                    <asp:ListItem>$125,000 to $300,000</asp:ListItem>
                    <asp:ListItem>$300,000 to $1,000,000</asp:ListItem>
                    <asp:ListItem>Over $1,000,000</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="req_ans3" ControlToValidate="rdb_ans2" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr class="row">
            <td class="col-sm-6">
                <asp:Label ID="lbl_ques4" runat="server" Text="Financial Assets (All liquid assets (Do Not include real estate or equity in real estate))"></asp:Label>
            </td>
            <td class="col-sm-6">
                <asp:RadioButtonList ID="rdb_ans4" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Under $100,000</asp:ListItem>
                    <asp:ListItem>$100,000 to $500,000</asp:ListItem>
                    <asp:ListItem>$500,000 to $1,000,000</asp:ListItem>
                    <asp:ListItem>Over $1,000,000</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="req_ans4" ControlToValidate="rdb_ans4" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr class="row">
            <td class="col-sm-4">
                <asp:Label ID="lbl_ques5" runat="server" Text="Net Assets *All assets including real estate minus all obligations and debt"></asp:Label>
            </td>
            <td class="col-sm-8">
                <asp:RadioButtonList ID="rdb_ans5" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Under $500,000</asp:ListItem>
                    <asp:ListItem>$500,000 to $1,000,000</asp:ListItem>
                    <asp:ListItem>$1,000,000 to $5,000,000</asp:ListItem>
                    <asp:ListItem>Over $5,000,000</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="req_ans5" ControlToValidate="rdb_ans5" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>
        <tr class="row">
            <td class="col-sm-6">
                <asp:Label ID="lbl_emailId" runat="server" Text="Email Address"></asp:Label>
            </td>
            <td class="col-sm-6">
                <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_email" ControlToValidate="txt_email" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email" ErrorMessage="Please enter valid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"> </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr class="row">
            <td class="col-sm-6">
                <asp:Label ID="lbl_fullname" runat="server" Text="Full Name"></asp:Label>
            </td>
            <td class="col-sm-12">
                <asp:TextBox ID="txt_fullname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="req_fullname" ControlToValidate="txt_fullname" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_fullname" ValidationExpression="[a-zA-Z ]*$" ErrorMessage="*Valid characters: Alphabets and space." />
            </td>
        </tr>
        <tr class="row">
            <td class="col-sm-6">
                <asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" />
            </td>
            <td class="col-sm-6">
                <asp:Label ID="lbl_msg" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="chk_NoLimit" PopupControlID="Panel1" CancelControlID="lnkDummyCancel"></ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" align="center" Style="display: none">
        <div style="height: 60px; background-color: aliceblue;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div>
                        <asp:Label ID="lbl_disclaimer" runat="server" Text="By submitting this form, the Client(s) certify that all information disclosed in this form is complete and true and acknowledge that such information shall be deemed complete, true and unchanged until such time as Durham Asset Management Inc. is advised in writing by the Client(s) of any change pertaining thereto. The Client(s) certify that it is their responsibility to notify Durham Asset Management Inc. of any changes to the above information."></asp:Label>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <asp:LinkButton ID="lnkDummyCancel" runat="server"></asp:LinkButton>
        <asp:Button ID="btn_proceed" runat="server" Text="Proceed" OnClick="btn_proceed_Click" CausesValidation="false" />
    </asp:Panel>

    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="lnkDummy" PopupControlID="Panel2" CancelControlID="btn_cancel"></ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="Panel2" runat="server" align="center" Style="display: none">
        <div style="height: 60px; background-color: aliceblue;">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div>
                        <asp:Label ID="Label1" runat="server" Text="Sorry you are not allowed to make any investments this year. Please contact info@altvest.com for further discussion"></asp:Label>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel"></asp:Button>
        <asp:Button ID="btn_limitbelow" runat="server" Text="Proceed" OnClick="btn_limitbelow_Click" CausesValidation="false" />
    </asp:Panel>
</asp:Content>

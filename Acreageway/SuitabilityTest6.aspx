<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SuitabilityTest6.aspx.cs" Inherits="Acreage.SuitabilityTest6" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%--    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%>
    <h4>POLITICALLY EXPOSED PERSON (PEP): CLIENT QUESTIONNAIRE</h4>
    <table>
        <tr>
            <td colspan="2">The Money Laundering Act of Canada as amended and effective June 23, 2008 now requires us as a financial institution to determine if our clients may be a Politically Exposed Person (PEP) or Head of an International Organization (HIO), and as such we are required to ask such clients the following questions
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_family" runat="server" Text="Do you or any members of your family hold or has held one of the following offices or positions in or on behalf of a foreign state?" ToolTip="Family means Immediate Family including;
Spouse or common law partner; Mother or father; Child; Brother, sister, half-brother or half-sister; or Spouse’s or common-law partner’s mother or father."></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_family" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_family" ControlToValidate="ddl_family" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Display="Dynamic"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_head" runat="server" Text="Head of state or head of government"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_head" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_head" ControlToValidate="ddl_head" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Display="Dynamic"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_government" runat="server" Text="Member of the executive council of government or member of a legislature"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_government" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_government" ControlToValidate="ddl_government" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Display="Dynamic"/>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_deputy" runat="server" Text="Deputy minister or equivalent rank "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_deputy" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_deputy" ControlToValidate="ddl_deputy" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Display="Dynamic"/>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_ambassador" runat="server" Text="Ambassador or attaché or counselor of an ambassador "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_ambassador" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_ambassador" ControlToValidate="ddl_ambassador" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Display="Dynamic"/>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_military" runat="server" Text="Military officer with a rank of general or above"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_military" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_military" ControlToValidate="ddl_military" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Display="Dynamic"/>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_president" runat="server" Text="President of a state-owned company or a state-owned bank"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_president" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_president" ControlToValidate="ddl_president" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Display="Dynamic"/>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_agency" runat="server" Text="Head of a government agency"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_agency" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_agency" ControlToValidate="ddl_agency" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Display="Dynamic"/>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_judge" runat="server" Text="Judge"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_judge" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_judge" ControlToValidate="ddl_judge" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Display="Dynamic"/>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_leader" runat="server" Text="Leader or president of a political party represented in a legislature"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_leader" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_leader" ControlToValidate="ddl_leader" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Display="Dynamic"/>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_holder" runat="server" Text="Holder of any prescribed office or position"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_holder" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_holder" ControlToValidate="ddl_holder" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Display="Dynamic"/>

            </td>
        </tr>
        <tr>
            <td colspan="2">THIRD PARTY DETERMINATION
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_tpd" runat="server" Text="In opening this account, are you acting on the instructions of or on behalf of a third party?"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_tpd" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_tpd" ControlToValidate="ddl_tpd" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Display="Dynamic"/>

            </td>
        </tr>
        <tr>
            <td colspan="2">Head of an International Organization (HIO)
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_hio" runat="server" Text="Are you or anyone you know the head of an international Organization (HIO) or close associate of an HIO?"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_hio" runat="server">
                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="req_hio" ControlToValidate="ddl_hio" ErrorMessage="* Required" ForeColor="Red" InitialValue="-1" Display="Dynamic"/>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btn_Save" runat="server" Text="Save" OnClick="btn_Save_Click" />
            </td>
            <td>
                <asp:Button ID="btn_Next" runat="server" Text="Next" Enabled="false" />
            </td>
        </tr>
    </table>
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btn_Next" PopupControlID="Panel1" CancelControlID="lnkDummyCancel"></ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" align="center" Style="display: none">
        <div style="height: 60px; background-color:aliceblue;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div>
                    By submitting this form, the Client(s) certify that all information disclosed in this form is complete and true and acknowledge that such information shall be deemed complete, true and unchanged until such time as Durham Asset Management Inc. is advised in writing by the Client(s) of any change pertaining thereto. The Client(s) certify that it is their responsibility to notify Durham Asset Management Inc. of any changes to the above information.
                
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <asp:LinkButton ID="lnkDummyCancel" runat="server"></asp:LinkButton>
        <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btn_submit_Click" />
    </asp:Panel>

</asp:Content>

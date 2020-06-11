<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SuitabilityTest4.aspx.cs" Inherits="Acreage.SuitabilityTest4" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h4>Text missing</h4>
    <table>
        <tr>
            <td colspan="2">
                <asp:GridView ID="Gridview1" runat="server" ShowFooter="true" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />
                        <asp:TemplateField HeaderText="Financial Institutions">
                            <ItemTemplate>
                                <%--<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>
                                <asp:DropDownList ID="ddl_1" runat="server">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Banks" Value="Banks"></asp:ListItem>
                                    <asp:ListItem Text="Prime Brokers" Value="Prime Brokers"></asp:ListItem>
                                    <asp:ListItem Text="Insurance company" Value="Insurance company"></asp:ListItem>
                                    <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Asset Type">
                            <ItemTemplate>
                                <%--<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>--%>
                                <asp:DropDownList ID="ddl_2" runat="server">
                                    <asp:ListItem Text="--SELECT--" Value="-1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Equity" Value="Equity"></asp:ListItem>
                                    <asp:ListItem Text="Fixed Income" Value="Fixed Income"></asp:ListItem>
                                    <asp:ListItem Text="Cash" Value="Cash"></asp:ListItem>
                                    <asp:ListItem Text="None of the above" Value="None of the above"></asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Amount">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <FooterTemplate>
                                <asp:Button ID="ButtonAdd" runat="server" Text="Add Another Source Of Income" OnClick="ButtonAdd_Click" />
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_officer" runat="server" Text="Are you an officar or director of a company whose shares are traded on an Exchange or in the OTC Market?"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rdb_officer" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="req_officer" ControlToValidate="rdb_officer" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_controlpos" runat="server" Text="Are you in a control position or a part of a group in a control position of any such company?"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rdb_controlpos" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="req_controlpos" ControlToValidate="rdb_controlpos" ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />

            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btn_Save" runat="server" Text="Save" OnClick="btn_Save_Click" />
                <asp:Label ID="lbl_msg" runat="server" Text=""></asp:Label>
            </td>
            <td>
                <asp:Button ID="btn_Next" runat="server" Text="Next" OnClick="btn_Next_Click" Enabled="false" />
            </td>
        </tr>
    </table>
</asp:Content>

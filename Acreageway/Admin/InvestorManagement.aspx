<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InvestorManagement.aspx.cs" Inherits="Acreageway.Admin.InvestorManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblError" runat="server" Text="" Visible="false"></asp:Label>
    <asp:GridView ID="investorsGrid" runat="server" AllowSorting="True" AllowPaging="True" PageIndex="10" Width="80%" BorderStyle="Solid" EmptyDataText="N/A" BorderWidth="1px" BorderColor="#999999" CellPadding="5" CellSpacing="5" DataKeyNames="id"   
                        ForeColor="Black" GridLines="Vertical" onsorting="GridView1_Sorting" AutoGenerateColumns="False" BackColor="White" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" 
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"   >
        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>  
                            <asp:TemplateField HeaderText="Id" SortExpression="id">  
                                <%--<EditItemTemplate>  
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>  
                                </EditItemTemplate>--%>  
                                <ItemTemplate>  
                                    <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>  
                                </ItemTemplate>  
                            </asp:TemplateField>  
                            <asp:TemplateField HeaderText="Role" SortExpression="role">  
                                <EditItemTemplate>  
                                    <asp:TextBox ID="txtRole" runat="server" Text='<%# Bind("role") %>'></asp:TextBox>  
                                </EditItemTemplate>  
                                <ItemTemplate>  
                                    <asp:Label ID="lblRole" runat="server" Text='<%# Bind("role") %>'></asp:Label>  
                                </ItemTemplate>  
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="First Name" SortExpression="firstname">  
                                <EditItemTemplate>  
                                    <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("firstname") %>'></asp:TextBox>  
                                </EditItemTemplate>  
                                <ItemTemplate>  
                                    <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("firstname") %>'></asp:Label>  
                                </ItemTemplate>  
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Name" SortExpression="lastname">  
                                <EditItemTemplate>  
                                    <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("lastname") %>'></asp:TextBox>  
                                </EditItemTemplate>  
                                <ItemTemplate>  
                                    <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("lastname") %>'></asp:Label>  
                                </ItemTemplate>  
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email" SortExpression="email">  
                                <EditItemTemplate>  
                                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>  
                                </EditItemTemplate>  
                                <ItemTemplate>  
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("email") %>'></asp:Label>  
                                </ItemTemplate>  
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mailing Address" SortExpression="mailingaddress">  
                                <EditItemTemplate>  
                                    <asp:TextBox ID="txtMailingAddress" runat="server" Text='<%# Bind("mailingaddress") %>'></asp:TextBox>  
                                </EditItemTemplate>  
                                <ItemTemplate>  
                                    <asp:Label ID="lblMailingAddress" runat="server" Text='<%# Bind("mailingaddress") %>'></asp:Label>  
                                </ItemTemplate>  
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Province" SortExpression="province">  
                                <EditItemTemplate>  
                                    <asp:TextBox ID="txtProvince" runat="server" Text='<%# Bind("province") %>'></asp:TextBox>  
                                </EditItemTemplate>  
                                <ItemTemplate>  
                                    <asp:Label ID="lblProvince" runat="server" Text='<%# Bind("province") %>'></asp:Label>  
                                </ItemTemplate>  
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City" SortExpression="city">  
                                <EditItemTemplate>  
                                    <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>  
                                </EditItemTemplate>  
                                <ItemTemplate>  
                                    <asp:Label ID="lblCity" runat="server" Text='<%# Bind("city") %>'></asp:Label>  
                                </ItemTemplate>  
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Postal Code" SortExpression="postalcode">  
                                <EditItemTemplate>  
                                    <asp:TextBox ID="txtPostalCode" runat="server" Text='<%# Bind("postalcode") %>'></asp:TextBox>  
                                </EditItemTemplate>  
                                <ItemTemplate>  
                                    <asp:Label ID="lblPostalCode" runat="server" Text='<%# Bind("postalcode") %>'></asp:Label>  
                                </ItemTemplate>  
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Phone #" SortExpression="phonenumber">  
                                <EditItemTemplate>  
                                    <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:TextBox>  
                                </EditItemTemplate>  
                                <ItemTemplate>  
                                    <asp:Label ID="lblPhone" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>  
                                </ItemTemplate>  
                            </asp:TemplateField> 
                            <asp:CommandField ShowEditButton="true" />  
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Are you sure you want to delete? This cannot be undone.');" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>  
                        <FooterStyle BackColor="#CCCCCC" />  
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />  
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />  
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />  
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />  
                        <SortedAscendingHeaderStyle BackColor="#808080" />  
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />  
                        <SortedDescendingHeaderStyle BackColor="#383838" /> 
    </asp:GridView>
   <%-- <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
</asp:Content>

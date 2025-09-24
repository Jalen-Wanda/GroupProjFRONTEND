<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Admin_Page.aspx.cs" Inherits="CampusBookMarket.Admin_Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="admin-container">
        <h2>Admin Dashboard</h2>
        
        <div class="admin-section">
            <h3>Pending Product Approvals</h3>
            <asp:Repeater ID="rptPendingProducts" runat="server">
                <ItemTemplate>
                    <div class="product-card">
                        <img src='<%# Eval("icon") %>' alt='<%# Eval("name") %>' class="product-image">
                        <div class="product-info">
                            <h3><%# Eval("name") %></h3>
                            <p><%# Eval("description") %></p>
                            <div class="product-price">R<%# Convert.ToDecimal(Eval("price")).ToString("N2") %></div>
                            <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="btn btn-approve" 
                                CommandArgument='<%# Eval("Id") %>' OnClick="btnApprove_Click" />
                            <asp:Button ID="btnReject" runat="server" Text="Reject" CssClass="btn btn-reject" 
                                CommandArgument='<%# Eval("Id") %>' OnClick="btnReject_Click" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
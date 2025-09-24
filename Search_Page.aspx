<%@ Page Title="Search" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="CampusBookMarket.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="search-results-container">
        <h2>Search Results for "<asp:Literal ID="litSearchTerm" runat="server"></asp:Literal>"</h2>
        
        <div class="search-bar">
            <asp:TextBox ID="txtSearch" runat="server" placeholder="Search for products..."></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-search" OnClick="btnSearch_Click" />
        </div>

        <div class="products">
            <asp:Repeater ID="rptSearchResults" runat="server">
                <ItemTemplate>
                    <div class="product-card">
                        <img src='<%# Eval("icon") %>' alt='<%# Eval("name") %>' class="product-image" onerror="this.src='https://via.placeholder.com/300x200?text=Product+Image'">
                        <div class="product-info">
                            <div class="product-category"><%# Eval("category") %></div>
                            <h3 class="product-title"><%# Eval("name") %></h3>
                            <div class="product-price">R<%# Convert.ToDecimal(Eval("price")).ToString("N2") %></div>
                            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn btn-add-to-cart" 
                                CommandArgument='<%# Eval("Id") %>' OnClick="btnAddToCart_Click" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            
            <asp:Label ID="lblNoResults" runat="server" Text="No products found matching your search criteria." 
                Visible="false" CssClass="no-results"></asp:Label>
        </div>
    </div>
</asp:Content>
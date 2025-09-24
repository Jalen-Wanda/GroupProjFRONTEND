<%@ Page Title="AddProduct" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="CampusBookMarket.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h2>Add Product for Sale</h2>
        
        <div class="form-group">
            <asp:Label ID="lblName" runat="server" Text="Product Name" AssociatedControlID="txtName"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" placeholder="Enter product name" required="true"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <asp:Label ID="lblPrice" runat="server" Text="Price" AssociatedControlID="txtPrice"></asp:Label>
            <asp:TextBox ID="txtPrice" runat="server" placeholder="Enter price" TextMode="Number" step="0.01" required="true"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <asp:Label ID="lblCategory" runat="server" Text="Category" AssociatedControlID="ddlCategory"></asp:Label>
            <asp:DropDownList ID="ddlCategory" runat="server" required="true">
                <asp:ListItem Value="">Select Category</asp:ListItem>
                <asp:ListItem Value="Textbook">Textbook</asp:ListItem>
                <asp:ListItem Value="Electronics">Electronics</asp:ListItem>
                <asp:ListItem Value="Dorm Essential">Dorm Essential</asp:ListItem>
                <asp:ListItem Value="Stationery">Stationery</asp:ListItem>
            </asp:DropDownList>
        </div>
        
        <div class="form-group">
            <asp:Label ID="lblDescription" runat="server" Text="Description" AssociatedControlID="txtDescription"></asp:Label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" placeholder="Enter product description" required="true"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <asp:Label ID="lblQuantity" runat="server" Text="Quantity" AssociatedControlID="txtQuantity"></asp:Label>
            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" placeholder="Enter quantity" required="true"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <asp:Label ID="lblImageUrl" runat="server" Text="Image URL" AssociatedControlID="txtImageUrl"></asp:Label>
            <asp:TextBox ID="txtImageUrl" runat="server" placeholder="Enter image URL" required="true"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <asp:CheckBox ID="chkIsAuction" runat="server" Text="This is an auction item" AutoPostBack="true" OnCheckedChanged="chkIsAuction_CheckedChanged" />
        </div>
        
        <asp:Panel ID="pnlAuction" runat="server" Visible="false">
            <div class="form-group">
                <asp:Label ID="lblAuctionEnd" runat="server" Text="Auction End Date" AssociatedControlID="txtAuctionEnd"></asp:Label>
                <asp:TextBox ID="txtAuctionEnd" runat="server" TextMode="DateTimeLocal" required="true"></asp:TextBox>
            </div>
        </asp:Panel>
        
        <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CssClass="btn-primary" OnClick="btnAddProduct_Click" />
        <asp:Label ID="lblMessage" runat="server" Text="" CssClass="error-message"></asp:Label>
    </div>
</asp:Content>
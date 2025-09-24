<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="CampusBookMarket.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="max-width: 800px; margin: 20px auto;">
        <h2>Checkout</h2>
        
        <div class="order-summary">
            <h4>Order Summary</h4>
            <asp:Repeater ID="rptCheckoutItems" runat="server">
                <ItemTemplate>
                    <div style="display: flex; justify-content: space-between; padding: 10px; border-bottom: 1px solid #eee;">
                        <span><%# Eval("Product.name") %> (x<%# Eval("quantity") %>)</span>
                        <span>R<%# (Convert.ToDecimal(Eval("Product.price")) * Convert.ToInt32(Eval("quantity"))).ToString("N2") %></span>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            
            <div style="text-align: right; margin-top: 20px; font-size: 1.2em;">
                <strong>Total: R<asp:Label ID="lblTotal" runat="server" Text="0.00"></asp:Label></strong>
            </div>
        </div>

        <div class="checkout-actions" style="margin-top: 30px; text-align: center;">
            <asp:Button ID="btnConfirmOrder" runat="server" Text="Confirm Order" 
                CssClass="btn btn-success btn-lg" OnClick="btnConfirmOrder_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                CssClass="btn btn-secondary btn-lg" OnClick="btnCancel_Click" />
        </div>
    </div>
</asp:Content>
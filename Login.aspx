<%@ Page Title="Login" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CampusBookMarket.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <div class="form-header">
            <h2>Login to Your Account</h2>
        </div>
        <div class="form-group">
            <asp:Label ID="lblEmail" runat="server" Text="Email" AssociatedControlID="txtEmail"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email" TextMode="Email" required="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblPassword" runat="server" Text="Password" AssociatedControlID="txtPassword"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter your password" TextMode="Password" required="true"></asp:TextBox>
        </div>
        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-primary" OnClick="btnLogin_Click" />
        <div class="form-footer">
            <p>Don't have an account? <a href="Register.aspx">Register here</a></p>
        </div>
        <asp:Label ID="lblMessage" runat="server" Text="" CssClass="error-message"></asp:Label>
    </div>
</asp:Content>
<%@ Page Title="Register" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CampusBookMarket.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <div class="form-header">
            <h2>Create Your Account</h2>
        </div>
        <div class="form-group">
            <asp:Label ID="lblFullName" runat="server" Text="Full Name" AssociatedControlID="txtFullName"></asp:Label>
            <asp:TextBox ID="txtFullName" runat="server" placeholder="Enter your full name" required="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblEmail" runat="server" Text="Email" AssociatedControlID="txtEmail"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email" TextMode="Email" required="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblPassword" runat="server" Text="Password" AssociatedControlID="txtPassword"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" placeholder="Create a password" TextMode="Password" required="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" AssociatedControlID="txtConfirmPassword"></asp:Label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="Confirm your password" TextMode="Password" required="true"></asp:TextBox>
        </div>
        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-primary" OnClick="btnRegister_Click" />
        <div class="form-footer">
            <p>Already have an account? <a href="Login.aspx">Login here</a></p>
        </div>
        <asp:Label ID="lblMessage" runat="server" Text="" CssClass="error-message"></asp:Label>
    </div>
</asp:Content>
<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="CampusBookMarket.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .profile-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
        }

        .welcome-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            border-radius: 10px;
            margin-bottom: 30px;
            text-align: center;
        }

        .tab-container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .tab-headers {
            display: flex;
            background: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
        }

        .tab-header {
            padding: 15px 30px;
            cursor: pointer;
            border: none;
            background: none;
            flex: 1;
            text-align: center;
            font-weight: 600;
            transition: all 0.3s;
        }

        .tab-header.active {
            background: white;
            border-bottom: 3px solid #007bff;
            color: #007bff;
        }

        .tab-content {
            padding: 30px;
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .product-card {
            border: 1px solid #dee2e6;
            border-radius: 8px;
            padding: 15px;
            transition: transform 0.3s;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .product-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 5px;
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: bold;
        }

        .status-pending { background: #fff3cd; color: #856404; }
        .status-approved { background: #d4edda; color: #155724; }
        .status-rejected { background: #f8d7da; color: #721c24; }

        .cart-item {
            display: flex;
            align-items: center;
            padding: 15px;
            border-bottom: 1px solid #eee;
        }

        .cart-item-image {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 5px;
            margin-right: 15px;
        }

        .btn-checkout {
            background: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }

        .empty-state {
            text-align: center;
            padding: 40px;
            color: #6c757d;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-container">
        <!-- Welcome Section -->
        <div class="welcome-section">
            <h1>Welcome, <asp:Label ID="lblUserName" runat="server" Text="User"></asp:Label>!</h1>
            <p>Manage your account, products, and orders in one place</p>
        </div>

        <!-- Tab Container -->
        <div class="tab-container">
            <div class="tab-headers">
                <button class="tab-header active" onclick="switchTab('personal')">Personal Info</button>
                <button class="tab-header" onclick="switchTab('selling')">My Products</button>
                <button class="tab-header" onclick="switchTab('cart')">Shopping Cart</button>
                <button class="tab-header" onclick="switchTab('orders')">My Orders</button>
            </div>

            <!-- Personal Info Tab -->
            <div id="personal" class="tab-content active">
                <h3>Personal Information</h3>
                <div class="form-group">
                    <label>Full Name:</label>
                    <asp:Label ID="lblFullName" runat="server" CssClass="form-control-static"></asp:Label>
                </div>
                <div class="form-group">
                    <label>Email:</label>
                    <asp:Label ID="lblEmail" runat="server" CssClass="form-control-static"></asp:Label>
                </div>
                <div class="form-group">
                    <label>Member Since:</label>
                    <asp:Label ID="lblMemberSince" runat="server" CssClass="form-control-static"></asp:Label>
                </div>
            </div>

            <!-- My Products Tab -->
            <div id="selling" class="tab-content">
                <h3>Products I'm Selling</h3>
                <asp:Button ID="btnAddProduct" runat="server" Text="+ Add New Product" 
                    CssClass="btn btn-primary" OnClick="btnAddProduct_Click" />
                
                <div class="product-grid">
                    <asp:Repeater ID="rptMyProducts" runat="server">
                        <ItemTemplate>
                            <div class="product-card">
                                <img src='<%# Eval("icon") %>' alt='<%# Eval("name") %>' class="product-image" 
                                    onerror="this.src='https://via.placeholder.com/300x200?text=Product+Image'">
                                <h4><%# Eval("name") %></h4>
                                <p><strong>Price:</strong> R<%# Convert.ToDecimal(Eval("price")).ToString("N2") %></p>
                                <p><strong>Status:</strong> 
                                    <span class='status-badge status-<%# Eval("approvalStatus").ToString().ToLower() %>'>
                                        <%# Eval("approvalStatus") %>
                                    </span>
                                </p>
                                <p><strong>Category:</strong> <%# Eval("category") %></p>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-sm btn-outline-primary"
                                    CommandArgument='<%# Eval("Id") %>' OnClick="btnEdit_Click" />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                    <asp:Label ID="lblNoProducts" runat="server" Text="You haven't listed any products yet." 
                        CssClass="empty-state" Visible="false"></asp:Label>
                </div>
            </div>

            <!-- Shopping Cart Tab -->
            <div id="cart" class="tab-content">
                <h3>Shopping Cart</h3>
                <asp:Repeater ID="rptCart" runat="server">
                    <ItemTemplate>
                        <div class="cart-item">
                            <img src='<%# Eval("Product.icon") %>' alt='<%# Eval("Product.name") %>' class="cart-item-image">
                            <div style="flex: 1;">
                                <h5><%# Eval("Product.name") %></h5>
                                <p>R<%# Convert.ToDecimal(Eval("Product.price")).ToString("N2") %></p>
                                <p>Quantity: <%# Eval("quantity") %></p>
                            </div>
                            <asp:Button ID="btnRemoveFromCart" runat="server" Text="Remove" CssClass="btn btn-danger btn-sm"
                                CommandArgument='<%# Eval("Id") %>' OnClick="btnRemoveFromCart_Click" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                
                <asp:Label ID="lblEmptyCart" runat="server" Text="Your cart is empty." 
                    CssClass="empty-state" Visible="false"></asp:Label>
                
                <div style="text-align: right; margin-top: 20px;">
                    <strong>Total: R<asp:Label ID="lblCartTotal" runat="server" Text="0.00"></asp:Label></strong>
                    <br>
                    <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout" 
                        CssClass="btn-checkout" OnClick="btnCheckout_Click" />
                </div>
            </div>

            <!-- Orders Tab -->
            <div id="orders" class="tab-content">
                <h3>My Orders</h3>
                <asp:Repeater ID="rptOrders" runat="server">
                    <ItemTemplate>
                        <div class="order-item" style="border: 1px solid #ddd; padding: 15px; margin-bottom: 15px; border-radius: 5px;">
                            <h5>Order #<%# Eval("Id") %> - <%# Eval("orderDate", "{0:dd MMM yyyy}") %></h5>
                            <p><strong>Total: R<%# Convert.ToDecimal(Eval("totalAmount")).ToString("N2") %></strong></p>
                            <p>Status: <span class='status-badge'><%# Eval("status") %></span></p>
                            <asp:Button ID="btnViewInvoice" runat="server" Text="Download Invoice" 
                                CssClass="btn btn-sm btn-outline-primary" CommandArgument='<%# Eval("Id") %>' 
                                OnClick="btnViewInvoice_Click" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                
                <asp:Label ID="lblNoOrders" runat="server" Text="You haven't placed any orders yet." 
                    CssClass="empty-state" Visible="false"></asp:Label>
            </div>
        </div>
    </div>

    <script>
        function switchTab(tabName) {
            // Hide all tab contents
            document.querySelectorAll('.tab-content').forEach(tab => {
                tab.classList.remove('active');
            });
            
            // Remove active class from all tab headers
            document.querySelectorAll('.tab-header').forEach(header => {
                header.classList.remove('active');
            });
            
            // Show selected tab content
            document.getElementById(tabName).classList.add('active');
            
            // Activate clicked tab header
            event.target.classList.add('active');
        }
    </script>
</asp:Content>
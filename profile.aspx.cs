using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampusBookMarket.ServiceReference1;

namespace CampusBookMarket
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUserProfile();
                LoadUserProducts();
            }
        }

        private void LoadUserProfile()
        {
            lblName.Text = Session["UserName"]?.ToString();
            lblEmail.Text = Session["UserEmail"]?.ToString();
        }

        private void LoadUserProducts()
        {
            // This would need a new service method to get products by user ID
            // For now, we'll show all products
            Service1Client client = new Service1Client();
            var products = client.GetProducts();
            rptMyProducts.DataSource = products;
            rptMyProducts.DataBind();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string productId = btn.CommandArgument;
            Response.Redirect($"EditProduct.aspx?id={productId}");
        }
    }
}
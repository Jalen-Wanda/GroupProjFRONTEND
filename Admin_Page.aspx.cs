using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampusBookMarket.ServiceReference1;

namespace CampusBookMarket
{
    public partial class Admin_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null || Session["UserEmail"].ToString() != "admin@campussentials.com")
            {
                Response.Redirect("index.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadPendingProducts();
            }
        }

        private void LoadPendingProducts()
        {
            // This would need a service method to get products with active=0 (pending approval)
            // For now, we'll show all products
            Service1Client client = new Service1Client();
            var products = client.GetProducts();
            rptPendingProducts.DataSource = products;
            rptPendingProducts.DataBind();
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int productId = Convert.ToInt32(btn.CommandArgument);
            
            // Update product status to approved (active=1)
            // This would need a service method
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int productId = Convert.ToInt32(btn.CommandArgument);
            
            // Delete or deactivate product
            // This would need a service method
        }
    }
}
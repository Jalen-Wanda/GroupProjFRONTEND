using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampusBookMarket.ServiceReference1;

namespace CampusBookMarket
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProducts();
                BindAuctionProducts();
                CheckUserSession();
            }
        }

        private void CheckUserSession()
        {
            if (Session["UserEmail"] != null)
            {
                // User is logged in - update navigation
                var loginBtn = Master.FindControl("loginBtn") as Button;
                var registerBtn = Master.FindControl("registerBtn") as Button;
                var userWelcome = Master.FindControl("userWelcome") as System.Web.UI.HtmlControls.HtmlGenericControl;

                if (loginBtn != null) loginBtn.Visible = false;
                if (registerBtn != null) registerBtn.Visible = false;
                if (userWelcome != null)
                {
                    userWelcome.Visible = true;
                    userWelcome.InnerText = "Welcome, " + Session["UserName"]?.ToString();
                }
            }
        }

        private void BindProducts()
        {
            try
            {
                Service1Client client = new Service1Client();
                var products = client.GetProducts().Where(p => p.active == 1).ToList();

                // Filter regular products (non-auction)
                var regularProducts = products.Where(p => p.dateBid == DateTime.MinValue || p.dateBid <= DateTime.Now).Take(8).ToList();
                rptProducts.DataSource = regularProducts;
                rptProducts.DataBind();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error binding products: " + ex.Message);
            }
        }

        private void BindAuctionProducts()
        {
            try
            {
                Service1Client client = new Service1Client();
                var products = client.GetProducts().Where(p => p.active == 1).ToList();

                // Filter auction products (with future dateBid)
                var auctionProducts = products.Where(p => p.dateBid > DateTime.Now).Take(6).ToList();
                rptAuctionProducts.DataSource = auctionProducts;
                rptAuctionProducts.DataBind();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error binding auction products: " + ex.Message);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchTerm = txtSearch.Text.Trim();
            if (!string.IsNullOrEmpty(searchTerm))
            {
                Response.Redirect($"Search.aspx?q={Server.UrlEncode(searchTerm)}");
            }
        }
    }
}
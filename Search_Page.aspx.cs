using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampusBookMarket.ServiceReference1;

namespace CampusBookMarket
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string searchTerm = Request.QueryString["q"];
                if (!string.IsNullOrEmpty(searchTerm))
                {
                    litSearchTerm.Text = searchTerm;
                    PerformSearch(searchTerm);
                }
            }
        }

        private void PerformSearch(string searchTerm)
        {
            Service1Client client = new Service1Client();
            var results = client.SearchProducts(searchTerm);

            if (results != null && results.Count > 0)
            {
                rptSearchResults.DataSource = results;
                rptSearchResults.DataBind();
                lblNoResults.Visible = false;
            }
            else
            {
                rptSearchResults.DataSource = null;
                rptSearchResults.DataBind();
                lblNoResults.Visible = true;
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

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            Button btn = (Button)sender;
            string productId = btn.CommandArgument;
            // Add to cart logic here
        }
    }
}
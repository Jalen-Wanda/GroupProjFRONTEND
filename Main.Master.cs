using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampusBookMarket
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckUserSession();
            }
        }

        private void CheckUserSession()
        {
            if (Session["UserEmail"] != null)
            {
                pnlGuest.Visible = false;
                pnlUser.Visible = true;
                userWelcome.InnerText = "Welcome, " + Session["UserName"]?.ToString();
            }
            else
            {
                pnlGuest.Visible = true;
                pnlUser.Visible = false;
            }
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void registerBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }
    }
}
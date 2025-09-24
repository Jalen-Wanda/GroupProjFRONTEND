using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampusBookMarket.ServiceReference1;

namespace CampusBookMarket
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Service1Client service = new Service1Client();
            if (Session["UserEmail"] == null)
            {
                // Not logged in
                Response.Redirect("Login.aspx");
            }
            else
            {
                // Logged in: use session variables
                string email = Session["UserEmail"].ToString();
                string password = Session["UserPassword"].ToString();
                
                //get user
                User u = service.getUser(password,email);

                Namelbl.Text = u.name;
                Emaillbl.Text = u.email;

                // Fetch product using WCF
               var p = service.GetProductByUserEmail(u.email);
               
                productNamelbl.Text = p?.name ?? "No product uploaded.";
                   // lblStatus.Text = product?.ApprovalStatus ?? "Pending";
                  //  lblStatus.CssClass += " " + (product?.ApprovalStatus ?? "pending").ToLower();
                
            }
        }
    }
}
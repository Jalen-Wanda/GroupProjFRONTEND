using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampusBookMarket.ServiceReference1;

namespace CampusBookMarket
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] != null)
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            Service1Client client = new Service1Client();
            int result = client.Login(email, password);

            if (result == 1)
            {
                // Login successful
                User user = client.getUser(password, email);
                if (user != null)
                {
                    Session["UserId"] = user.Id;
                    Session["UserName"] = user.name;
                    Session["UserEmail"] = user.email;
                    Response.Redirect("index.aspx");
                }
            }
            else if (result == 0)
            {
                lblMessage.Text = "Invalid email or password.";
            }
            else
            {
                lblMessage.Text = "An error occurred. Please try again.";
            }
        }
    }
}
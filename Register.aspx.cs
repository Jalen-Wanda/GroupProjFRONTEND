using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampusBookMarket.ServiceReference1;

namespace CampusBookMarket
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] != null)
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            User newUser = new User
            {
                name = txtFullName.Text.Trim(),
                email = txtEmail.Text.Trim(),
                password = txtPassword.Text.Trim()
            };

            Service1Client client = new Service1Client();
            int result = client.Register(newUser);

            if (result == 0)
            {
                lblMessage.Text = "Registration successful! You can now login.";
                lblMessage.CssClass = "success-message";
                ClearForm();
            }
            else if (result == 1)
            {
                lblMessage.Text = "Email already exists. Please use a different email.";
            }
            else
            {
                lblMessage.Text = "An error occurred. Please try again.";
            }
        }

        private void ClearForm()
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
    }
}
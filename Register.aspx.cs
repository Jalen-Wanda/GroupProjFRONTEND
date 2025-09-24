using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HashPass;
using CampusBookMarket.ServiceReference1;

namespace CampusBookMarket
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


       
            
        protected void btnRegister_Click(object sender, EventArgs e) 
        {

                 Service1Client service = new Service1Client();
                            //check for passwords
            if (reg_password.Value != confirm_password.Value)
            {
                lblResponse.Visible = true;
                lblResponse.Text = "Passwords Do No Match!";
                lblResponse.ForeColor = System.Drawing.Color.Red;
            }
            //if they match
            else
            {
                //create a user
                User u = new User();
                u.name = fullname.Value;
                u.email = reg_email.Value;
                u.password = Secrecy.HashPassword(confirm_password.Value);

                int response = service.Register(u);
                //check response
                if (response == 1)
                {
                    Response.Redirect("Login.aspx");

                }
                else if (response == 0)
                {
                    //successfully logged in
                    lblResponse.Visible = true;
                    lblResponse.Text = "Logged In Successfully..";
                    lblResponse.ForeColor = System.Drawing.Color.Green;

                }
                else
                {
                    lblResponse.Visible = true;
                    lblResponse.Text = "Something Went Wrong ..";
                    lblResponse.ForeColor = System.Drawing.Color.Red;
                }


            }

           
            }
        }
    }
    

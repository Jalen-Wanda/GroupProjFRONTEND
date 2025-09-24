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
        bool trylogin = true;
        bool tryReg = true;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Example logic: if trying to login, show login button and hide register button; vice versa.
           /* if (trylogin)
            {
                loginBtn.Visible = true;
                registerBtn.Visible = false;
            }
            else if (tryReg)
            {
                loginBtn.Visible = false;
                registerBtn.Visible = true;
            }
            else
            {
                // If neither, hide both buttons
                loginBtn.Visible = false;
                registerBtn.Visible = false;
            }*/
        }


        protected void loginBtn_Click(object sender, EventArgs e)
        {
           // trylogin = true;
           // tryReg = false;
            Response.Redirect("login.aspx");
            
        }

        protected void registerBtn_Click(object sender, EventArgs e)
        {
           // tryReg = true;
           // trylogin = false;
           Response.Redirect("Register.aspx");
        }

       
    }
}
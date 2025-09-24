using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampusBookMarket.ServiceReference1;

namespace CampusBookMarket
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
        }

        protected void chkIsAuction_CheckedChanged(object sender, EventArgs e)
        {
            pnlAuction.Visible = chkIsAuction.Checked;
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            Product newProduct = new Product
            {
                name = txtName.Text.Trim(),
                price = decimal.Parse(txtPrice.Text),
                category = ddlCategory.SelectedValue,
                description = txtDescription.Text.Trim(),
                active = 1,
                quatity = int.Parse(txtQuantity.Text),
                icon = txtImageUrl.Text.Trim(),
                userId = Convert.ToInt32(Session["UserId"])
            };

            if (chkIsAuction.Checked)
            {
                newProduct.dateBid = DateTime.Parse(txtAuctionEnd.Text);
            }
            else
            {
                newProduct.dateBid = DateTime.MinValue;
            }

            Service1Client client = new Service1Client();
            int result = client.AddProduct(newProduct);

            if (result == 0)
            {
                lblMessage.Text = "Product added successfully!";
                lblMessage.CssClass = "success-message";
                ClearForm();
            }
            else
            {
                lblMessage.Text = "Error adding product. Please try again.";
            }
        }

        private void ClearForm()
        {
            txtName.Text = "";
            txtPrice.Text = "";
            ddlCategory.SelectedIndex = 0;
            txtDescription.Text = "";
            txtQuantity.Text = "";
            txtImageUrl.Text = "";
            chkIsAuction.Checked = false;
            pnlAuction.Visible = false;
        }
    }
}
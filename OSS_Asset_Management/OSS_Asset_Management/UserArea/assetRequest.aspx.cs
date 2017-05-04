using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OSS_Asset_Management.UserArea
{
    public partial class assetRequest : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
            txtfName.Enabled = false;
            txtUser.Enabled = false;
            txtDate.Attributes["placeholder"] = "dd/MM/yyyy";

            try
            {
                string loggedInUserName = System.Web.HttpContext.Current.User.Identity.Name;
                SqlConnection dataConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["assetuserConnectionString"].ToString());
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT DISTINCT fullName FROM tblUserNameToName WHERE UserName LIKE '" + loggedInUserName + "';";
                cmd.Connection = dataConnection;
                dataConnection.Open();
                cmd.ExecuteNonQuery();
                var fullName = cmd.ExecuteScalar().ToString();
                txtUser.Text = loggedInUserName;
                txtfName.Text = fullName;
                dataConnection.Close();
            }
            catch //if query returns nulls
            {
                lblfName.Text = " user ";
                Response.Redirect("~/default.aspx");
            }

        }

        protected void drpCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string category = drpCategory.SelectedValue;
            string asset = drpAsset.SelectedValue;
    
            //select SQL 
            SqlConnection data  = new SqlConnection(ConfigurationManager.ConnectionStrings["assetuserConnectionString"].ToString());
            SqlCommand select = new SqlCommand();
            select.CommandText = "SELECT DISTINCT aID FROM tblAssets WHERE assetName LIKE '" + asset + "';";
            select.Connection = data;
            data.Open();
            select.ExecuteNonQuery();
            var aID = select.ExecuteScalar().ToString();
            int assetID = Int32.Parse(aID);
            data.Close();


            //insert SQL Command
            int qty = Int32.Parse(txtQty.Text);
            SqlConnection dataConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["assetuserConnectionString"].ToString()); //enables new data connection
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Insert INTO dbo.tblAssetRequest (aID,UserName,loanDate,returnDate,qty,approved) VALUES ("+ assetID + ",'"+ txtUser.Text +"','"+ txtDate.Text + "','" + txtExpectedReturnDate.Text + "'," + qty +",'n');";
            cmd.Connection = dataConnection;
            try
            {
                cmd.Connection = dataConnection;
                dataConnection.Open();
                cmd.ExecuteNonQuery();
                successLiteral.Text = "Success - Await for approval notification via email";
            }

            catch
            {
                successLiteral.Text = "Error - The Request has not been submitted for approval";
            }
            dataConnection.Close();
        }

        protected void txtDate_TextChanged(object sender, EventArgs e)
        {
           
        }
        protected void txtDuration_TextChanged(object sender, EventArgs e)
        {
        
        }

        protected void txtExpectedReturnDate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtDuration.Text)) //validation of inputs
            {
                txtExpectedReturnDate.Text = "Enter Duration";
            }
            else
            {
                //calculates return date
                    int days = Int32.Parse(txtDuration.Text);
                    string requiredDate = txtDate.Text;
                    DateTime r1Date = DateTime.Parse(requiredDate);
                    var date = r1Date.Date;
                    date = date.AddDays(days);
                    txtExpectedReturnDate.Text = date.ToShortDateString();
            }
           
        }
    }
}
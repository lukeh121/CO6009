using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;


namespace OSS_Asset_Management.adminPages
{
    public partial class deleteUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (drpSelectUser.SelectedIndex == 0)
            {
                txtUserName.Visible = false;
                btnDelete.Visible = false;
                lblUserName.Visible = false;
            }
           
        }

        protected void drpSelectUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            string name = drpSelectUser.SelectedValue;
            SqlConnection dataConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["assetuserConnectionString"].ToString()); //enables new data connection
            SqlCommand cmd = new SqlCommand(); 
            cmd.CommandText = "  SELECT dbo.AspNetUsers.UserName FROM tblUserNameToName INNER JOIN dbo.AspNetUsers ON dbo.AspNetUsers.UserName = tblUserNameToName.UserName WHERE tblUserNameToName.fullName LIKE '"+ name + "';"; //command query
            cmd.Connection = dataConnection;
            if (drpSelectUser.SelectedIndex == 0)
            {
            txtUserName.Visible = false;
            btnDelete.Visible = false;
            lblUserName.Visible = false;
            }
            else
            {
                txtUserName.Visible = true;
                btnDelete.Visible = true;
                lblUserName.Visible = true;
            }

           
                cmd.Connection = dataConnection;
                dataConnection.Open();
                cmd.ExecuteNonQuery();
                var uName = cmd.ExecuteScalar().ToString();
                txtUserName.Text = uName;
                dataConnection.Close();
                txtUserName.Enabled = false; 
        }

      



        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string uName = txtUserName.Text;
            string name = drpSelectUser.SelectedValue;

            SqlConnection dataConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["assetuserConnectionString"].ToString()); 
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "DELETE FROM dbo.AspNetUsers WHERE UserName LIKE '"+ uName +"'; DELETE FROM tblUserNameToName WHERE UserName LIKE '"+ uName + "';"; 
            cmd.Connection = dataConnection;
            cmd.Connection = dataConnection;
            dataConnection.Open();
            cmd.ExecuteNonQuery();
            dataConnection.Close();
            txtUserName.Enabled = false;
            litDelete.Text = "Successfully Delelted " + name + "'s Account";

            txtUserName.Text = "";
            txtUserName.Visible = false;
            lblUserName.Visible = false;
            btnDelete.Visible = false;
            drpSelectUser.SelectedIndex = 0;

        }
    }
}
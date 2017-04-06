using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace OSS_Asset_Management.UserArea
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try { 
            string loggedInUserName = System.Web.HttpContext.Current.User.Identity.Name;
            SqlConnection dataConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["assetuserConnectionString"].ToString());
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT DISTINCT fullName FROM tblUserNameToName WHERE UserName LIKE '" + loggedInUserName + "';";
            cmd.Connection = dataConnection;
            dataConnection.Open();
            cmd.ExecuteNonQuery();
            var fullName = cmd.ExecuteScalar().ToString();
            lblfName.Text = fullName;
            dataConnection.Close();
            }
            catch
            {
                lblfName.Text = " user ";
            }



        }
    }
}
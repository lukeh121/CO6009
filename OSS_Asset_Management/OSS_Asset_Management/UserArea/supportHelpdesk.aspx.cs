using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OSS_Asset_Management.UserArea
{
    public partial class supportHelpdesk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //get UserName
            try
            {
                string loggedInUserName = System.Web.HttpContext.Current.User.Identity.Name;
                SqlConnection dataConnection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["assetuserConnectionString"].ToString());
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = "SELECT DISTINCT fullName FROM tblUserNameToName WHERE UserName LIKE '" + loggedInUserName + "';";
                cmd1.Connection = dataConnection1;
                dataConnection1.Open();
                cmd1.ExecuteNonQuery();
                var fullName = cmd1.ExecuteScalar().ToString();
                lblUserName.Text = fullName;
                dataConnection1.Close();
            }
            catch //if query returns nulls
            {
                lblUserName.Text = " user ";
                Response.Redirect("~/default.aspx");
            }

        }
        public void gridTickets_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string value = e.Row.Cells[0].Text;
                if (value.Contains("Logged"))
                {
                    e.Row.Cells[0].ForeColor = System.Drawing.Color.Red;
                }
                if (value.Contains("Completed"))
                {
                    e.Row.Cells[0].ForeColor = System.Drawing.Color.Green;
                }
                if (value.Contains("In Progress"))
                {
                    e.Row.Cells[0].ForeColor = System.Drawing.Color.DarkOrange;
                }
            }
        }
    }
}



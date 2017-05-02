using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OSS_Asset_Management.adminPages
{
    public partial class viewSpecificUser : System.Web.UI.Page
    {
        String uName;
        protected void Page_Load(object sender, EventArgs e)
        {
           uName = Request.QueryString["EntityID"].ToString();

            if (!IsPostBack)
            {
                BindTextBoxvalues();
            }
        }
        private void BindTextBoxvalues()
        {
            string constr = ConfigurationManager.ConnectionStrings["userConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("select * from dbo.AspNetUsers where UserName=" + uName, con);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
           litTitle.Text = dt.Rows[0][0].ToString();
          
        }
    }
}
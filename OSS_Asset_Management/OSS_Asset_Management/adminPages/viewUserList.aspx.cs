using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OSS_Asset_Management.adminPages
{
    public partial class viewUserList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // if (!this.IsPostBack)
          //  {
         //       BindGridView();
          //  }

        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            string userName = gridUsers.SelectedRow.Cells[2].Text;

            GridViewRow row = gridUsers.SelectedRow;
            Response.Redirect("~/adminPages/viewSpecificUser.aspx?EntityID=" + userName);

        }
         private void BindGridView()
        {
          //  SqlConnection dataConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["assetuserConnectionString"].ToString());
           // SqlCommand cmd = new SqlCommand("SELECT DISTINCT tblUserNameToName.fullName, AspNetUsers.UserName, AspNetUsers.Email FROM tblUserNameToName INNER JOIN AspNetUsers ON AspNetUsers.UserName = tblUserNameToName.UserName", dataConnection);
          //  DataTable dt = new DataTable();
          //  SqlDataAdapter da = new SqlDataAdapter(cmd);
          //  da.Fill(dt);
          ///  gridUsers.DataSource = dt;
        //gridUsers.DataBind();
        }
    }



 
}
 
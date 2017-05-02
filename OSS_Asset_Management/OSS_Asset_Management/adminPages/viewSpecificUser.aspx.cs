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
        protected void Page_Load(object sender, EventArgs e)
        {
            string uid = Request.QueryString["uID"];
            litUserName.Text = uid;
        }
       
    }
}
using System;
using System.Collections.Generic;
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

        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            string pName = GridView1.SelectedRow.Cells[2].Text;
            Literal1.Text = pName;
            
        }
    }
}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OSS_Asset_Management.UserArea
{
    public partial class searchAsset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gridSName.Visible = false;
            gridSID.Visible = false;
            gridSLoc.Visible = false;
            gridSCat.Visible = false; 
        }

        protected void btnCat_Click(object sender, EventArgs e)
        {
            //search by Asset ID
            gridSName.Visible = false;
            gridSID.Visible = false;
            gridSLoc.Visible = false;
            gridSCat.Visible = true;
        }

        protected void btnLoc_Click(object sender, EventArgs e)
        {
            //search by location
            gridSName.Visible = false;
            gridSID.Visible = false;
            gridSLoc.Visible = true;
            gridSCat.Visible = false;
        }

        protected void btnName_Click(object sender, EventArgs e)
        {
            //search by name
            gridSName.Visible = true;
            gridSID.Visible = false;
            gridSLoc.Visible = false;
            gridSCat.Visible = false;
        }

        protected void btnID_Click(object sender, EventArgs e)
        {
            //search by ID
            gridSID.Visible = true;
        }
    }
}
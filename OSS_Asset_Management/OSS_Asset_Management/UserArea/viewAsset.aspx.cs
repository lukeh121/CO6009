﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OSS_Asset_Management.UserArea
{
    public partial class viewAsset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string aid = Request.QueryString["aID"];
            lblAsset.Text = aid;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OSS_Asset_Management
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUser.Attributes["placeholder"] = "Username"; // add a placeholder to the username text box
            txtPassword.Attributes["placeholder"] = "Password"; // adds an additonal place holder
        }
    }
}
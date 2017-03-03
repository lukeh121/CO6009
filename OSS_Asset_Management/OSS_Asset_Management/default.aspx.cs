using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security; 

namespace OSS_Asset_Management
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUser.Attributes["placeholder"] = "Username"; // add a placeholder to the username text box
            txtPassword.Attributes["placeholder"] = "Password"; // adds an additonal place holder
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var identityDbContext = new IdentityDbContext("userConnectionString");
            var userStore = new UserStore<IdentityUser>(identityDbContext);
            var uMan = new UserManager<IdentityUser>(userStore);
            var user = uMan.Find(txtUser.Text, txtPassword.Text);
            if (user != null)
            {
                //todo
            }
            else
            {
                litSuccess.Text = "Invalid Username or Password";
            }
        }
        
    }
}
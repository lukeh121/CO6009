using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace OSS_Asset_Management.adminPages
{
    public partial class createUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtNewUser.Attributes["placeholder"] = "Enter a New Username"; // add a placeholder to the username text box
            txtNewPassword.Attributes["placeholder"] = "Enter a New Password"; // adds an additonal place holder
            txtEmail.Attributes["placeholder"] = "Enter User's Email Address";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            var idDbContext = new IdentityDbContext("userConnectionString");
            var userStore = new UserStore<IdentityUser>(idDbContext);
            var uMan = new UserManager<IdentityUser>(userStore);
            var user = new IdentityUser() { UserName = txtNewUser.Text, Email = txtEmail.Text };
            IdentityResult r = uMan.Create(user, txtNewPassword.Text);
            //validation
            if (r.Succeeded)
            {
                registerLiteral.Text = ("Successfully Created " + txtNewUser.Text + "'s Account");
            }
            else
                registerLiteral.Text = "Error Creating Account: " + r.Errors.FirstOrDefault();
        }

        protected void txtConfNewPassword_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
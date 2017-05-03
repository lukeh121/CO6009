using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OSS_Asset_Management.UserArea
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string date = DateTime.Now.ToString();
            lblDateTime.Text = date;
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        { //unused method  
        }

        protected void Timer1_Tick1(object sender, EventArgs e)
        {//unused method
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OSS_Asset_Management.UserArea
{
    public partial class supportTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //get fullName
            try
            {
                string loggedInUserName = System.Web.HttpContext.Current.User.Identity.Name;
                SqlConnection dataConnection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["assetuserConnectionString"].ToString());
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = "SELECT DISTINCT fullName FROM tblUserNameToName WHERE UserName LIKE '" + loggedInUserName + "';";
                cmd1.Connection = dataConnection1;
                dataConnection1.Open();
                cmd1.ExecuteNonQuery();
                var fullName = cmd1.ExecuteScalar().ToString();
                txtUser.Text = fullName;
                dataConnection1.Close();
            }
            catch //if query returns nulls
            {
                txtUser.Text = " user ";
                Response.Redirect("~/default.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //create ticket
            string category = drpCategory.SelectedValue;
            SqlConnection dataConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["assetuserConnectionString"].ToString()); //enables new data connection
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "INSERT INTO dbo.tblSupport (status, category,UserName,description) Values ('Logged'," + drpCategory.SelectedValue + "', '" + txtUser.Text + "', '" + txtDesc.Text + "' );";
            cmd.Connection = dataConnection;
            try
            {
                cmd.Connection = dataConnection;
                dataConnection.Open();
                cmd.ExecuteNonQuery();
                litSuccess.Text = "Support Ticket Creation Successful - Email Notification Sent To Admin";
               
                //send the system admin account an email to notify them of support request.
                MailMessage email = new MailMessage();
                SmtpClient client = new SmtpClient();
                client.Port = 587;
                client.EnableSsl = true;
                client.Host = "smtp.gmail.com";
                client.Timeout = 10000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential("assetplusnotification1@gmail.com", "AssetPlus123");
                email.From = new MailAddress("assetplusnotification1@gmail.com");
                email.To.Add(new MailAddress("assetplusnotification1@gmail.com"));
                email.Subject = "Support Request From: " + txtUser.Text;
                email.Body = "You Have a Support Request From: " + txtUser.Text + " \n Details: \n " + txtDesc.Text;
                client.Send(email);
            }
            catch
            {
                litSuccess.Text = "Error Processing Ticket Please Re-Complete Form";
                dataConnection.Close();
            }

            dataConnection.Close();
        }
    }
}
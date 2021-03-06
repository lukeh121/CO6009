﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Net.Mail;

namespace OSS_Asset_Management.adminPages
{
    public partial class createUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtNewUser.Attributes["placeholder"] = "Enter a New Username"; // add a placeholder to the username text box
            txtNewPassword.Attributes["placeholder"] = "Enter a New Password"; // adds an additonal place holder
            txtEmail.Attributes["placeholder"] = "Enter User's Email Address";
            txtName.Attributes["placeholder"] = "Enter User's Full Name";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string uname, name = null;
            uname = txtNewUser.Text;
            name = txtName.Text;
            SqlConnection dataConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["assetuserConnectionString"].ToString()); //enables new data connection
            SqlCommand cmd = new SqlCommand(); //creates new sqlCommand Object
            cmd.CommandText = "INSERT INTO tblUserNameToName(UserName, fullName) VALUES('" + uname + "', '" + name + "');"; //command query
            cmd.Connection = dataConnection;



            var idDbContext = new IdentityDbContext("userConnectionString");
            var userStore = new UserStore<IdentityUser>(idDbContext);
            var uMan = new UserManager<IdentityUser>(userStore);
            var user = new IdentityUser() { UserName = txtNewUser.Text, Email = txtEmail.Text };
            IdentityResult r = uMan.Create(user, txtNewPassword.Text);
            //validation
            if (r.Succeeded)
            {
                registerLiteral.Text = ("Successfully Created " + txtNewUser.Text + "'s Account");
                dataConnection.Open();
                cmd.ExecuteNonQuery();
                dataConnection.Close();

                //Email credentials
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
                email.To.Add(new MailAddress(txtEmail.Text));
                email.Subject = "Asset+: Account Creation - " + txtName.Text;
                email.Body = "Welcome To Asset+ " + txtName.Text + ", \n Here Are Your New User Credentials: \n Username: " + txtNewUser.Text + " \n Password: "+ txtNewPassword.Text + "\n Kind Regards, \n Asset+";
                client.Send(email);

            }
            else
                registerLiteral.Text = "Error Creating Account: " + r.Errors.FirstOrDefault();

        }

        protected void txtConfNewPassword_TextChanged(object sender, EventArgs e) //unused method
        {

        }
        
    }
}


    
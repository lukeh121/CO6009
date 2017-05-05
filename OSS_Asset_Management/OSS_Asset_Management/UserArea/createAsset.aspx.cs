using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OSS_Asset_Management.UserArea
{
    public partial class createAsset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
       {
             string category = drpCategory.SelectedValue;
            SqlConnection dataConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["assetuserConnectionString"].ToString()); //enables new data connection
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "INSERT INTO dbo.tblAssets (serialNo,assetName,category,qty, manufacturer,model, description) Values ('" + txtSerialNum.Text + "', '" + txtName.Text + "', '" + drpCategory.SelectedValue + "', " + txtQty.Text + ", '"+ txtManuf.Text + "', '"+  txtModel.Text + "', '" + txtDescription.Text + "');"; //command query
            cmd.Connection = dataConnection;

            try { 
                cmd.Connection = dataConnection;
                dataConnection.Open();
                cmd.ExecuteNonQuery();
                successLiteral.Text = "Asset Addition Successful";
           }
            catch
            {
                successLiteral.Text = "Error Storing Asset Please Re-Complete Form";
                dataConnection.Close();
            }
           
            dataConnection.Close();
            //selection of Asset ID
            SqlConnection dataConnection2 = new SqlConnection(ConfigurationManager.ConnectionStrings["assetuserConnectionString"].ToString());
            SqlCommand command = new SqlCommand();
            command.CommandText = "Select aID  from dbo.tblAssets where assetName like '" + txtName.Text +"'";
            command.Connection = dataConnection2;
            dataConnection2.Open();
            command.ExecuteNonQuery();
            var assetID = command.ExecuteScalar().ToString();
            int id = Int32.Parse(assetID);
            dataConnection2.Close();
         

            SqlConnection dataConnection3 = new SqlConnection(ConfigurationManager.ConnectionStrings["assetuserConnectionString"].ToString());
            //Inserting Availavbility of asset
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = "INSERT INTO dbo.tblAssetAvailability (aID,availability) Values (" + id + ", 'Available');";
            cmd2.Connection = dataConnection3;
            dataConnection3.Open();
            cmd2.ExecuteNonQuery();
            dataConnection2.Close();
           
        }
    }
}
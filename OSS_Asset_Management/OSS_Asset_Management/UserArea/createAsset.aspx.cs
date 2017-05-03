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
            }
           
            dataConnection.Close();
        }
    }
}
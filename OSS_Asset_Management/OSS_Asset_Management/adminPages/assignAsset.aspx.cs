using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OSS_Asset_Management.adminPages
{
    public partial class assignAsset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtReturnDate.Attributes["placeholder"] = "dd/MM/YYYY";
        }

        protected void drpCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {

            //calculates Loan date
            DateTime now = DateTime.Now;
            String date = now.ToShortDateString();
            string rdate = txtReturnDate.Text;
            DateTime dt = DateTime.Parse(rdate);

            //selection of Asset ID
            SqlConnection dataConnection2 = new SqlConnection(ConfigurationManager.ConnectionStrings["assetuserConnectionString"].ToString());
            SqlCommand command = new SqlCommand();
            command.CommandText = "Select aID  from dbo.tblAssets where assetName like '" + drpAsset.SelectedValue + "'";
            command.Connection = dataConnection2;
            dataConnection2.Open();
            command.ExecuteNonQuery();
            var assetID = command.ExecuteScalar().ToString();
            int id = Int32.Parse(assetID);
            dataConnection2.Close();

            //ammend availability of asset
            string category = drpCategory.SelectedValue;
            SqlConnection dataConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["assetuserConnectionString"].ToString()); //enables new data connection
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "UPDATE tblAssetAvailability Set fullName = '" + drpUser.SelectedValue + "', loanDate = '" + now + "', returnDate = '" + dt + "' Where tblAssetAvailability.aID =" + assetID + ";";
            cmd.Connection = dataConnection;

            try
            {
                cmd.Connection = dataConnection;
                dataConnection.Open();
                cmd.ExecuteNonQuery();
                successLiteral.Text = "Asset Assignemnt Successful";
            }
            catch
            {
                successLiteral.Text = "Error Storing Asset Allocation Please Re-Complete Form";
                dataConnection.Close();
            }
        }
    }
}
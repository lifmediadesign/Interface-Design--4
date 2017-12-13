using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace HandIn3
{
    public partial class Treatments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAddTreatmetn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = Dentist");
            SqlDataAdapter da = null;
            DataSet ds = null;
            DataTable dt = null;
            SqlCommand cmd = null;
            string sqlsel = "select * from treatments";
            string sqlins = "insert into treatments values (@Name, @Price, @Picture)";

            try
            {
                //conn.Open();
                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand(sqlsel, conn);

                ds = new DataSet();
                da.Fill(ds, "MyTreatments");

                dt = ds.Tables["MyTreatments"];

                //Add the new shipper
                DataRow newrow = dt.NewRow(); //empty row for the table
                newrow["name"] = TextBoxName.Text; //name of new row
                newrow["price"] = TextBoxPrice.Text;
                newrow["picture"] = TextBoxPicture.Text;
                // The row is not attached yet so we add it
                dt.Rows.Add(newrow); // now it's added

                cmd = new SqlCommand(sqlins, conn);
                cmd.Parameters.Add("@Name", SqlDbType.Text, 50, "name");
                cmd.Parameters.Add("@Price", SqlDbType.Decimal, 2, "price");
                cmd.Parameters.Add("@Picture", SqlDbType.VarChar, 250, "picture");

                da.InsertCommand = cmd;
                da.Update(ds, "MyTreatments");

                LabelMessage.Text = "Treatment added";
            }
            catch (Exception ex)
            {
                LabelMessage.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
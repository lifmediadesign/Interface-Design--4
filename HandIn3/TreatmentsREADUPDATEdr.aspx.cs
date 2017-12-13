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
    public partial class TreatmentsREADUPDATE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UpdateGridview();
        }

        public void UpdateGridview()
        {
            SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = Dentist");
            SqlDataAdapter da = null;
            DataSet ds = null; //collection of tables (Used instead of a datareader)
            DataTable dt = null; // data tables inside the data set

            string sqlsel = "select * from treatments";

            try
            {
                //conn.Open(); SqlDataAdapter opens the connection itself

                da = new SqlDataAdapter(); // the new makes a new object
                da.SelectCommand = new SqlCommand(sqlsel, conn);

                ds = new DataSet();
                da.Fill(ds, "MyTreatments"); // fills the dataset

                dt = ds.Tables["MyTreatments"]; // we take the information from the dataset and inputs in the table

                GridViewTreatments.DataSource = dt;
                GridViewTreatments.DataBind();
            }
            catch (Exception ex)
            {
                LabelMessage.Text = ex.Message;
            }
            finally
            {
                conn.Close(); //The SqlDataAdaptor closes connection by itself; but if something goes wrong, the DataAdaptor can not close the connection
            }

        }

        protected void GridViewTreatments_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBoxName.Text = GridViewTreatments.SelectedRow.Cells[2].Text;
            TextBoxPrice.Text = GridViewTreatments.SelectedRow.Cells[3].Text;
            TextBoxPicture.Text = GridViewTreatments.SelectedRow.Cells[4].Text;
            LabelMessage.Text = "You chose Treatment number " + GridViewTreatments.SelectedRow.Cells[1].Text;
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = Dentist");
            SqlDataAdapter da = null;
            DataSet ds = null;
            DataTable dt = null;
            SqlCommand cmd = null;
            string sqlsel = "select * from treatments";
            string sqlupd = "update treatments set name = @Name, price = @Price, picture = @Picture where treatmentID = @TreatmentID";

            try
            {
                //conn.Open();
                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand(sqlsel, conn);

                ds = new DataSet();
                da.Fill(ds, "MyTreatments");

                dt = ds.Tables["MyTreatments"];
                dt.Rows[GridViewTreatments.SelectedIndex]["name"] = TextBoxName.Text; // we take the data we are typing in the textbox and put it in the local instance of the table
                dt.Rows[GridViewTreatments.SelectedIndex]["price"] = TextBoxPrice.Text;
                dt.Rows[GridViewTreatments.SelectedIndex]["picture"] = TextBoxPicture.Text;

                cmd = new SqlCommand(sqlupd, conn);
                //Parameters
                cmd.Parameters.Add("@Name", SqlDbType.Text, 50, "name");
                cmd.Parameters.Add("@Price", SqlDbType.Decimal, 2, "price");
                cmd.Parameters.Add("@Picture", SqlDbType.VarChar, 250, "picture");
                SqlParameter parm = cmd.Parameters.Add("@TreatmentID", SqlDbType.Int, 4, "treatmentID");
                // Good habit if someone has changed the primary key
                parm.SourceVersion = DataRowVersion.Original; // when updating the database use the original source version, not the changed one.

                da.UpdateCommand = cmd;
                //Take the copy and sent it to the database to update it
                da.Update(ds, "MyTreatments");

                LabelMessage.Text = "Treatment has been updated";
            }
            catch (Exception ex)
            {
                LabelMessage.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            UpdateGridview();
        }
    }
}
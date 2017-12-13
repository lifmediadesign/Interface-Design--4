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
    public partial class TreatmentsDelete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                UpdateGridview();
            }
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

                DropDownListTreatments.DataSource = dt;
                DropDownListTreatments.DataTextField = "name";
                DropDownListTreatments.DataValueField = "treatmentID";
                DropDownListTreatments.DataBind();
                DropDownListTreatments.Items.Insert(0, "Select a treatment");
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

        protected void DropDownListTreatments_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListTreatments.SelectedIndex != 0)
            {
                LabelMessage.Text = "You chose treatment number " + DropDownListTreatments.SelectedValue;
            }
            else
            {
                LabelMessage.Text = "You chose none";
            }
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = Dentist");
            SqlDataAdapter da = null;
            SqlCommandBuilder cb = null;
            DataSet ds = null;
            DataTable dt = null;
            string sqlsel = "select * from treatments";

            try
            {
                //conn.Open();
                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand(sqlsel, conn);

                cb = new SqlCommandBuilder(da);

                ds = new DataSet();
                da.Fill(ds, "MyTreatments");

                dt = ds.Tables["MyTreatments"];

                //go to the local and select the shipperID that equals the one we selected
                foreach (DataRow row in dt.Select("treatmentID = " + Convert.ToInt32(DropDownListTreatments.SelectedValue)))
                {
                    row.Delete();
                }
                da.Update(ds, "MyTreatments");
                ButtonDelete.Enabled = false;
                LabelMessage.Text = "treatment number " + DropDownListTreatments.SelectedValue + " has been deleted";
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
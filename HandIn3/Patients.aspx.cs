using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// when making a connection to a Database
using System.Data;
using System.Data.SqlClient;

namespace HandIn3
{
    public partial class Patients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                LabelMessage.Text = "Welcome " + Session["email"].ToString(); //+ Session["patientID"].ToString();

                UpdateGridView();
            }
            else
            {
                Response.Redirect("~/Index.aspx");
            }

            
        }
        public void UpdateGridView()
        {
            SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = Dentist");
            SqlCommand cmd = null;
            SqlDataReader rdr = null;

            try
            {
                conn.Open();
                //Use Stored Procedures
                cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Myselectloggedinpatientreservation";

                SqlParameter in1 = cmd.Parameters.Add("@patientID", SqlDbType.Int);
                in1.Direction = ParameterDirection.Input;
                in1.Value = Convert.ToInt32(Session["patientID"].ToString());


                rdr = cmd.ExecuteReader();

                GridViewReservation.DataSource = rdr;
                GridViewReservation.DataBind();

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

        protected void GridViewReservation_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = Dentist");
            SqlCommand cmd = null;
            SqlDataReader rdr = null;

            try
            {
                conn.Open();

                cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Myselectpatientreservation";


                SqlParameter in1 = cmd.Parameters.Add("@patientID", SqlDbType.Int);
                in1.Direction = ParameterDirection.Input;
                //in1.Value = Convert.ToInt32(GridViewReservation.SelectedRow.Cells[1].Text);

                SqlParameter out1 = cmd.Parameters.Add("@patientCount", SqlDbType.Int);
                out1.Direction = ParameterDirection.Output;


                rdr = cmd.ExecuteReader();

                rdr.Read(); // returns true or false

                //DropDownListTreatmentName.Text = rdr.GetString(2);
                TextBoxDate.Text = rdr.GetString(2);
                //TextBoxTime.Text = rdr.GetString(4).ToString();

                rdr.Close(); //Close before we can get the output parameter

                LabelMessage.Text = "you have chosen patientID " + GridViewReservation.SelectedRow.Cells[1].Text + " from the " + cmd.Parameters["@patientCount"].Value + " shipper";
               
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
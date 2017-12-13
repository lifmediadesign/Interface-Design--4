using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// Connection to database
using System.Data;
using System.Data.SqlClient;

namespace HandIn3
{
    public partial class PatientCreateReservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                LabelMessage.Text = "Welcome " + Session["email"].ToString();
            }
            else
            {
                Response.Redirect("~/Index.aspx");
            }

            SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = Dentist");
            SqlCommand cmd = null;
            SqlDataReader rdr = null;

            try
            {
                conn.Open();
                //use stored procedures
                cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Myselectnamefromtreatments";
                rdr = cmd.ExecuteReader(); // sent to the database, get the result back

                while (rdr.Read()) {
                    ListItem listItem = new ListItem();

                    listItem.Text = rdr["name"].ToString();
                    listItem.Value = rdr["treatmentID"].ToString();

                    DropDownListTreatmentName.Items.Add(listItem);
                }
                
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

        protected void ButtonNewReservation_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = Dentist");
            SqlCommand cmd = null;
            string sqlins = "insert into reservations values (@PatientID, @TreatmentID, @Date, @Time, @State, @Phone)";

            try
            {
                conn.Open();

                cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Myinsertreservation";

                SqlParameter in0 = cmd.Parameters.Add("PatientID", SqlDbType.Int);
                in0.Direction = ParameterDirection.Input;
                in0.Value = Session["patientID"];

                SqlParameter in1 = cmd.Parameters.Add("@TreatmentID", SqlDbType.Int);
                in1.Direction = ParameterDirection.Input;
                in1.Value = Convert.ToInt32(DropDownListTreatmentName.Text);

                SqlParameter in2 = cmd.Parameters.Add("@Date", SqlDbType.Text);
                in2.Direction = ParameterDirection.Input;
                in2.Value = TextBoxDate.Text;
                

                SqlParameter in3 = cmd.Parameters.Add("@Time", SqlDbType.Time);
                in3.Direction = ParameterDirection.Input;
                in3.Value = (Convert.ToDateTime(TextBoxTime.Text)).ToString("HH:mm");

                SqlParameter in5 = cmd.Parameters.Add("@Phone", SqlDbType.Int);
                in5.Direction = ParameterDirection.Input;
                in5.Value = TextBoxPhone.Text;

                SqlParameter in4 = cmd.Parameters.Add("@State", SqlDbType.Int);
                in4.Direction = ParameterDirection.Input;
                in4.Value = 0;

               

                cmd.ExecuteNonQuery();

                LabelMessage.Text = "Reservation added";
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
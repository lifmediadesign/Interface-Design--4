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
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadioButtonListInsurance_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonNewPatient_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = Dentist");
            SqlDataAdapter da = null;
            DataSet ds = null;
            DataTable dt = null;
            SqlCommand cmd = null;
            string sqlsel = "Myselectallpatients";
            string sqlins = "insert into patients values (@name, @SSN, @insurance, @gender, @age, @email, @password, @phone)";

            try
            {
                //conn.Open();
                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand(sqlsel, conn);

                ds = new DataSet();
                da.Fill(ds, "MyPatients");

                dt = ds.Tables["MyPatients"];

                //Add the new patient
                DataRow newrow = dt.NewRow(); //empty row for the table
                newrow["Name"] = TextBoxFirstName.Text; //name of new row
                newrow["SSN"] = TextBoxSSN.Text;
                newrow["Insurance"] = RadioButtonListInsurance.Text;
                newrow["Gender"] = DropDownListGender.Text;
                newrow["Age"] = TextBoxAge.Text;
                newrow["Email"] = TextBoxEmail.Text;
                newrow["Password"] = TextBoxPassword.Text;
                newrow["Phone"] = TextBoxPhone.Text;
                // The row is not attached yet so we add it
                dt.Rows.Add(newrow); // now it's added

                cmd = new SqlCommand(sqlins, conn);
                cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50, "Name");
                cmd.Parameters.Add("@SSN", SqlDbType.NVarChar, 50, "SSN");
                cmd.Parameters.Add("@insurance", SqlDbType.NChar, 10, "Insurance");
                cmd.Parameters.Add("@gender", SqlDbType.NChar, 10, "Gender");
                cmd.Parameters.Add("@age", SqlDbType.Int, 4, "Age");
                cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50, "Email");
                cmd.Parameters.Add("@password", SqlDbType.NChar, 10, "Password");
                cmd.Parameters.Add("@phone", SqlDbType.NChar, 10, "Phone");


                da.InsertCommand = cmd;
                da.Update(ds, "MyPatients");

                LabelMessage.Text = "Patient added";
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
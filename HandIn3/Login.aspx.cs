using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace HandIn3
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = Dentist;");
        SqlCommand cmd = null;
        SqlDataReader rdr = null;


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {

            try
            {
                conn.Open();

                cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Mylogin";

                SqlParameter in1 = cmd.Parameters.Add("@Email", SqlDbType.Text);
                in1.Direction = ParameterDirection.Input;
                in1.Value = TextBoxEmail.Text;

                SqlParameter in2 = cmd.Parameters.Add("@Password", SqlDbType.Text);
                in2.Direction = ParameterDirection.Input;
                in2.Value = TextBoxPassword.Text;


                rdr = cmd.ExecuteReader();

                if (rdr.Read())
                {
                    Session["email"] = in1.Value.ToString();
                    Session["patientID"] = rdr.GetSqlInt32(0);
                    HttpContext.Current.Session["patientID"] = rdr.GetValue(0).ToString();
                    string userloggedin = HttpContext.Current.Session["email"].ToString();



                    Response.Redirect("~/Patients.aspx");
                }
                else
                {
                    Response.Write("Login Failed");
                }

            }
            catch (Exception ex)
            {
                //LabelMessage.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }

        }
    }
}
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
    public partial class Reservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {
                UpdateGridView();
                
            }
            
        }
        public void UpdateGridView()
        {
            SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = Dentist");
            SqlDataAdapter da = null;
            DataSet ds = null; //collection of tables (Used instead of a datareader)
            DataTable dt = null; // data tables inside the data set

            string sqlsel = "Myselectallreservations";

            try
            {
                //conn.Open(); SqlDataAdapter opens the connection itself

                da = new SqlDataAdapter(); // the new makes a new object
                da.SelectCommand = new SqlCommand(sqlsel, conn);

                ds = new DataSet();
                da.Fill(ds, "MyReservations"); // fills the dataset

                dt = ds.Tables["MyReservations"]; // we take the information from the dataset and inputs in the table

                GridViewReservations.DataSource = dt;
                GridViewReservations.DataBind();

                DropDownListPatient.DataSource = dt;
                DropDownListPatient.DataTextField = "name";
                DropDownListPatient.DataValueField = "patientID";
                DropDownListPatient.DataBind();
                DropDownListPatient.Items.Insert(0, "Select a patient");

                DropDownDate.DataSource = dt;
                DropDownDate.DataTextField = "date";
                DropDownDate.DataValueField = "date";
                DropDownDate.DataBind();
                DropDownDate.Items.Insert(0, "Select a date");

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

        protected void ButtonAllRes_Click(object sender, EventArgs e)
        {
            UpdateGridView();
        }

        protected void DropDownListPatient_SelectedIndexChanged(object sender, EventArgs e)
        { 
            if (DropDownListPatient.SelectedIndex != 0)
            {
                SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = Dentist");
                SqlDataAdapter da = null;
                SqlCommandBuilder cb = null;
                DataSet ds = null;
                DataTable dt = null;
                string sqlsel = "SELECT patients.patientID, treatments.name, reservations.date, reservations.time FROM patients, treatments, reservations WHERE reservations.treatmentID = treatments.treatmentID AND reservations.patientID = patients.patientID AND patients.patientID = " + DropDownListPatient.SelectedValue;

                GridViewReservations.DataSource = dt;
                GridViewReservations.DataBind();

                //TextBox1.Text = DropDownList1.SelectedItem.Value;




                try
                {
                    //conn.Open(); SqlDataAdapter opens the connection itself

                    da = new SqlDataAdapter(); // the new makes a new object
                    da.SelectCommand = new SqlCommand(sqlsel, conn);

                    ds = new DataSet();
                    da.Fill(ds, "MyReservations"); // fills the dataset

                    dt = ds.Tables["MyReservations"]; // we take the information from the dataset and inputs in the table

                    GridViewReservations.DataSource = dt;
                    GridViewReservations.DataBind();


                }
                catch (Exception ex)
                {
                    LabelMessage.Text = ex.Message;
                }
                finally
                {
                    conn.Close();
                }
                //LabelMessage.Text = "You choose PatientID" + DropDownListPatient.SelectedValue; 
            }
            else
            {
                    LabelMessage.Text = "You Choose none";
            }
            
            
        }

        protected void DropDownDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListPatient.SelectedIndex != 0)
            {
                SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = Dentist");
                SqlDataAdapter da = null;
                SqlCommandBuilder cb = null;
                DataSet ds = null;
                DataTable dt = null;
                string sqlsel = "SELECT reservations.date, reservations.time, treatments.name, patients.name FROM reservations, treatments, patients WHERE reservations.treatmentID = treatments.treatmentID AND reservations.patientID = patients.patientID AND reservations.date = '" + DropDownDate.SelectedValue + "'";

                GridViewReservations.DataSource = dt;
                GridViewReservations.DataBind();

                //TextBox1.Text = DropDownList1.SelectedItem.Value;




                try
                {
                    //conn.Open(); SqlDataAdapter opens the connection itself

                    da = new SqlDataAdapter(); // the new makes a new object
                    da.SelectCommand = new SqlCommand(sqlsel, conn);

                    ds = new DataSet();
                    da.Fill(ds, "MyReservations"); // fills the dataset

                    dt = ds.Tables["MyReservations"]; // we take the information from the dataset and inputs in the table

                    GridViewReservations.DataSource = dt;
                    GridViewReservations.DataBind();


                }
                catch (Exception ex)
                {
                    LabelMessage.Text = ex.Message;
                }
                finally
                {
                    conn.Close();
                }
                //LabelMessage.Text = "You choose PatientID" + DropDownListPatient.SelectedValue; 
            }
            else
            {
                LabelMessage.Text = "You Choose none";
            }
        }
    }
}
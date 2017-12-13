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
    public partial class prices : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = Dentist");
        SqlCommand cmd = null; //What we send
        SqlDataReader rdr = null; // What we recieve
        string sqlsel = "";

        DataSet ds;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            RepeaterTreatments.DataBind();
            sqlsel = "Myselectalltreatments";
            ShowMyData();
            
        }
        public void MakeNewDataSetAndDataTable()
        {
            ds = new DataSet("Sponsors");
            dt = ds.Tables.Add("Sponsor");
            dt.Columns.Add("SponsorID", typeof(Int32));
            dt.Columns.Add("Name", typeof(string));
            dt.Columns.Add("Website", typeof(string));
            dt.Columns.Add("Picture", typeof(string));
        }
        public void ShowMyData()
        {

            try
            {
                conn.Open();

                cmd = new SqlCommand(sqlsel, conn);

                rdr = cmd.ExecuteReader();
                RepeaterTreatments.DataSource = rdr;
                RepeaterTreatments.DataBind();
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
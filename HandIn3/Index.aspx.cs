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
    public partial class Index : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = Dentist");
        SqlCommand cmd = null; //What we send
        SqlDataReader rdr = null; // What we recieve
        string sqlsel = "";

        DataSet ds;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            // Remember to add DataBind() Everytime connecting to a database
            //LabelMessage.Text = "No Error Message";

            sqlsel = "Myselectalltreatments";
            //ShowMyData();
            UpdatePage();

        }
        public void UpdatePage()
        {
            try
            {
                ds = new DataSet();
                ds.ReadXml(Server.MapPath("~/sponsers.xml"));
                dt = ds.Tables["Sponsor"];

            }
            catch
            {
                // The XML file does not excist or is empty; dt made only for display of repeater heading
                MakeNewDataSetAndDataTable();
            }
            finally
            {
                RepeaterSponsor.DataSource = dt;
                RepeaterSponsor.DataBind();

            }

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
        
    }
}
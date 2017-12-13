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
    public partial class AdminSponsors : System.Web.UI.Page
    {
        //Declaring the dataset and datatable
        DataSet ds;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            //If the page is NOT postback, run method updatepage
            if (!Page.IsPostBack)
            {
                UpdatePage();
            }
            else
            {
                //If the index in the dropdownlist is more then
                if (DropDownListSponsors.SelectedIndex != 0)
                {
                    ds = new DataSet();
                    ds.ReadXml(Server.MapPath("~/sponsers.xml"));
                    dt = ds.Tables["Sponsor"];

                    foreach (DataRow r in dt.Select("SponsorID = " + Convert.ToInt32(DropDownListSponsors.SelectedValue)))
                    {
                        TextBoxID.Text = r["SponsorID"].ToString();
                        TextBoxName.Text = r["Name"].ToString();
                        TextBoxWebsite.Text = r["Website"].ToString();
                        TextBoxPicture.Text = r["Picture"].ToString();
                    }

                    LabelMessages.Text = TextBoxName.Text + " has been selected";

                    // Selected index must be 0 at next page load to avoid old data to be read into the TextBox's
                    DropDownListSponsors.SelectedIndex = 0;

                    ButtonCreate.Enabled = false;
                    ButtonUpdate.Enabled = true;
                    ButtonDelete.Enabled = true;
                }
            }

        }

        public void UpdatePage()
        {
            DropDownListSponsors.AutoPostBack = true;
            DropDownListSponsors.Items.Clear();
            try
            {
                ds = new DataSet();
                ds.ReadXml(Server.MapPath("~/sponsers.xml"));
                dt = ds.Tables["Sponsor"];

                DropDownListSponsors.DataSource = dt;
                DropDownListSponsors.DataTextField = dt.Columns[1].ToString();
                DropDownListSponsors.DataValueField = dt.Columns[0].ToString();
                DropDownListSponsors.DataBind();
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

                DropDownListSponsors.Items.Insert(0, "You can choose a Sponsor");
            }

            TextBoxID.Text = "";
            TextBoxName.Text = "";
            TextBoxWebsite.Text = "";
            TextBoxPicture.Text = "";
            ButtonCreate.Enabled = true;
            ButtonUpdate.Enabled = false;
            ButtonDelete.Enabled = false;
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

        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            try
            {
                ds = new DataSet();
                ds.ReadXml(Server.MapPath("~/sponsers.xml"));
                dt = ds.Tables["Sponsor"];
            }
            catch
            {
                // The xml file does not excist
                MakeNewDataSetAndDataTable();
            }

            int maxSponsorID = 0;
            if (dt == null)
            {
                // The XML file excists, but is empty
                MakeNewDataSetAndDataTable();
            }
            else
            {
                foreach (DataRow r in dt.Rows)
                {
                    if (Convert.ToInt32(r["SponsorID"].ToString()) > maxSponsorID) maxSponsorID = Convert.ToInt32(r["SponsorID"].ToString());
                }
            }

            DataRow newRow = dt.NewRow();
            newRow["SponsorID"] = maxSponsorID + 1;
            newRow["Name"] = TextBoxName.Text;
            newRow["Website"] = TextBoxWebsite.Text;
            newRow["Picture"] = TextBoxPicture.Text;
            dt.Rows.Add(newRow);

            ds.WriteXml(Server.MapPath("~/sponsers.xml"));

            LabelMessages.Text = TextBoxName.Text + " has been created with SponsorID " + (maxSponsorID + 1);
            UpdatePage();
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            ds = new DataSet();
            ds.ReadXml(Server.MapPath("~/sponsers.xml"));
            dt = ds.Tables["Sponsor"];

            foreach (DataRow r in dt.Select("SponsorID = " + TextBoxID.Text))
            {
                r["SponsorID"] = Convert.ToInt32(TextBoxID.Text);
                r["Name"] = TextBoxName.Text;
                r["Website"] = TextBoxWebsite.Text;
                r["Picture"] = TextBoxPicture.Text;
            }

            ds.WriteXml(Server.MapPath("~/sponsers.xml"));
            LabelMessages.Text = TextBoxName.Text + " has been updated";
            UpdatePage();
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            ds = new DataSet();
            ds.ReadXml(Server.MapPath("~/sponsers.xml"));
            dt = ds.Tables["Sponsor"];

            foreach (DataRow r in dt.Select("SponsorID = " + TextBoxID.Text))
            {
                r.Delete();
            }

            ds.WriteXml(Server.MapPath("~/sponsers.xml"));
            LabelMessages.Text = TextBoxName.Text + " has been deleted";
            UpdatePage();
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            LabelMessages.Text = "Input fields have been cleared";
            UpdatePage();
        }
    }
}
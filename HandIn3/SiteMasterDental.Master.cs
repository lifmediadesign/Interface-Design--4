using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HandIn3
{
    public partial class SiteMasterDental : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogOut_Click(object sender, EventArgs e)
        {
            Session.Remove("email");
            Response.Redirect("~/Index.aspx");
        }
    }
}
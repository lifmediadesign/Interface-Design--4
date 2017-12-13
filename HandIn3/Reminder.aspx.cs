using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

namespace HandIn3
{
    public partial class Reminder : System.Web.UI.Page
    {
        private Timer timer = new Timer();
        private int id;
        private int status;
        private int phone;
        private string message;

        protected void Page_Load(object sender, EventArgs e)
        {
            FileStream fs = new FileStream(Server.MapPath("/ServiceStatus/ServiceStats3.txt"), FileMode.OpenOrCreate, FileAccess.Write);
            StreamWriter m_streamWriter = new StreamWriter(fs);

            m_streamWriter.BaseStream.Seek(0, SeekOrigin.End);
            m_streamWriter.WriteLine("Verifying for any request to process..." + DateTime.Now.ToLongTimeString());

            DataTable dt = GetMessagesState0();
            foreach (DataRow dr in dt.Rows)
            {
                id = (int)dr[0];
                status = (int)dr[5];
                phone = (int)dr[6];
                message = dr[1].ToString();
                m_streamWriter.WriteLine("Sending Email/SMS for the request id = {0} and the message is: {1}", id, message);
                if (UpdateMessageStatus(id, 1, 0))
                {
                    SendEMail(String.Format("Re:Request#{0}", id), message, phone);
                    UpdateMessageStatus(id, 2, 1);
                }
            }

            m_streamWriter.Flush();
            m_streamWriter.Close();
            fs.Close();

        }

        public DataTable GetMessagesState0(params SqlParameter[] arrParam)
        {
            DataTable dt = new DataTable();

            // Open the connection 
            using (SqlConnection cnn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = Dentist;"))
            {
                //to get all the reservations if any that are 3 days before the reservation date
                string sqlsel = "Select * from reservations where state=0 AND date<= CONVERT(VARCHAR(50), DATEADD(DAY, 1, GETDATE()), 11) and patientID = patientID";
                cnn.Open();

                // Define the command 
                using (SqlCommand cmd = new SqlCommand(sqlsel, cnn))
                {
                    cmd.Connection = cnn;
                    //cmd.CommandType = CommandType.StoredProcedure;
                    //cmd.CommandText = "spNS_GetMessages";

                    // Handle the parameters 
                    if (arrParam != null)
                    {
                        foreach (SqlParameter param in arrParam)
                            cmd.Parameters.Add(param);
                    }

                    // Define the data adapter and fill the dataset 
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                        //                    UpdateMessageStatus(id, 0);
                    }
                }
                cnn.Close();
            }
            return dt;
        }

        public bool UpdateMessageStatus(int id, int newstatus, int oldstatus)
        {
            int rowsChanged = 0;
            // Open the connection 
            using (SqlConnection cnn = new SqlConnection(@"data source = .\sqlexpress; integrated security = true; database = Dentist;"))
            {
                cnn.Open();

                // Define the command 
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "UpdateStatusFromRes";

                    SqlParameter param = new SqlParameter("@res_id", id);
                    cmd.Parameters.Add(param);
                    param = new SqlParameter("@res_status", newstatus);
                    cmd.Parameters.Add(param);
                    param = new SqlParameter("@res_oldstatus", oldstatus);
                    cmd.Parameters.Add(param);

                    rowsChanged = cmd.ExecuteNonQuery();
                }
                cnn.Close();
            }


            return rowsChanged > 0;
        }


        


        public void SendEMail(string subject, string body, int phone)
        {
            // Find your Account Sid and Auth Token at twilio.com/console
            const string accountSid = "AC7b86a036c4c37179de57a2a934ff1586";
            const string authToken = "56fe4874be3076b5fc8470d4d8dea56e";
            TwilioClient.Init(accountSid, authToken);

            var to = new PhoneNumber("+45" + phone.ToString());
            var message = MessageResource.Create(to, from: new PhoneNumber("+17707661666"), body: "You have appointment.");

        }



    }
}
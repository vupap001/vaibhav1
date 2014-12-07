using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class PasswordReset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ConnectionString);
            conn.Open();

            string checkuser = "select count(*) from Registration where Username ='" + TextBox1.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, conn);
            string temp1 = com.ExecuteScalar().ToString();
            
               int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
               conn.Close();
               if (temp > 0)
               {
                   conn.Open();
                   string checkpassword = "select Password from Registration where Username ='" + TextBox1.Text + "'";
                   SqlCommand com1 = new SqlCommand(checkpassword, conn);
                   string temp2 = com1.ExecuteScalar().ToString();

                   string checkEmail = "select EmailId from Registration where Username ='" + TextBox1.Text + "'";
                   SqlCommand com2 = new SqlCommand(checkEmail, conn);
                   string temp3 = com2.ExecuteScalar().ToString();

                   conn.Close();
                   string fromAddress = "recoveryconferencesystem@gmail.com";
                   string mailPassword = "123456@123";       // Mail id password from where mail will be sent.
                   string messageBody = "Username: " + TextBox1.Text  + "                 Your Password is : " + temp2;


                   // Create smtp connection.
                   SmtpClient client = new SmtpClient();
                   client.Port = 587;//outgoing port for the mail.
                   client.Host = "smtp.gmail.com";
                   client.EnableSsl = true;
                   client.Timeout = 10000;
                   client.DeliveryMethod = SmtpDeliveryMethod.Network;
                   client.UseDefaultCredentials = false;
                   client.Credentials = new System.Net.NetworkCredential(fromAddress, mailPassword);


                   // Fill the mail form.
                   var send_mail = new MailMessage();

                   send_mail.IsBodyHtml = true;
                   //address from where mail will be sent.
                   send_mail.From = new MailAddress(fromAddress);
                   //address to which mail will be sent.           
                   send_mail.To.Add(new MailAddress(temp3));
                   //subject of the mail.
                   send_mail.Subject = "Password Recovery";

                   send_mail.Body = messageBody;
                   client.Send(send_mail);
                   Label3.Visible = true;
                   Label3.Text = "Password has been sent to your Email Id";
               }
               else
               {
                   Label3.Text = "Enter valid UserID";
               }
        }
    }
}

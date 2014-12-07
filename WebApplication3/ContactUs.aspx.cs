using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string fromAddress = "feedback.conferencesystem@gmail.com";
            string toAddress = "recoveryconferencesystem@gmail.com";
           
            
            string mailPassword = "123456@123";       // Mail id password from where mail will be sent.
            string messageBody = "<br />Name: " + TextBox1.Text + "<br /> <br />" + "Email  ID : " + TextBox2.Text + "<br /><br /><br />" + "Comment::" + "<br /><br />" + TextBox3.Text;
            //string messageBody = messageBody1.Replace(Environment.NewLine, "\n"");


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
            send_mail.To.Add(new MailAddress(toAddress));
            //subject of the mail.
            send_mail.Subject = "Feedback for Conference Management System";

            send_mail.Body = messageBody;
            client.Send(send_mail);
            Label1.Visible = true;
            Label1.Text = "Your Feedback has been submited Sucessfull";
            TextBox1.Text = " "; 
            TextBox2.Text = " ";
            TextBox3.Text = " ";
        }
    }
}
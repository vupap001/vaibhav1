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
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Net.Mail;


namespace WebApplication1
{
    public partial class userinfo : System.Web.UI.Page
    {
        static int tempamt;
        static int cartamount;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New2"] != null)
            {
                Response.Redirect("admin.aspx");
            }
            if (Session["New"] != null)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ConnectionString);
                conn.Open();

                LabelUser.Text = Session["New"].ToString().ToUpper();

                string checkpid = "select Id from Registration where Username ='" + Session["New"].ToString() + "'";
                SqlCommand com4 = new SqlCommand(checkpid, conn);
                string tempid = com4.ExecuteScalar().ToString();


                Label2.Text = tempid;
               

                string checkstatus = "select Status from Registration where Username ='" + Session["New"].ToString() + "'";
                SqlCommand com1 = new SqlCommand(checkstatus, conn);
                SqlDataAdapter da = new SqlDataAdapter(com1);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if(ds.Tables.Count>0)
                { 
                    if(ds.Tables[0].Rows.Count>0)
                    {
                        LabelStatus.Text = ds.Tables[0].Rows[0][0].ToString();
                    }
                }
                


                conn.Close();

                
                //SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ConnectionString);
                //conn1.Open();


                //string confid = "select ConfrenceId from ConferenceRegistration where Username ='" + Session["New"].ToString() + "'";
                //SqlCommand com2 = new SqlCommand(confid, conn1);
                //SqlDataAdapter da1 = new SqlDataAdapter(com2);
                //DataSet ds1 = new DataSet();
                //da1.Fill(ds1);
                //if(ds1.Tables.Count>0)
                //{ 
                //    if(ds1.Tables[0].Rows.Count>0)
                //    {
                //        Label2.Text = ds1.Tables[0].Rows[0][0].ToString();
                //    }
                //}
                


                //conn1.Close();
            }

            else
            {
                Response.Redirect("Login.aspx");
                Response.Write("Please Login to view Page");
                
            }


        }

        protected void ButtonRegister_Click(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                Session["New1"] = Session["New"].ToString();
                if (LabelStatus.Text == "Student")
                {
                    Response.Redirect("StudentReg.aspx");
                }
                else
                {
                    Response.Redirect("NonStudentReg.aspx");
                }

            }
        }

        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("login.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;

        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            GridView2.Visible = true;
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            GridView3.Visible = true;

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ConnectionString);
            conn.Open();

            string checkConf = "select count(*) from Paper where Papername ='" + TextBox1.Text + "'";
            SqlCommand com = new SqlCommand(checkConf, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString().Replace(" ", ""));
            conn.Close();
            if (temp > 0)
            {
                Label51.Visible = true;
               
              
                Label51.Text = "Paper Name is  Already Exists in Database";
             

            }
            else
            {


                Panel1.Visible = false;
                Panel2.Visible = true;

                cartamount = 10;
                ListBox5.Items.Clear();
                Label49.Text = "10";
                TextBox38.Text = "10";
                ListBox5.Items.Add(new ListItem(" The Cost of Paper is  :10 "));




                string path = Server.MapPath("/");
                String pathname = path + "/Uploads/";
                System.IO.Directory.CreateDirectory(pathname);
                pathname = pathname + fuFile.FileName;
                fuFile.SaveAs(pathname);

                Label50.Text = fuFile.FileName;

                //byte[] file;

                //using (var stream = new FileStream(savePath, FileMode.Open, FileAccess.Read))
                //{
                //    using (var reader = new BinaryReader(stream))
                //    {
                //        file = reader.ReadBytes((int)stream.Length);
                //    }
                //}
                //using (var varConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ConnectionString))
                //{
                //    varConnection.Open();
                //    using (var sqlWrite = new SqlCommand("INSERT INTO Paper (Id,UName,PaperName,[FileName],Data,[status])Values(1,'Vaibhav','testPaper','"+fuFile.PostedFile.FileName+"',@File,'Pending')", varConnection))
                //    {
                //        sqlWrite.Parameters.Add("@File", SqlDbType.VarBinary, file.Length).Value = file;
                //        sqlWrite.ExecuteNonQuery();
                //    }
                //}
            }
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            //int amountcart = total1 + total + total3;
                        int showamount = 10;

            if (Convert.ToInt32(TextBox38.Text) > cartamount)
            {
                Label49.Text = cartamount.ToString();
                Label48.Visible = true;

            }
            else
            {

                tempamt = Convert.ToInt32(TextBox38.Text);
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ConnectionString);
                conn.Open();
                if (cartamount != 0)
                {



                    string checkpid = "select Id from Registration where Username ='" + Session["New"].ToString() + "'";
                    SqlCommand com44 = new SqlCommand(checkpid, conn);
                    string tempid = com44.ExecuteScalar().ToString();


                    string insertQueryamt = "insert into Payment(Id,NameCard,CardNum,CVV,Expiry,BillingAdd,PhoneNum,EmailId,Amount) values(@id ,@namec ,@cn ,@cvv ,@ex ,@bi ,@pn ,@Email ,@amt)";

                    SqlCommand com11 = new SqlCommand(insertQueryamt, conn);

                    com11.Parameters.AddWithValue("@id", tempid);
                    com11.Parameters.AddWithValue("@namec", TextBox31.Text);
                    com11.Parameters.AddWithValue("@cn", TextBox32.Text);
                    com11.Parameters.AddWithValue("@cvv", TextBox33.Text);
                    com11.Parameters.AddWithValue("@ex", TextBox34.Text);
                    com11.Parameters.AddWithValue("@bi", TextBox35.Text);
                    com11.Parameters.AddWithValue("@pn", TextBox36.Text);
                    com11.Parameters.AddWithValue("@Email", TextBox37.Text);
                    com11.Parameters.AddWithValue("@amt", TextBox38.Text);
                    com11.ExecuteNonQuery();

                    cartamount = cartamount - tempamt;


                    string fromAddress = "feedback.conferencesystem@gmail.com";
                    string mailPassword = "123456@123";       // Mail id password from where mail will be sent.
                    string messageBody = "<br />Your Payment is Sucessfull <br /> Name: " + TextBox31.Text + "<br /> <br />" + "Total amount : " + showamount.ToString() + "<br /><br /><br />" + "Paid Amount::" + tempamt.ToString() + "<br /><br /><br />" + "Due  Amount::" + cartamount.ToString();


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
                    send_mail.To.Add(new MailAddress(TextBox37.Text.ToString()));
                    //subject of the mail.
                    send_mail.Subject = "Conference Payment Information";

                    send_mail.Body = messageBody;
                    client.Send(send_mail);





                    TextBox38.Text = cartamount.ToString();
                    Label49.Text = cartamount.ToString();
                    if (cartamount == 0)
                    {
                        


            //string path = Server.MapPath("/");
            //String savePath = path + "/Uploads/";
            //System.IO.Directory.CreateDirectory(savePath);
            //savePath = savePath + fuFile.FileName;
            //fuFile.SaveAs(savePath);
                        String Pathname = Server.MapPath("/") +"/Uploads/";

                        Pathname = Pathname + Label50.Text;


            byte[] file;

            using (var stream = new FileStream(Pathname.ToString(), FileMode.Open, FileAccess.Read))
            {
                using (var reader = new BinaryReader(stream))
                {
                    file = reader.ReadBytes((int)stream.Length);
                }
            }
            using (var varConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ConnectionString))
            {
                varConnection.Open();
                using (var sqlWrite = new SqlCommand("INSERT INTO Paper (Id,UName,PaperName,[FileName],Data,[status])Values('" + tempid + "','" + LabelUser.Text.ToString()+ "','" + TextBox1.Text.ToString() + "','" + Label50.Text.ToString() + "',@File,'Pending')", varConnection))
                {
                    sqlWrite.Parameters.Add("@File", SqlDbType.VarBinary, file.Length).Value = file;
                    sqlWrite.ExecuteNonQuery();
                }
            }
                            Response.Redirect("userinfo.aspx");

                        }

                    }


                }
            }

        }

    }








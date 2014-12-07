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
using System.Net.Mail;

namespace WebApplication1
{
    public partial class StudentReg : System.Web.UI.Page
    {

        static int total1;
        static int total;
        static int total3 = 0;
        static string[] a = new string[20];
        static string[] b = new string[20];
        static string[] c = new string[20];
        static int m = 0;
        static int tempamt;
        static int cartamount;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New1"] != null)
            {
                Label29.Text = Session["New1"].ToString();
                Label30.Text = Session["New1"].ToString().ToUpper();

            }
            else
            {
                Response.Write("Please Login");
                Response.Redirect("Login.aspx");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string food;
                food = RadioButtonList1.SelectedValue;

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ConnectionString);
                conn.Open();
                for (int k = 0; k < a.Length; k++)
                {
                    if (!string.IsNullOrEmpty(a[k]))
                    {
                        string insertQuery = "insert into ConferenceRegistration(ConfrenceId,Name,Food) values(@cid ,@name ,@food)";
                        SqlCommand com1 = new SqlCommand(insertQuery, conn);

                        com1.Parameters.AddWithValue("@cid", a[k].ToString());
                        com1.Parameters.AddWithValue("@name", TextBox5.Text);
                        com1.Parameters.AddWithValue("@food", food.ToString());
                        com1.ExecuteNonQuery();



                        string checkpid = "select Id from Registration where Username ='" + Session["New1"].ToString() + "'";
                        SqlCommand com4 = new SqlCommand(checkpid, conn);
                        string tempid = com4.ExecuteScalar().ToString();

                        string cname = "select ConfrenceName from ConfrenceInfo where ConfrenceID ='" + a[k].ToString() + "'";
                        SqlCommand com5 = new SqlCommand(cname, conn);
                        string tempid1 = com5.ExecuteScalar().ToString();

                        string insert = "insert into LogUser(Id,Date,UpdateType,Name) values(@id ,@dt ,@ut ,@nm)";

                        SqlCommand com3 = new SqlCommand(insert, conn);

                        com3.Parameters.AddWithValue("@id", tempid);
                        com3.Parameters.AddWithValue("@dt", DateTime.Now);
                        com3.Parameters.AddWithValue("@ut", "Conference");
                        com3.Parameters.AddWithValue("@nm", tempid1);
                        com3.ExecuteNonQuery();

                    }
                }

                for (int k = 0; k < b.Length; k++)
                {
                    if (!string.IsNullOrEmpty(b[k]))
                    {
                        string insertQuery1 = "insert into TutorialRegistration(TutorialId,Name) values(@tid ,@tname)";
                        SqlCommand com2 = new SqlCommand(insertQuery1, conn);

                        com2.Parameters.AddWithValue("@tid", b[k].ToString());
                        com2.Parameters.AddWithValue("@tname", TextBox5.Text);

                        com2.ExecuteNonQuery();



                        string checkpid = "select Id from Registration where Username ='" + Session["New1"].ToString() + "'";
                        SqlCommand com4 = new SqlCommand(checkpid, conn);
                        string tempid = com4.ExecuteScalar().ToString();

                        string cname = "select TutorialName from TutorialInfo where TutorialId ='" + b[k].ToString() + "'";
                        SqlCommand com5 = new SqlCommand(cname, conn);
                        string tempid1 = com5.ExecuteScalar().ToString();

                        string insert = "insert into LogUser(Id,Date,UpdateType,Name) values(@id ,@dt ,@ut ,@nm)";

                        SqlCommand com3 = new SqlCommand(insert, conn);

                        com3.Parameters.AddWithValue("@id", tempid);
                        com3.Parameters.AddWithValue("@dt", DateTime.Now);
                        com3.Parameters.AddWithValue("@ut", "Tutorial");
                        com3.Parameters.AddWithValue("@nm", tempid1);
                        com3.ExecuteNonQuery();

                    }
                }



                for (int k = 0; k < c.Length; k++)
                {
                    if (!string.IsNullOrEmpty(c[k]))
                    {
                        string insertQuery2 = "insert into Paper(UName,Papername) values(@uname ,@pname)";
                        SqlCommand com3 = new SqlCommand(insertQuery2, conn);


                        com3.Parameters.AddWithValue("@pname", c[k].ToString());
                        com3.Parameters.AddWithValue("@uname", TextBox5.Text);
                        com3.ExecuteNonQuery();

                    }
                }






                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Item Already Added");
            }



            //Response.Redirect("Payment.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ListBox1.Visible = true;
            ListBox1.Items.Clear();
            total = 0;
            int j = 0;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {

                CheckBox ch1 = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                Label lb1 = (Label)GridView1.Rows[i].FindControl("Label1");
                Label lb2 = (Label)GridView1.Rows[i].FindControl("Label2");
                Label lb3 = (Label)GridView1.Rows[i].FindControl("Label3");
                Label lb4 = (Label)GridView1.Rows[i].FindControl("Label4");

                if (ch1.Checked == true)
                {
                    a[j++] = lb4.Text.ToString();
                    total += Convert.ToInt32(lb2.Text.ToString());

                }

            }

            for (int k = 0; k < a.Length; k++)
            {
                if (!string.IsNullOrEmpty(a[k]))
                    ListBox1.Items.Add(new ListItem(a[k].ToString()));
            }
            ListBox1.Items.Add(new ListItem(" Total cost is : " + total));
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            ListBox2.Visible = true;
            ListBox2.Items.Clear();
            total1 = 0;
            int j = 0;
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                CheckBox ch = (CheckBox)GridView2.Rows[i].FindControl("CheckBox3");
                Label lb5 = (Label)GridView2.Rows[i].FindControl("Label5");
                Label lb6 = (Label)GridView2.Rows[i].FindControl("Label6");
                Label lb7 = (Label)GridView2.Rows[i].FindControl("Label7");

                Label lb8 = (Label)GridView2.Rows[i].FindControl("Label8");

                if (ch.Checked == true)
                {
                    b[j++] = lb8.Text.ToString();
                    total1 += Convert.ToInt32(lb6.Text.ToString());

                }

            }
            for (int k = 0; k < b.Length; k++)
            {
                if (!string.IsNullOrEmpty(b[k]))
                    ListBox2.Items.Add(new ListItem(b[k].ToString()));
            }
            ListBox2.Items.Add(new ListItem(" Total cost is : " + total1));



        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            ListBox3.Visible = true;
            ListBox3.Items.Clear();
            ListBox3.Items.Add(new ListItem(" The cost of confrence is: " + total));
            ListBox3.Items.Add(new ListItem(" The Cost of Tutorial is  : " + total1));
            //ListBox3.Items.Add(new ListItem(" The Cost of Paper is  : " + total3));
            int amt1 = (total1 + total ) / 2;
            ListBox3.Items.Add(new ListItem(" Total cost is : " + (total1 + total)));
            ListBox3.Items.Add(new ListItem(" Student Discount is 50% off "));
            ListBox3.Items.Add(new ListItem(" Final cost is : " + amt1));

        }

        //protected void Button5_Click(object sender, EventArgs e)
        //{
        //    FileUpload1.Visible = true;
        //    Button6.Visible = true;
        //    ListBox4.Visible = true;
        //    Button7.Visible = true;
        //}

        //protected void Button6_Click(object sender, EventArgs e)
        //{


        //    if (Session["New1"] != null)
        //    {

        //        if (FileUpload1.PostedFile != null)
        //        {
        //            ListBox4.Items.Clear();
        //            total3 += 10;

        //            String filename = FileUpload1.PostedFile.FileName;
        //            c[m++] = filename;

        //            FileUpload1.PostedFile.SaveAs("D:\\" + filename);

        //            Response.Write("Uploaded");
        //            ListBox4.Items.Add(new ListItem(" Total cost is : " + total3));

        //        }
        //    }
        //}

        //protected void Button7_Click(object sender, EventArgs e)
        //{
        //    total3 = 0;
        //    ListBox4.Items.Clear();
        //    m = 0;
        //}

        protected void PayPalBtn_Click(object sender, ImageClickEventArgs e)
        {
            int temp = total1 + total + total3;

            if (string.IsNullOrEmpty(TextBox5.Text))
                TextBox5.Text = Session["New1"].ToString();
            if (temp == 0)
            {
                Label32.Visible = true;
                Label32.Text = " Please Add Items ";
            }
            else
            {
                string amount = "<input type='hidden' name='amount' value='" + temp + "'>";

                try
                {
                    string food;
                    string activity;
                    food = RadioButtonList1.SelectedValue;
                    activity = RadioButtonList2.SelectedValue;

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ConnectionString);
                    conn.Open();
                    for (int k = 0; k < a.Length; k++)
                    {
                        if (!string.IsNullOrEmpty(a[k]))
                        {
                            string insertQuery = "insert into ConferenceRegistration(ConfrenceId,Id,Name,Food,Activity) values(@cid ,@id1 ,@name ,@food ,@at)";
                            SqlCommand com1 = new SqlCommand(insertQuery, conn);


                            string checkpid = "select Id from Registration where Username ='" + Session["New1"].ToString() + "'";
                            SqlCommand com4 = new SqlCommand(checkpid, conn);
                            string tempid = com4.ExecuteScalar().ToString();

                            com1.Parameters.AddWithValue("@cid", a[k].ToString());
                            com1.Parameters.AddWithValue("@id1", tempid);
                            com1.Parameters.AddWithValue("@name", TextBox5.Text);
                            com1.Parameters.AddWithValue("@food", food.ToString());
                            com1.Parameters.AddWithValue("@at", activity.ToString());
                            com1.ExecuteNonQuery();




                            string cname = "select ConfrenceName from ConfrenceInfo where ConfrenceID ='" + a[k].ToString() + "'";
                            SqlCommand com5 = new SqlCommand(cname, conn);
                            string tempid1 = com5.ExecuteScalar().ToString();

                            string insert = "insert into LogUser(Id,Date,UpdateType,Name) values(@id ,@dt ,@ut ,@nm)";

                            SqlCommand com3 = new SqlCommand(insert, conn);

                            com3.Parameters.AddWithValue("@id", tempid);
                            com3.Parameters.AddWithValue("@dt", DateTime.Now);
                            com3.Parameters.AddWithValue("@ut", "Conference");
                            com3.Parameters.AddWithValue("@nm", tempid1);
                            com3.ExecuteNonQuery();

                        }
                    }

                    for (int k = 0; k < b.Length; k++)
                    {
                        if (!string.IsNullOrEmpty(b[k]))
                        {
                            string insertQuery1 = "insert into TutorialRegistration(TutorialId,Id,Name) values(@tid ,@id1 ,@tname)";
                            SqlCommand com2 = new SqlCommand(insertQuery1, conn);
                            string checkpid = "select Id from Registration where Username ='" + Session["New1"].ToString() + "'";
                            SqlCommand com4 = new SqlCommand(checkpid, conn);
                            string tempid = com4.ExecuteScalar().ToString();


                            com2.Parameters.AddWithValue("@tid", b[k].ToString());
                            com2.Parameters.AddWithValue("@id1", tempid);

                            com2.Parameters.AddWithValue("@tname", TextBox5.Text);

                            com2.ExecuteNonQuery();





                            string cname = "select TutorialName from TutorialInfo where TutorialId ='" + b[k].ToString() + "'";
                            SqlCommand com5 = new SqlCommand(cname, conn);
                            string tempid1 = com5.ExecuteScalar().ToString();

                            string insert = "insert into LogUser(Id,Date,UpdateType,Name) values(@id ,@dt ,@ut ,@nm)";

                            SqlCommand com3 = new SqlCommand(insert, conn);

                            com3.Parameters.AddWithValue("@id", tempid);
                            com3.Parameters.AddWithValue("@dt", DateTime.Now);
                            com3.Parameters.AddWithValue("@ut", "Tutorial");
                            com3.Parameters.AddWithValue("@nm", tempid1);
                            com3.ExecuteNonQuery();

                        }
                    }



                    //for (int k = 0; k < c.Length; k++)
                    //{
                    //    if (!string.IsNullOrEmpty(c[k]))
                    //    {
                    //        string insertQuery2 = "insert into Paper(Id,UName,Papername) values(@id ,@uname ,@pname)";
                    //        SqlCommand com3 = new SqlCommand(insertQuery2, conn);
                    //        string checkpid = "select Id from Registration where Username ='" + Session["New1"].ToString() + "'";
                    //        SqlCommand com4 = new SqlCommand(checkpid, conn);
                    //        string tempid = com4.ExecuteScalar().ToString();


                    //        com3.Parameters.AddWithValue("@pname", c[k].ToString());

                    //        com3.Parameters.AddWithValue("@id", tempid);
                    //        com3.Parameters.AddWithValue("@uname", TextBox5.Text);
                    //        com3.ExecuteNonQuery();

                    //    }
                    //}






                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("Item Already Added");
                }






                System.Web.HttpContext.Current.Response.Clear();

                System.Web.HttpContext.Current.Response.Write("<html><head>");

                System.Web.HttpContext.Current.Response.Write("</head><body onload='document.form1.submit()'>");

                System.Web.HttpContext.Current.Response.Write("<form action='https://www.paypal.com/cgi-bin/webscr' " + "name='form1' method='post'>");

                System.Web.HttpContext.Current.Response.Write("<input type='hidden' name='cmd' value='_xclick'>");

                System.Web.HttpContext.Current.Response.Write("<input type='hidden' name='business' " + "value='Conference@FIU.edu'>");

                System.Web.HttpContext.Current.Response.Write("<input type='hidden' name='lc' value='US'>");

                System.Web.HttpContext.Current.Response.Write("<input type='hidden' name='item_name' value='Widget'>");

                System.Web.HttpContext.Current.Response.Write(amount);

                System.Web.HttpContext.Current.Response.Write("<input type='hidden' name='currency_code' value='USD'>");
                System.Web.HttpContext.Current.Response.Write("<input type='hidden' name='return' value='http://localhost:1353/userinfo.aspx'>");
                //System.Web.HttpContext.Current.Response.Write("<input type='hidden' name='bn' " + "value='PP-BuyNowBF:btn_buynow_LG.gif:NonHostedGuest'>");

                System.Web.HttpContext.Current.Response.Write("<input type='image' " + "src='http://www.tylergarns.com/wp-content/uploads/2012/05/PleaseWait.gif' " + "border='0' name='submit' alt=''>");

                //System.Web.HttpContext.Current.Response.Write("<img alt='' border='0' " + "src='https://www.paypal.com/en_US/i/scr/pixel.gif' " +  "width='1' height='1'>");

                System.Web.HttpContext.Current.Response.Write("</form>");

                System.Web.HttpContext.Current.Response.Write("</body></html>");

                System.Web.HttpContext.Current.Response.End();
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
            Button1.Visible = false;
            int amt = total1 + total ;
            int amt1 = amt / 2; 
            TextBox38.Text = amt1.ToString();
            Label49.Text = amt1.ToString();
            cartamount = amt1;
            ListBox5.Items.Clear();
            ListBox5.Items.Add(new ListItem(" The cost of confrence is: " + total));
            ListBox5.Items.Add(new ListItem(" The Cost of Tutorial is  : " + total1));
            //ListBox5.Items.Add(new ListItem(" The Cost of Paper is  : " + total3));

            ListBox5.Items.Add(new ListItem(" Total cost is : " + (total1 + total )));
            ListBox5.Items.Add(new ListItem(" Student Discount is 50% off "));
            ListBox5.Items.Add(new ListItem(" Final cost is : " + amt1 ));


        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            //int amountcart = total1 + total + total3;
            int showamount = (total1 + total )/2;
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



                    string checkpid = "select Id from Registration where Username ='" + Session["New1"].ToString() + "'";
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


                        int temp = total1 + total ;

                        if (string.IsNullOrEmpty(TextBox5.Text))
                            TextBox5.Text = Session["New1"].ToString();
                        if (temp == 0)
                        {
                            Label32.Visible = true;
                            Label32.Text = " Please Add Items ";
                        }
                        else
                        {
                            string amount = "<input type='hidden' name='amount' value='" + temp + "'>";

                            try
                            {
                                string food;
                                string activity;
                                food = RadioButtonList1.SelectedValue;
                                activity = RadioButtonList2.SelectedValue;


                                for (int k = 0; k < a.Length; k++)
                                {
                                    if (!string.IsNullOrEmpty(a[k]))
                                    {
                                        string insertQuery = "insert into ConferenceRegistration(ConfrenceId,Id,Name,Food,Activity) values(@cid ,@id1 ,@name ,@food ,@at)";
                                        SqlCommand com1 = new SqlCommand(insertQuery, conn);



                                        com1.Parameters.AddWithValue("@cid", a[k].ToString());
                                        com1.Parameters.AddWithValue("@id1", tempid);
                                        com1.Parameters.AddWithValue("@name", TextBox5.Text);
                                        com1.Parameters.AddWithValue("@food", food.ToString());
                                        com1.Parameters.AddWithValue("@at", activity.ToString());
                                        com1.ExecuteNonQuery();




                                        string cname = "select ConfrenceName from ConfrenceInfo where ConfrenceID ='" + a[k].ToString() + "'";
                                        SqlCommand com5 = new SqlCommand(cname, conn);
                                        string tempid1 = com5.ExecuteScalar().ToString();

                                        string insert = "insert into LogUser(Id,Date,UpdateType,Name) values(@id ,@dt ,@ut ,@nm)";

                                        SqlCommand com3 = new SqlCommand(insert, conn);

                                        com3.Parameters.AddWithValue("@id", tempid);
                                        com3.Parameters.AddWithValue("@dt", DateTime.Now);
                                        com3.Parameters.AddWithValue("@ut", "Conference");
                                        com3.Parameters.AddWithValue("@nm", tempid1);
                                        com3.ExecuteNonQuery();

                                    }
                                }

                                for (int k = 0; k < b.Length; k++)
                                {
                                    if (!string.IsNullOrEmpty(b[k]))
                                    {
                                        string insertQuery1 = "insert into TutorialRegistration(TutorialId,Id,Name) values(@tid ,@id1 ,@tname)";
                                        SqlCommand com2 = new SqlCommand(insertQuery1, conn);


                                        com2.Parameters.AddWithValue("@tid", b[k].ToString());
                                        com2.Parameters.AddWithValue("@id1", tempid);

                                        com2.Parameters.AddWithValue("@tname", TextBox5.Text);

                                        com2.ExecuteNonQuery();





                                        string cname = "select TutorialName from TutorialInfo where TutorialId ='" + b[k].ToString() + "'";
                                        SqlCommand com5 = new SqlCommand(cname, conn);
                                        string tempid1 = com5.ExecuteScalar().ToString();

                                        string insert = "insert into LogUser(Id,Date,UpdateType,Name) values(@id ,@dt ,@ut ,@nm)";

                                        SqlCommand com3 = new SqlCommand(insert, conn);

                                        com3.Parameters.AddWithValue("@id", tempid);
                                        com3.Parameters.AddWithValue("@dt", DateTime.Now);
                                        com3.Parameters.AddWithValue("@ut", "Tutorial");
                                        com3.Parameters.AddWithValue("@nm", tempid1);
                                        com3.ExecuteNonQuery();

                                    }
                                }



                                //for (int k = 0; k < c.Length; k++)
                                //{
                                //    if (!string.IsNullOrEmpty(c[k]))
                                //    {
                                //        string insertQuery2 = "insert into Paper(Id,UName,Papername) values(@id ,@uname ,@pname)";
                                //        SqlCommand com3 = new SqlCommand(insertQuery2, conn);


                                //        com3.Parameters.AddWithValue("@pname", c[k].ToString());

                                //        com3.Parameters.AddWithValue("@id", tempid);
                                //        com3.Parameters.AddWithValue("@uname", TextBox5.Text);
                                //        com3.ExecuteNonQuery();

                                //    }
                                //}






                                conn.Close();
                            }
                            catch (Exception ex)
                            {
                                Response.Write("Item Already Added");
                            }




                            Session["New"] = Session["New1"].ToString();
                            Response.Redirect("userinfo.aspx");

                        }

                    }


                }
            }

        }
    }
}


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

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["New"] = null;
            Session["New1"] = null;
            Session["New2"] = null;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          
             SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ConnectionString);
        conn.Open();

        string checkuser = "select count(*) from Registration where Username ='" + TextBoxUsername.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        conn.Close();
        if (temp > 0)
        {conn.Open();
        string checkpassword = "select Password from Registration where Username ='" + TextBoxUsername.Text + "'";
            SqlCommand com1 = new SqlCommand(checkpassword, conn);
            string temp1 = com1.ExecuteScalar().ToString();
            if (temp1 == TextBoxPassword.Text)
            {
                string checkpstatus = "select Status from Registration where Username ='" + TextBoxUsername.Text + "'";
                SqlCommand com2 = new SqlCommand(checkpstatus, conn);
                string temp2 = com2.ExecuteScalar().ToString();
                if(temp2=="Admin")
                {
                    string checkpid = "select Id from Registration where Username ='" + TextBoxUsername.Text + "'";
                    SqlCommand com4 = new SqlCommand(checkpid, conn);
                    string tempid = com4.ExecuteScalar().ToString();

                    string insertQuery = "insert into LogLogin(Id,LogDate,LogTime) values(@id ,@dt ,@tm)";

                    SqlCommand com3 = new SqlCommand(insertQuery, conn);

                    com3.Parameters.AddWithValue("@id", tempid);
                    com3.Parameters.AddWithValue("@dt", DateTime.Now.Date);
                    com3.Parameters.AddWithValue("@tm", DateTime.Now.TimeOfDay);
                    com3.ExecuteNonQuery();




                    conn.Close();
                    Session["New2"] = TextBoxUsername.Text;
                    Response.Redirect("Admin.aspx");
                  
                }
                else
                {
                    
                }


                string checkpid1 = "select Id from Registration where Username ='" + TextBoxUsername.Text + "'";
                SqlCommand com5 = new SqlCommand(checkpid1, conn);
                string tempid1 = com5.ExecuteScalar().ToString();

                string insertQuery1 = "insert into LogLogin(Id,LogDate,LogTime) values(@id ,@dt ,@tm)";

                SqlCommand com6 = new SqlCommand(insertQuery1, conn);

                com6.Parameters.AddWithValue("@id", tempid1);
                com6.Parameters.AddWithValue("@dt", DateTime.Now.Date);
                com6.Parameters.AddWithValue("@tm", DateTime.Now.TimeOfDay);
                com6.ExecuteNonQuery();

                conn.Close();

                Session["New"] = TextBoxUsername.Text;
                Response.Redirect("userinfo.aspx");
                
            }
       
            else
            {conn.Close();
            Label3.Visible = true;
            Label3.Text = "User/Password Invalid";
            }


        }

        Label3.Visible = true;
    }
        }

       
    }


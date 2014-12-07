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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["New"] = null;
            if (Session["New3"] != null)
            {
              DropDownList1.SelectedItem.Text =  Session["New3"].ToString();
              DropDownList1.Visible = false;
              Label6.Visible = false;
              Session["New"] = null;
              Session["New1"] = null;
              Session["New3"] = null;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
         try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ConnectionString);
            conn.Open();

            string checkuser = "select count(*) from Registration where Username ='" + TextBoxUsername.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString().Replace(" ", ""));
            if (temp > 0)
            {
                Response.Write("User Already Exists");
                conn.Close();

            }
            else
            {
                string insertQuery = "insert into Registration(Username,Name,EmailId,Password,Phone,Status,Institution) values(@un ,@name ,@Emailid ,@Pass ,@phone ,@status ,@Insti)";

                SqlCommand com1 = new SqlCommand(insertQuery, conn);

                com1.Parameters.AddWithValue("@un", TextBoxUsername.Text);
                com1.Parameters.AddWithValue("@name", TextBoxName.Text);
                com1.Parameters.AddWithValue("@Emailid", TextBoxEmail.Text);
                com1.Parameters.AddWithValue("@Pass", TextBoxPassword.Text);
                com1.Parameters.AddWithValue("@phone", TextBoxPhone.Text);
                com1.Parameters.AddWithValue("@status", DropDownList1.SelectedItem.Text);
                com1.Parameters.AddWithValue("@Insti", TextBoxInstituion.Text);
                com1.ExecuteNonQuery();
                Session["New1"] = null;
                Response.Redirect("~/Login.aspx");
                Response.Write("User Is Created");


                conn.Close();
            }
        }
        catch(Exception ex)
        {

            Response.Write("Error " + ex.ToString());
        }

    }
           
        

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string s=DropDownList1.SelectedItem.Text;
            if (s == "Student")
            {
                Label7.Visible = true;
                Label7.Text = "Institution";
           
            }
            if (s == "Professional")
            {
                Label7.Visible = true;
                Label7.Text = "Company";
               
            }
        }
    }
}

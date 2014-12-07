using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Text;

namespace WebApplication1
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New2"] != null)
            {
                LabelUser.Text = Session["New2"].ToString().ToUpper();
                Session["New1"] = null;
                Label21.Visible = false;
                Label22.Visible = false;

            }

            else
            {
                Response.Redirect("Login.aspx");
                Response.Write("Please Login to view Page");

            }
            if (!IsPostBack)
            {
                BindPaper();  
            }


        }
        private void BindPaper()
        {
            SqlConnection con;
            SqlCommand cmd;
            using (con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ConnectionString))
            {
                using (cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from dbo.Paper";
                    cmd.CommandType = CommandType.Text;
                    con.Open();
                    cmd.Connection = con;
                    //com.Parameters.AddWithValue("id", grvPaper.SelectedRow.Cells[1].Text);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        grvPaper.DataSource = ds.Tables[0];
                        grvPaper.DataBind();
                    }
                    // lblError.Text = "";
                }
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                //string dt;
                //dt = datepicker.Value.ToString();
                //dt += " ";
                //dt += txt_timepicker.Value.ToString();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ConnectionString);
                conn.Open();

                string checkConf = "select count(*) from ConfrenceInfo where ConfrenceName ='" + TextBox1.Text + "'";
                SqlCommand com = new SqlCommand(checkConf, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString().Replace(" ", ""));
                if (temp > 0)
                {
                    Label21.Visible = true;
                    TextBox1.Text = "";
                    TextBox3.Text = "";
                    Label21.Text = "Conference Name is  Already Exists";
                    conn.Close();

                }
                else
                {
                    string insertQuery = "insert into ConfrenceInfo(ConfrenceName,Cost,Date) values(@cn ,@ct ,@dt )";

                    SqlCommand com1 = new SqlCommand(insertQuery, conn);

                    com1.Parameters.AddWithValue("@cn", TextBox1.Text);
                    com1.Parameters.AddWithValue("@ct", TextBox3.Text);
                    com1.Parameters.AddWithValue("@dt", TextBoxDate.Text);
                    com1.ExecuteNonQuery();


                    string checkpid = "select Id from Registration where Username ='" + Session["New2"].ToString() + "'";
                    SqlCommand com4 = new SqlCommand(checkpid, conn);
                    string tempid = com4.ExecuteScalar().ToString();

                    string insert = "insert into LogAdmin(Id,Date,UpdateType,Name) values(@id ,@dt ,@ut ,@nm)";

                    SqlCommand com3 = new SqlCommand(insert, conn);

                    com3.Parameters.AddWithValue("@id", tempid);
                    com3.Parameters.AddWithValue("@dt", DateTime.Now);
                    com3.Parameters.AddWithValue("@ut", "Conference");
                    com3.Parameters.AddWithValue("@nm", TextBox1.Text);
                    com3.ExecuteNonQuery();

                    Response.Redirect("~/Admin.aspx");
                    Response.Write("Data Is Created");


                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Label21.Visible = true;

                Label21.Text = "Enter proper data";
            }


        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                //string dt;
                //dt = datepicker.Value.ToString();
                //dt += " ";
                //dt += txt_timepicker.Value.ToString();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ConnectionString);
                conn.Open();

                string checktut = "select count(*) from TutorialInfo where TutorialName ='" + TextBox4.Text + "'";
                SqlCommand com = new SqlCommand(checktut, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString().Replace(" ", ""));
                if (temp > 0)
                {
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                    Label22.Visible = true;
                    Label22.Text = "Tutorial Name is  Already Exists";
                    conn.Close();

                }
                else
                {
                    string insertQuery5 = "insert into TutorialInfo(TutorialName,Cost,Date) values(@cn ,@ct ,@dt )";

                    SqlCommand com1 = new SqlCommand(insertQuery5, conn);

                    com1.Parameters.AddWithValue("@cn", TextBox4.Text);
                    com1.Parameters.AddWithValue("@ct", TextBox5.Text);
                    com1.Parameters.AddWithValue("@dt", TextBoxdate2.Text);
                    com1.ExecuteNonQuery();


                    string checkpid = "select Id from Registration where Username ='" + Session["New2"].ToString() + "'";
                    SqlCommand com4 = new SqlCommand(checkpid, conn);
                    string tempid = com4.ExecuteScalar().ToString();

                    string insert = "insert into LogAdmin(Id,Date,UpdateType,Name) values(@id ,@dt ,@ut ,@nm)";

                    SqlCommand com3 = new SqlCommand(insert, conn);

                    com3.Parameters.AddWithValue("@id", tempid);
                    com3.Parameters.AddWithValue("@dt", DateTime.Now);
                    com3.Parameters.AddWithValue("@ut", "Tutorial");
                    com3.Parameters.AddWithValue("@nm", TextBox4.Text);
                    com3.ExecuteNonQuery();

                    Response.Redirect("~/Admin.aspx");
                    Response.Write("Data Is Created");
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Label22.Visible = true;

                Label22.Text = "Enter proper data";
            }



            //SqlDataSource7.Insert();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }



        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        protected void Button5_Click1(object sender, EventArgs e)
        {
            Session["New1"] = null;
            Session["New"] = null;
            Session["New2"] = null;
            Session["New3"] = "Admin";
            Response.Redirect("Register.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Session["New"] = null;
            Session["New1"] = null;
            Session["New2"] = null;
            Response.Redirect("login.aspx");
        }
        protected void GridView4_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true; //handling the exception

                Label21.Text = "Data can not be Deleted";
            }
        }
        protected void grvPaper_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadPaper")
            {
                SqlConnection con;
                using (con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ConnectionString))
                {
                    con.Open();
                    SqlCommand com = new SqlCommand("select * from Paper where PaperID=" + e.CommandArgument.ToString(), con);
                    SqlDataReader dr = com.ExecuteReader();
                    if (dr.Read())
                    {
                        Response.Clear();
                        Response.Buffer = true;
                        //Response.ContentType = dr["type"].ToString();

                        Response.AddHeader("content-disposition", "attachment;filename=\"" + dr["FileName"].ToString() + "\"");     // to open file prompt Box open or Save file         
                        Response.Charset = "";
                        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                        Response.BinaryWrite((byte[])dr["Data"]);
                        Response.End();

                    }
                }

            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            StringBuilder PaperIDs = new StringBuilder("");
            foreach (GridViewRow gr in grvPaper.Rows)
            {
                if (((CheckBox)(gr.FindControl("cbSelectPaper"))).Checked)
                {
                    PaperIDs.Append(grvPaper.DataKeys[gr.RowIndex].Value.ToString());
                    PaperIDs.Append(",");
                }
            }
            char[] charsToTrim = { ',' };
            string PaperID = PaperIDs.ToString().Trim(charsToTrim);
            SqlConnection con;
            SqlCommand com;

            using (con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ConnectionString))
            {
                con.Open();
                string query;
                query = "Update Paper set status='Accepted' where PaperID in (select splitdata from fnSplitString(@PaperID,','))";   //insert query
                com = new SqlCommand(query, con);
                com.Parameters.Add("@PaperID", SqlDbType.VarChar).Value = PaperID;
                com.ExecuteNonQuery();
                BindPaper();
                //objPaperBL.Accepted(PaperID);
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            StringBuilder PaperIDs = new StringBuilder("");
            foreach (GridViewRow gr in grvPaper.Rows)
            {
                if (((CheckBox)(gr.FindControl("cbSelectPaper"))).Checked)
                {
                    PaperIDs.Append(grvPaper.DataKeys[gr.RowIndex].Value.ToString());
                    PaperIDs.Append(",");
                }
            }
            char[] charsToTrim = { ',' };
            string PaperID = PaperIDs.ToString().Trim(charsToTrim);
            SqlConnection con;
            SqlCommand com;
            using (con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ConnectionString))
            {
                con.Open();
                string query;
                query = "Update Paper set status='Rejected' where PaperID in (select splitdata from fnSplitString(@PaperID,','))";   //insert query
                com = new SqlCommand(query, con);
                com.Parameters.Add("@PaperID", SqlDbType.VarChar).Value = PaperID;
                com.ExecuteNonQuery();
            }
            BindPaper();
        }

    }
}

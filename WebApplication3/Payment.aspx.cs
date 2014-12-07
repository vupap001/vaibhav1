using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


namespace WebApplication1
{
    public partial class Payment : System.Web.UI.Page
    {

        public string query, constr;
        public SqlCommand com;
        public SqlConnection con;

        public void connection()
        {

            constr = ConfigurationManager.ConnectionStrings["ConferenceManagementConnectionString"].ToString();
            con = new SqlConnection(constr);
            con.Open();

        }
        protected void Page_Load(object sender, EventArgs e)
        {

            Label2.Visible = false;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Label2.Visible = true;
            string filePath = FileUpload1.PostedFile.FileName;
            string filename1 = Path.GetFileName(filePath);
            string ext = Path.GetExtension(filename1);
            string type = String.Empty;

            if (!FileUpload1.HasFile)
            {
                Label2.Text = "Please Select File";
            }
            else
                if (FileUpload1.HasFile)
                {

                    try
                    {
                        // Added by vithal wadje for Csharp-Corner contribution

                        switch (ext)
                        {
                            case ".pdf":

                                type = "application/pdf";

                                break;

                        }

                        if (type != String.Empty)
                        {
                            connection();
                            Stream fs = FileUpload1.PostedFile.InputStream;
                            BinaryReader br = new BinaryReader(fs);
                            Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                            query = "insert into Paper(Id,UName,Papername,data,Status)values(@id ,@un ,@pn ,@dt,@st)";
                            com = new SqlCommand(query, con);


                            com.Parameters.AddWithValue("@id", "1");
                            com.Parameters.AddWithValue("@un", "vaibhav");
                            com.Parameters.AddWithValue("@pn", "Tutorial");
                            com.Parameters.AddWithValue("@st", "Pending");
                            com.Parameters.Add("@dt", SqlDbType.Binary).Value = bytes;
                            com.ExecuteNonQuery();
                            Label2.ForeColor = System.Drawing.Color.Green;
                            Label2.Text = "PDF File Uploaded successfully";

                        }
                        else
                        {
                            Label2.ForeColor = System.Drawing.Color.Red;

                            Label2.Text = "Select Only PDF Files";


                        }
                    }
                    catch (Exception ex)
                    {
                        Label2.Text = "Error: " + ex.Message.ToString();


                    }

                }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            connection();
            query = "Select *from PDFfiles";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();


        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            connection();
            SqlCommand com = new SqlCommand("select Name,type,data from PDFfiles where id=@id", con);
            com.Parameters.AddWithValue("id", GridView1.SelectedRow.Cells[1].Text);
            SqlDataReader dr = com.ExecuteReader();

            if (dr.Read())
            {
                Response.Clear();
                Response.Buffer = true;

                Response.ContentType = dr["type"].ToString();
                Response.AddHeader("content-disposition", "attachment;filename=" + dr["Name"].ToString());
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite((byte[])dr["data"]);
                Response.End();
            }


        }
    }
}

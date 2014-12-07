using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Threading;
using System.Net;
using System.Text;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using System.Data.SqlClient;
using System.Xml;



namespace WebApplication1
{
    public partial class Statistics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=gvtocsv.csv");
            Response.Charset = "";
            Response.ContentType = "application/text";
            StringBuilder sBuilder = new System.Text.StringBuilder();
            for (int index = 0; index < GridView1.Columns.Count; index++)
            {
                sBuilder.Append(GridView1.Columns[index].HeaderText + ',');
            }
            sBuilder.Append("\r\n");
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                for (int k = 0; k < GridView1.HeaderRow.Cells.Count; k++)
                {
                    sBuilder.Append(GridView1.Rows[i].Cells[k].Text.Replace(",", "") + ",");
                }
                sBuilder.Append("\r\n");
            }
            Response.Output.Write(sBuilder.ToString());
            Response.Flush();
            Response.End();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=gvtocsv.csv");
            Response.Charset = "";
            Response.ContentType = "application/text";
            StringBuilder sBuilder = new System.Text.StringBuilder();
            for (int index = 0; index < GridView2.Columns.Count; index++)
            {
                sBuilder.Append(GridView2.Columns[index].HeaderText + ',');
            }
            sBuilder.Append("\r\n");
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                for (int k = 0; k < GridView2.HeaderRow.Cells.Count; k++)
                {
                    sBuilder.Append(GridView2.Rows[i].Cells[k].Text.Replace(",", "") + ",");
                }
                sBuilder.Append("\r\n");
            }
            Response.Output.Write(sBuilder.ToString());
            Response.Flush();
            Response.End();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=gvtocsv.csv");
            Response.Charset = "";
            Response.ContentType = "application/text";
            StringBuilder sBuilder = new System.Text.StringBuilder();
            for (int index = 0; index < GridView3.Columns.Count; index++)
            {
                sBuilder.Append(GridView3.Columns[index].HeaderText + ',');
            }
            sBuilder.Append("\r\n");
            for (int i = 0; i < GridView3.Rows.Count; i++)
            {
                for (int k = 0; k < GridView3.HeaderRow.Cells.Count; k++)
                {
                    sBuilder.Append(GridView3.Rows[i].Cells[k].Text.Replace(",", "") + ",");
                }
                sBuilder.Append("\r\n");
            }
            Response.Output.Write(sBuilder.ToString());
            Response.Flush();
            Response.End();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
        }
        
       
    }
}
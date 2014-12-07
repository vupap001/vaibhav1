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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebApplication1
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New2"] != null)
            {
                lable.Visible = true;
                fluImage.Visible = true;
                Button2.Visible = true;
                btn_Upload.Visible = true;
            }
            LoadImage();
        }

        private void LoadImage()
        {
            try
            {
                string imagePath = "~/Upload/BannerImage/";
                string imageSource = SiteBaseUrl + "Upload/BannerImage/";
                string PhotoFilePath = Server.MapPath(imagePath);
                string divSlider = @"<ul class='slides'>";
                string fileSlide = string.Empty;
                string fileName = string.Empty;

                DirectoryInfo di = new DirectoryInfo(PhotoFilePath);
                FileInfo[] rgFiles = di.GetFiles("*.*");
                foreach (FileInfo fi in rgFiles)
                {
                    fileSlide = @"<li><img src='";

                    fileSlide += imageSource + fi + "' /></li>";

                    divSlider += fileSlide;
                }

                divImageSlider.InnerHtml = divSlider + "</ul>";

            }
            catch (Exception ex)
            {
                //ShowErrorMsg("error", ex.Message);
            }
        }

        public static string SiteBaseUrl
        {
            get
            {
                //return ConfigurationManager.AppSettings["RootPath"].ToString(); 
                string orginalUrl = HttpContext.Current.Request.Url.AbsoluteUri;
                if (HttpContext.Current.Request.Url.Query.Length > 0)
                    orginalUrl = orginalUrl.Replace(HttpContext.Current.Request.Url.Query, string.Empty);

                return orginalUrl.Replace(HttpContext.Current.Request.Url.AbsolutePath, string.Empty) + ((HttpContext.Current.Request.ApplicationPath == "/" ? "" : HttpContext.Current.Request.ApplicationPath)) + '/';
            }

        }

        protected void btnUpload(object sender, EventArgs e)
        {
            if (CheckValidImage(fluImage))
            {
                fluImage.PostedFile.SaveAs(MapPath("~") + "/Upload/BannerImage/" + fluImage.FileName);
                ShowErrorMsg("success", "Image Uploaded Successfully");
            }
        }

        private bool CheckValidImage(FileUpload FileUploadImage)
        {
            string contentType;

            contentType = FileUploadImage.PostedFile.ContentType.ToLower();

            if (contentType == "image/jpg" || contentType == "image/png" || contentType == "image/jpeg" || contentType == "image/pjpeg")
            {

            }
            else
            {
                ShowErrorMsg("error", "Image format is not valid. Valid image formats are ( jpg, png, jpeg).");

                return false;
            }

            return true;
        }
        private void ShowErrorMsg(string _class, string _msg)
        {
            divMessage.Style.Value = "display:block;";
            divMessage.Attributes.Add("class", _class);
            divMessage.InnerHtml = _msg;
        }

        protected void Button2_Click(object sender, System.EventArgs e)
        {

        }
    }
}

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" MasterPageFile="~/site.Master"  %>

<asp:Content ContentPlaceHolderID="contentplaceholder1" runat="server">
    <title>Flex-Slider With Custom Upload Option</title>
    <link href="css/flexslider.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.8.2-min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery.flexslider.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            InitializeImageSlider();
        });
        function InitializeImageSlider() {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: true,
                directionNav: true,
                itemWidth: "100%",
                itemHeight: 400
            });
        }
    </script>
    <style type="text/css">
        .error, .notice, .success
        {
            padding: .8em;
            margin-bottom: 1em;
            border: 2px solid #ddd;
        }
        .error
        {
            background: #FBE3E4;
            color: #8a1f11;
            border-color: #FBC2C4;
        }
        .notice
        {
            background: #FFF6BF;
            color: #514721;
            border-color: #FFD324;
        }
        .success
        {
            background: #E6EFC2;
            color: #264409;
            border-color: #C6D880;
        }
        .error a
        {
            color: #8a1f11;
        }
        .notice a
        {
            color: #514721;
        }
        .success a
        {
            color: #264409;
        }
    </style>
<div class="banner1 grid_24 clearfix banner-1-chrome">
        <div id="divImageSlider" class="flexslider" runat="server">
        </div>
    </div>
    <div id="divMessage" runat="server" style="display: none;">
    </div>
    <div align="center">
        <asp:Label ID="lable" Text="Upload Image (.jpeg/.jpg/.png)" runat="server" Visible="False"></asp:Label>
        <asp:FileUpload ID="fluImage" runat="server" Visible="False" />
        &nbsp;
        <asp:Button ID="btn_Upload" runat="server" Text="Upload" OnClick="btnUpload" Visible="False" />
        &nbsp;
        
        <asp:Button ID="Button2" runat="server" Text="Refresh Page" OnClick="Button2_Click" Visible="False" />
    </div>
    
</asp:Content>
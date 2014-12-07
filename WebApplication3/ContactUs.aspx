<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="WebApplication1.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">
    <table style="width: 100%">
    <tr>
        <td style="width: 88px">&nbsp;&nbsp;
            <br />
            &nbsp;FEEDBACK</td>
        <td style="width: 151px">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="height: 19px; width: 88px">Name:</td>
        <td style="height: 19px; width: 151px">
            <asp:TextBox ID="TextBox1" runat="server" Width="218px"></asp:TextBox>
        </td>
        <td style="height: 19px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="height: 36px; width: 88px">Email:<br />
        </td>
        <td style="height: 36px; width: 151px">
            <asp:TextBox ID="TextBox2" runat="server" Width="220px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter Valid  Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </td>
        <td style="height: 36px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required"></asp:RequiredFieldValidator>
            <br />
        </td>
    </tr>
    <tr>
        <td style="width: 88px">Coments:</td>
        <td style="width: 151px">
            <asp:TextBox ID="TextBox3" runat="server" Height="61px" TextMode="MultiLine" Width="222px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Required"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 88px">&nbsp;</td>
        <td style="width: 151px">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 88px">&nbsp;</td>
        <td style="width: 151px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 88px">&nbsp;</td>
        <td style="width: 151px">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#009933" Text="Label" Visible="False"></asp:Label>
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
<br />
<br />
<br />
<br />
<br />
<strong>CONTACT US:<br />
<br />
CONFERENCE MANAGEMENT SYSTEM<br />
SCIS FIU Miami Florida<br />
United States - 33174
<br />
Phone: 3216540987<br />
Email: <a href="mailto:conference@conferencemanagement.com">conference@conferencemanagement.com</a><br />
<br />
<br />
<br />
<br />
Developed by:<br />
Vaibhav Rupapara<br />
Ankit Chauhan<br />
Pankaj Mankotia<br />
Amitabh Srivastav</strong>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordReset.aspx.cs" Inherits="WebApplication1.PasswordReset" MasterPageFile="~/site.Master" %>

<asp:Content ContentPlaceHolderID="contentplaceholder1" runat="server">
    <div>
        &nbsp;<asp:Label ID="Label2" runat="server" Text="User name"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Width="102px"></asp:TextBox>

        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>

    </div>
    <p style="margin-left: 280px">
        <asp:Button ID="Button1" runat="server" Text="Send Password" OnClick="Button1_Click" />
    </p>
</asp:Content>

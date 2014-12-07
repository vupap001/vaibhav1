<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" MasterPageFile="~/site.Master" %>

<asp:Content ContentPlaceHolderID="contentplaceholder1" runat="server">
    <div>
        <table cellspacing="15px">
            <tr>
                
                <td align="right" style="height: 41px">

                    <asp:Label ID="Label1" runat="server" Text="User Name" ForeColor="#910603"></asp:Label>&nbsp&nbsp&nbsp&nbsp&nbsp:</td>
                <td style="height: 41px">
                    <asp:TextBox ID="TextBoxUsername" runat="server" OnTextChanged="TextBox1_TextChanged"
                        Style="margin-top: 0px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" style="height: 55px">
                    <asp:Label ID="Label2" runat="server" Text="Password" ForeColor="#910603"></asp:Label>&nbsp&nbsp&nbsp&nbsp&nbsp:</td>
                <td style="height: 55px">
                    <asp:TextBox ID="TextBoxPassword" Text="Password" TextMode="password" runat="server" OnTextChanged="TextBox2_TextChanged"
                        ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server"  CssClass="submit_button_contact" Width="100px" Text="Login" OnClick="Button1_Click" />
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink1" href="PasswordReset.aspx" runat="server">Forget Password</asp:HyperLink>
                    <br />
                    <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="User Does not exist" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>


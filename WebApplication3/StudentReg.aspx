<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentReg.aspx.cs" Inherits="WebApplication1.StudentReg" MasterPageFile="~/site.Master" %>


<asp:Content ContentPlaceHolderID="contentplaceholder1" runat="server">
     <script runat=server>
        protected String GetData()
        {


            return Label32.Text;
        }
  </script>

    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            width: 490px;
        }
        .auto-style2 {
            height: 24px;
        }
        .auto-style3 {
            width: 175px;
        }
        .auto-style4 {
            width: 70px;
        }
        .auto-style5 {
            width: 185px;
        }
        .auto-style7 {
            height: 17px;
            width: 185px;
        }
        .auto-style8 {
            height: 25px;
            width: 185px;
        }
        .auto-style9 {
            width: 185px;
            height: 20px;
        }
        .auto-style10 {
            height: 20px;
        }
        .auto-style11 {
            height: 25px;
        }
        .auto-style12 {
            width: 185px;
            height: 19px;
        }
        .auto-style13 {
            height: 19px;
        }
    </style>
    <div>

        <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="X-Large"
            Text="Student-Registeration"></asp:Label>

    </div>
    <p>
        &nbsp;
        <asp:Label ID="Label30" runat="server" Text="Label" Font-Bold="True"></asp:Label>
    </p>

     <asp:Panel ID="Panel1" runat="server">
    
     <p>
                    <asp:Label ID="Label32" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
    </p>
     <table class="style1">
         <tr>
             <td class="auto-style4">
                 <asp:Label ID="Label34" runat="server" Text="Name"></asp:Label>
             </td>
             <td>
                 <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
             </td>
         </tr>
     </table>
    <p>
        <table class="style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label26" runat="server" Text="Confrence"></asp:Label>
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="ConfrenceID" SortExpression="ConfrenceID">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ConfrenceID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ConfrenceID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ConfrenceName" SortExpression="ConfrenceName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ConfrenceName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ConfrenceName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cost" SortExpression="Cost">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Cost") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Cost") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date" SortExpression="Date">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" SelectCommand="SELECT * FROM [ConfrenceInfo]"></asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        &nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Add" />
&nbsp;<table class="style1">
            <tr>
                <td>
                    <asp:ListBox ID="ListBox1" runat="server" Height="53px" Visible="False" Width="192px"></asp:ListBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:Label ID="Label27" runat="server" Text="Tutorial"></asp:Label>
    </p>
    <table class="style1">
        <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="TutorialId" SortExpression="TutorialId">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("TutorialId") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("TutorialId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TutorialName" SortExpression="TutorialName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TutorialName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("TutorialName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cost" SortExpression="Cost">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Cost") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Cost") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date" SortExpression="Date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox3" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" SelectCommand="SELECT * FROM [TutorialInfo]"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Add" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td>
                <asp:ListBox ID="ListBox2" runat="server" Height="55px" Visible="False" Width="217px"></asp:ListBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <asp:Label ID="Label29" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />

    <td>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />

        <table class="style1">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label31" runat="server" Text="Food Preference"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label33" runat="server" Text="Activity"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        <asp:ListItem Selected="True">Vegetarian</asp:ListItem>
                        <asp:ListItem>NonVegetarian</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                </td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                        <asp:ListItem Selected="True">Banquet</asp:ListItem>
                        <asp:ListItem>Symposium</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                </td>
            </tr>
    </table>

        <br />
       
        <br />



    </td>
    <p>
        &nbsp;<asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Estimate" />
&nbsp;<table class="style1">
            <tr>
                <td>
                    <asp:ListBox ID="ListBox3" runat="server" Visible="False" Height="106px" Width="177px"></asp:ListBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;<td>&nbsp;</td>
            </tr>
        </table>
    </p>
          </asp:Panel>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Pay Now" OnClick="Button1_Click1" />
    </p>






    <asp:Panel ID="Panel2" runat="server" Visible="False">
         
        <table style="width: 100%; height: 518px;">
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label45" runat="server" Text="Payment Detail"></asp:Label>
                </td>
                <td>
                    <asp:ListBox ID="ListBox5" runat="server" Width="263px"></asp:ListBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">
                    <asp:Label ID="Label35" runat="server" Text="Payment"></asp:Label>
                </td>
                <td class="auto-style13"></td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label46" runat="server" ForeColor="#009933" Text="For Multiple Payment"></asp:Label>
                    <br />
                    <asp:Label ID="Label47" runat="server" Text="Enter Amount"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox38" runat="server"></asp:TextBox>
                    Max
                    <asp:Label ID="Label49" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Label ID="Label48" runat="server" ForeColor="Red" Text="Enter valid amount" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="font-weight: 700" class="auto-style5">
                    <asp:Label ID="Label36" runat="server" Text="Name on the card&nbsp;&nbsp;"></asp:Label>
                </td>
                <td style="font-weight: 700">
                    <asp:TextBox ID="TextBox31" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox31" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8" style="font-weight: 700">
                    <asp:Label ID="Label39" runat="server" Text="Card Number"></asp:Label>
                </td>
                <td class="auto-style11" style="font-weight: 700">
                    <asp:TextBox ID="TextBox32" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox32" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9" style="font-weight: 700"></td>
                <td class="auto-style10" style="font-weight: 700">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox32" ErrorMessage="Enter Valid Card Number" ValidationExpression="^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9" style="font-weight: 700">
                    <asp:Label ID="Label38" runat="server" Text="CVV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"></asp:Label>
                </td>
                <td class="auto-style10" style="font-weight: 700">
                    <asp:TextBox ID="TextBox33" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox33" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9" style="font-weight: 700">&nbsp;</td>
                <td class="auto-style10" style="font-weight: 700">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox33" ErrorMessage="Enter valid 3 digit CVC number" ValidationExpression="[0-9][0-9][0-9]"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9" style="font-weight: 700">
                    <asp:Label ID="Label40" runat="server" Text="Expiration Date&nbsp;&nbsp;&nbsp; (mm/yy)"></asp:Label>
                </td>
                <td class="auto-style10" style="font-weight: 700">
                    <asp:TextBox ID="TextBox34" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox34" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9" style="font-weight: 700">&nbsp;</td>
                <td class="auto-style10" style="font-weight: 700">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox34" ErrorMessage="Please enter in format (mm/yy)" ValidationExpression="(0[1-9]|1[0-2])\/[0-9]{2}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9" style="font-weight: 700">
                    <asp:Label ID="Label42" runat="server" Text="Billing details "></asp:Label>
                </td>
                <td class="auto-style10" style="font-weight: 700">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5" style="font-weight: 700">
                    <asp:Label ID="Label41" runat="server" Text="Billing Address"></asp:Label>
                </td>
                <td style="font-weight: 700">
                    <asp:TextBox ID="TextBox35" runat="server" Height="64px" Width="192px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox35" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label43" runat="server" Font-Bold="True" Text="Phone Number&nbsp;"></asp:Label>
                </td>
                <td style="height: 17px">
                    <asp:TextBox ID="TextBox36" runat="server" Width="193px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox36" ErrorMessage="Required" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="font-weight: 700;" class="auto-style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td style="height: 25px; font-weight: 700;">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox36" ErrorMessage="Enter Valid phone number" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label44" runat="server" Font-Bold="True" Text="E-mail&nbsp;&nbsp;"></asp:Label>
                </td>
                <td style="height: 17px">
                    <asp:TextBox ID="TextBox37" runat="server" Width="188px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox37" ErrorMessage="Required" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="font-weight: 700;" class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                <td style="height: 17px; font-weight: 700;">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox37" ErrorMessage="Enter Valid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="font-weight: 700" class="auto-style5">
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                <td style="font-weight: 700">
                    <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Make Payment" Width="114px" />
                </td>
            </tr>
        </table>
    
    </asp:Panel>
</asp:Content>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userinfo.aspx.cs" Inherits="WebApplication1.userinfo" MasterPageFile="~/site.Master" %>
<asp:Content ContentPlaceHolderID="contentplaceholder1" runat="server">
    <div>
        <asp:Label ID="LabelUser" runat="server" Font-Bold="True" 
            Font-Names="Comic Sans MS" Text="User :  " BorderColor="Black"></asp:Label>
   </div>
    <p>
        <asp:Label ID="LabelStatus" runat="server" Text="PROFESSIONAL" Font-Bold="True" BorderColor="Black" BorderStyle="Dotted"></asp:Label>
    </p>
    <asp:Panel ID="Panel1" runat="server" Height="29px" Font-Bold="True">
    
    <table style="width: 100%">
        <tr>
            <td style="width: 157px">
                <asp:Label ID="Label1" runat="server" Text="Confrence Information: "></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Show" />
                <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 157px">
                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" EnableModelValidation="True" Visible="False" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ConfrenceName" HeaderText="ConfrenceName" SortExpression="ConfrenceName" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" SelectCommand="SELECT ConfrenceInfo.ConfrenceName, ConferenceRegistration.Name ,ConfrenceInfo.Cost, ConfrenceInfo.Date FROM ConfrenceInfo join ConferenceRegistration on ConfrenceInfo.confrenceid=ConferenceRegistration.confrenceid WHERE (ConferenceRegistration.Id = @Name)">
                    <SelectParameters>
            <asp:ControlParameter ControlID="Label2" Name="Name" PropertyName="Text" Type="String" />
        </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 157px">
                <asp:Label ID="Label3" runat="server" Text="Tutorial Information: "></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Show" />
            </td>
        </tr>
        <tr>
            <td style="width: 157px">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EnableModelValidation="True" Visible="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="TutorialName" HeaderText="TutorialName" SortExpression="TutorialName" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" SelectCommand="SELECT TutorialInfo.TutorialName,TutorialRegistration.Name, TutorialInfo.Cost, TutorialInfo.Date FROM TutorialInfo  JOIN TutorialRegistration on TutorialRegistration.TutorialId=TutorialInfo.TutorialId where  (TutorialRegistration.Id = @TName)">
                    <SelectParameters>
            <asp:ControlParameter ControlID="Label2" Name="TName" PropertyName="Text" Type="String" />
        </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 157px">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Paper Information"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Show" />
            </td>
        </tr>
        <tr>
            <td style="width: 157px">
                <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Visible="False">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Papername" HeaderText="Papername" SortExpression="Papername" />
                        <asp:BoundField DataField="FileName" HeaderText="FileName" SortExpression="FileName" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 157px">
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" SelectCommand="SELECT Papername, FileName, Status FROM Paper WHERE (Id = @Id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label2" Name="Id" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 157px">
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text=" &nbsp;&nbsp;&nbsp;Sumbit Paper"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Pay and Upaload"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 157px; height: 41px;">
                <asp:FileUpload ID="fuFile" runat="server" />
                <asp:Label ID="Label50" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="fuFile" ErrorMessage="Please select file" ValidationGroup="ppr"></asp:RequiredFieldValidator>
            </td>
            <td style="height: 41px">
                <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Upload" ValidationGroup="ppr" />
            </td>
        </tr>
    </table>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label9" runat="server" Text="Paper Name"></asp:Label>
        <table style="width: 100%">
            <tr>
                <td style="width: 1px">&nbsp;</td>
                <td style="width: 175px">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required" ValidationGroup="ppr"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 1px">&nbsp;</td>
                <td style="width: 175px">
                    <asp:Label ID="Label51" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
&nbsp;<br /> <div style="margin-left: 0px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<table style="width: 100%">
                <tr>
                    <td style="width: 145px">
                        <asp:Button ID="ButtonRegister" runat="server" OnClick="ButtonRegister_Click" Text="Register" />
                    </td>
                    <td>
                        <asp:Button ID="ButtonLogout" runat="server" OnClick="ButtonLogout_Click" Text="Logout" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 145px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>

         </asp:Panel>

   



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
                                <td class="auto-style5" style="font-weight: 700">
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
                                <td class="auto-style8" style="font-weight: 700;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                                <td class="auto-style7" style="font-weight: 700;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                <td style="height: 17px; font-weight: 700;">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox37" ErrorMessage="Enter Valid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5" style="font-weight: 700">
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                <td style="font-weight: 700">
                                    <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="Make Payment" Width="114px" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>







</asp:Content>

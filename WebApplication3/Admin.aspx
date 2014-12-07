<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebApplication1.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">
    <script runat="server">

        protected void GridView4_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                Label21.Visible = true;
                Label21.Text = "Data can not be Deleted";
                e.ExceptionHandled = true;
            }
        }
        protected void GridView7_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                Label22.Visible = true;
                Label22.Text = "Data can not be Deleted";
                e.ExceptionHandled = true;
            }
        }
    </script>

    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="Styles/calendar-blue.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=TextBoxDate.ClientID %>").dynDateTime({
                showsTime: true,
                ifFormat: "%Y/%m/%d %H:%M",
                daFormat: "%l;%M %p, %e %m, %Y",
                align: "BR",
                electric: false,
                singleClick: false,
                displayArea: ".siblings('.dtcDisplayArea')",
                button: ".next()"
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=TextBoxdate2.ClientID %>").dynDateTime({
                showsTime: true,
                ifFormat: "%Y/%m/%d %H:%M",
                daFormat: "%l;%M %p, %e %m, %Y",
                align: "BR",
                electric: false,
                singleClick: false,
                displayArea: ".siblings('.dtcDisplayArea')",
                button: ".next()"
            });
        });
    </script>
    &nbsp;
    &nbsp;<asp:Label ID="LabelUser" runat="server" Text="Label"></asp:Label>
    <table style="width: 100%">
        <tr>
            <td>
                <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Log Out" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label21" runat="server" Text="Enter Date Correclty" Visible="False" ForeColor="Red"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table style="width: 100%">
        <tr>
            <td style="width: 94px">
                <asp:Label ID="Label11" runat="server" Text="Conference Name"></asp:Label>
            </td>
            <td style="width: 199px">
                <asp:TextBox ID="TextBox1" runat="server" Width="76px"></asp:TextBox>
            </td>
            <td style="width: 123px">
                <asp:Label ID="Label12" runat="server" Text="Cost"></asp:Label>
            </td>
            <td style="width: 75px">
                <asp:TextBox ID="TextBox3" runat="server" Width="57px"></asp:TextBox>
            </td>
            <td style="width: 333px">
                <asp:Label ID="Label15" runat="server" Text="Date Time"></asp:Label>
            </td>
            <td style="width: 333px">



                <asp:TextBox ID="TextBoxDate" runat="server" ReadOnly="true" Width="108px"></asp:TextBox>
                <img src="calender.png" />
            </td>
            <td style="width: 228px">




                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Add" ValidationGroup="cnf" />



            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 94px">&nbsp;</td>
            <td style="width: 199px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required" ValidationGroup="cnf"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 123px">&nbsp;</td>
            <td style="width: 75px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Required" ValidationGroup="cnf"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 333px">&nbsp;</td>
            <td style="width: 333px">&nbsp;</td>
            <td style="width: 228px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table style="width: 100%">
        <tr>
            <td>

                <asp:GridView ID="GridView4" runat="server" OnRowDeleted="GridView4_RowDeleted" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ConfrenceID" DataSourceID="SqlDataSource3" EnableModelValidation="True" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="ConfrenceID" HeaderText="ConfrenceID" InsertVisible="False" ReadOnly="True" SortExpression="ConfrenceID" />
                        <asp:BoundField DataField="ConfrenceName" HeaderText="ConfrenceName" SortExpression="ConfrenceName" />
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
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" DeleteCommand="DELETE FROM [ConfrenceInfo] WHERE [ConfrenceID] = @original_ConfrenceID AND (([ConfrenceName] = @original_ConfrenceName) OR ([ConfrenceName] IS NULL AND @original_ConfrenceName IS NULL)) AND (([Cost] = @original_Cost) OR ([Cost] IS NULL AND @original_Cost IS NULL)) AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL))" InsertCommand="INSERT INTO [ConfrenceInfo] ([ConfrenceName], [Cost], [Date]) VALUES (@ConfrenceName, @Cost, @Date)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ConfrenceInfo]" UpdateCommand="UPDATE [ConfrenceInfo] SET [ConfrenceName] = @ConfrenceName, [Cost] = @Cost, [Date] = @Date WHERE [ConfrenceID] = @original_ConfrenceID AND (([ConfrenceName] = @original_ConfrenceName) OR ([ConfrenceName] IS NULL AND @original_ConfrenceName IS NULL)) AND (([Cost] = @original_Cost) OR ([Cost] IS NULL AND @original_Cost IS NULL)) AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL))" OnSelecting="SqlDataSource3_Selecting">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ConfrenceID" Type="Int32" />
                        <asp:Parameter Name="original_ConfrenceName" Type="String" />
                        <asp:Parameter Name="original_Cost" Type="String" />
                        <asp:Parameter Name="original_Date" Type="DateTime" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ConfrenceName" Type="String" />
                        <asp:Parameter Name="Cost" Type="String" />
                        <asp:Parameter Name="Date" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ConfrenceName" Type="String" />
                        <asp:Parameter Name="Cost" Type="String" />
                        <asp:Parameter Name="Date" Type="DateTime" />
                        <asp:Parameter Name="original_ConfrenceID" Type="Int32" />
                        <asp:Parameter Name="original_ConfrenceName" Type="String" />
                        <asp:Parameter Name="original_Cost" Type="String" />
                        <asp:Parameter Name="original_Date" Type="DateTime" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <asp:Label ID="Label22" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
    <br />
    <table style="width: 100%">
        <tr>
            <td style="height: 34px">
                <asp:Label ID="Label17" runat="server" Text="Tutorial Name"></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server" Width="71px"></asp:TextBox>
                <asp:Label ID="Label18" runat="server" Text="Cost"></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server" Width="19px"></asp:TextBox>
                <asp:Label ID="Label19" runat="server" Text="Date"></asp:Label>




                <asp:TextBox ID="TextBoxdate2" runat="server" ReadOnly="true" Width="108px"></asp:TextBox>
                <img src="calender.png" />

                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Add" ValidationGroup="tt" />

            </td>
            <td style="height: 34px"></td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4" ErrorMessage="Required" ValidationGroup="tt"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" ErrorMessage="Required" ValidationGroup="tt"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView7" runat="server" OnRowDeleted="GridView7_RowDeleted" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TutorialId" DataSourceID="SqlDataSource7" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="TutorialId" HeaderText="TutorialId" InsertVisible="False" ReadOnly="True" SortExpression="TutorialId" />
                        <asp:BoundField DataField="TutorialName" HeaderText="TutorialName" SortExpression="TutorialName" />
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
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" DeleteCommand="DELETE FROM [TutorialInfo] WHERE [TutorialId] = @original_TutorialId AND (([TutorialName] = @original_TutorialName) OR ([TutorialName] IS NULL AND @original_TutorialName IS NULL)) AND (([Cost] = @original_Cost) OR ([Cost] IS NULL AND @original_Cost IS NULL)) AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL))" InsertCommand="INSERT INTO [TutorialInfo] ([TutorialName], [Cost], [Date]) VALUES (@TutorialName, @Cost, @Date)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TutorialInfo]" UpdateCommand="UPDATE [TutorialInfo] SET [TutorialName] = @TutorialName, [Cost] = @Cost, [Date] = @Date WHERE [TutorialId] = @original_TutorialId AND (([TutorialName] = @original_TutorialName) OR ([TutorialName] IS NULL AND @original_TutorialName IS NULL)) AND (([Cost] = @original_Cost) OR ([Cost] IS NULL AND @original_Cost IS NULL)) AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_TutorialId" Type="Int32" />
                        <asp:Parameter Name="original_TutorialName" Type="String" />
                        <asp:Parameter Name="original_Cost" Type="String" />
                        <asp:Parameter Name="original_Date" Type="DateTime" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="TextBox4" Name="TutorialName" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="TextBox5" Name="Cost" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="Label22" Name="Date" PropertyName="Text" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="TutorialName" Type="String" />
                        <asp:Parameter Name="Cost" Type="String" />
                        <asp:Parameter Name="Date" Type="DateTime" />
                        <asp:Parameter Name="original_TutorialId" Type="Int32" />
                        <asp:Parameter Name="original_TutorialName" Type="String" />
                        <asp:Parameter Name="original_Cost" Type="String" />
                        <asp:Parameter Name="original_Date" Type="DateTime" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <table style="width: 100%">
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Select Conference"></asp:Label>
                <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ConfrenceName" DataValueField="ConfrenceID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" SelectCommand="SELECT * FROM [ConfrenceInfo]"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EnableModelValidation="True" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="ConfrenceName" HeaderText="ConfrenceName" SortExpression="ConfrenceName" />
                        <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                        <asp:BoundField DataField="Food" HeaderText="Food" SortExpression="Food" />
                        <asp:BoundField DataField="Activity" HeaderText="Activity" SortExpression="Activity" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                <asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" SelectCommand="SELECT ConferenceRegistration.Name, ConfrenceInfo.ConfrenceName, ConfrenceInfo.Cost, ConferenceRegistration.Food ,ConferenceRegistration.Activity, ConfrenceInfo.Date from ConfrenceInfo join ConferenceRegistration on ConfrenceInfo.confrenceid=ConferenceRegistration.confrenceid  WHERE (ConferenceRegistration.confrenceid = @Name)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList5" Name="Name" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 59px"></td>
            <td style="height: 59px"></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label14" runat="server" Text="Select User Type"></asp:Label>
                <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True">
                    <asp:ListItem>Student</asp:ListItem>
                    <asp:ListItem>Professional</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" DataKeyNames="Id">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="EmailId" HeaderText="EmailId" SortExpression="EmailId" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:BoundField DataField="Institution" HeaderText="Institution" SortExpression="Institution" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" DeleteCommand="DELETE FROM [Registration] WHERE [Id] = @original_Id" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [Name], [EmailId], [Phone], [Status], [Institution] FROM [Registration] WHERE ([Status] = @Status)" UpdateCommand="UPDATE [Registration] SET [Name] = @Name, [EmailId] = @EmailId, [Phone] = @Phone, [Status] = @Status, [Institution] = @Institution WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [Registration] ([Name], [EmailId], [Phone], [Status], [Institution]) VALUES (@Name, @EmailId, @Phone, @Status, @Institution)">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="EmailId" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:Parameter Name="Institution" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList6" Name="Status" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="EmailId" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:Parameter Name="Institution" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table style="width: 100%">
        <tr>
            <td>
                <asp:Label ID="Label16" runat="server" Text="Select Tutorial"></asp:Label>
                <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource5" DataTextField="TutorialName" DataValueField="TutorialId" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" SelectCommand="SELECT * FROM [TutorialInfo]"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <table style="width: 100%">
        <tr>
            <td style="width: 65px; height: 10px;">&nbsp;</td>
            <td style="height: 18px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 65px">
                <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource6" EnableModelValidation="True" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="TutorialName" HeaderText="TutorialName" SortExpression="TutorialName" />
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
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" SelectCommand="SELECT TutorialRegistration.Name,TutorialInfo.TutorialName, TutorialInfo.Cost, TutorialInfo.Date FROM TutorialInfo  JOIN TutorialRegistration ON TutorialInfo.TutorialId = TutorialRegistration.TutorialId where (TutorialRegistration.TutorialId = @Name)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList7" Name="Name" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:GridView ID="grvPaper" AutoGenerateColumns="False" OnRowCommand="grvPaper_RowCommand"
                    runat="server"
                    DataKeyNames="Paperid" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="PaperID" HeaderText="PaperID" />
                        <asp:BoundField DataField="PaperName" HeaderText="Paper Name" />

                        <asp:BoundField DataField="UName" HeaderText="User" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="Edit" CommandArgument='<%# Bind("PaperID") %>' CommandName="DownloadPaper"
                                    runat="server">Download</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbSelectPaper" runat="server" />
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
                <asp:Button ID="Button1" runat="server" Text="Accept" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Reject" OnClick="Button2_Click" />

            </td>
        </tr>
    </table>
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;<table style="width: 100%">
        <tr>
            <td>
                <asp:Label ID="Label20" runat="server" Text="Add Admin User"></asp:Label>
                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click1" Text="Add" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
    <br />
    <br />
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Statistics.aspx">Click Here</asp:HyperLink>
    &nbsp;to view and download Statistics ans Logs<br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;&nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="WebApplication1.Statistics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">
   
    
    
     <table style="width: 100%">
         <tr>
             <td>
                 <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Number of User have registered for Conference"></asp:Label>
             </td>
             <td>&nbsp;</td>
         </tr>
         <tr>
             <td>
                 <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource4" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
                     <Columns>
                         <asp:BoundField DataField="Users" HeaderText="Users" ReadOnly="True" SortExpression="Users" />
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
                 <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" SelectCommand="SELECT COUNT(*) AS Users, ConfrenceInfo.ConfrenceName, ConfrenceInfo.Cost, ConfrenceInfo.Date FROM ConferenceRegistration INNER JOIN ConfrenceInfo ON ConferenceRegistration.ConfrenceId = ConfrenceInfo.ConfrenceID GROUP BY ConferenceRegistration.ConfrenceId, ConfrenceInfo.ConfrenceName, ConfrenceInfo.Cost, ConfrenceInfo.Date"></asp:SqlDataSource>
             </td>
             <td>&nbsp;</td>
         </tr>
         <tr>
             <td>
                 <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Number of User have registered for Tutorial"></asp:Label>
             </td>
             <td>&nbsp;</td>
         </tr>
         <tr>
             <td>
                 <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource5" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
                     <Columns>
                         <asp:BoundField DataField="Users" HeaderText="Users" ReadOnly="True" SortExpression="Users" />
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
                 <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" SelectCommand="SELECT COUNT(*) AS Users, TutorialInfo.TutorialName, TutorialInfo.Cost, TutorialInfo.Date FROM TutorialInfo INNER JOIN TutorialRegistration ON TutorialInfo.TutorialId = TutorialRegistration.TutorialId GROUP BY TutorialRegistration.TutorialId, TutorialInfo.TutorialName, TutorialInfo.Cost, TutorialInfo.Date"></asp:SqlDataSource>
             </td>
             <td>&nbsp;</td>
         </tr>
         <tr>
             <td>
                 <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Paper Stusts Information"></asp:Label>
             </td>
             <td>&nbsp;</td>
         </tr>
         <tr>
             <td>
                 <asp:GridView ID="GridView6" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource6" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
                     <Columns>
                         <asp:BoundField DataField="FileName" HeaderText="FileName" SortExpression="FileName" />
                         <asp:BoundField DataField="Papername" HeaderText="Papername" SortExpression="Papername" />
                         <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                         <asp:BoundField DataField="UName" HeaderText="UName" SortExpression="UName" />
                     </Columns>
                     <EditRowStyle BackColor="#2461BF" />
                     <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                     <RowStyle BackColor="#EFF3FB" />
                     <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" SelectCommand="SELECT [FileName], [Papername], [Status], [UName] FROM [Paper] ORDER BY [Status]"></asp:SqlDataSource>
             </td>
             <td>&nbsp;</td>
         </tr>
         <tr>
             <td>
                 <asp:GridView ID="GridView7" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource7" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
                     <Columns>
                         <asp:BoundField DataField="Number" HeaderText="Number" ReadOnly="True" SortExpression="Number" />
                         <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                     </Columns>
                     <EditRowStyle BackColor="#2461BF" />
                     <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                     <RowStyle BackColor="#EFF3FB" />
                     <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" SelectCommand="SELECT COUNT(*) AS Number, Status FROM Paper GROUP BY Status"></asp:SqlDataSource>
             </td>
             <td>&nbsp;</td>
         </tr>
     </table>
   
    
    
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" SelectCommand="SELECT LogAdmin.LogId, Registration.Username, LogAdmin.Date, LogAdmin.UpdateType, LogAdmin.Name FROM LogAdmin  JOIN Registration on LogAdmin.Id=Registration.Id "></asp:SqlDataSource>
    
    
    
    
    <table style="width: 100%">
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Admin Log Information</td>
        </tr>
        <tr>
            <td>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LogId" DataSourceID="SqlDataSource1" EnableModelValidation="True" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="LogId" HeaderText="LogId" InsertVisible="False" ReadOnly="True" SortExpression="LogId" />
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="UpdateType" HeaderText="UpdateType" SortExpression="UpdateType" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="To CSV" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User Log Information&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="LogId" DataSourceID="SqlDataSource2" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="LogId" HeaderText="LogId" InsertVisible="False" ReadOnly="True" SortExpression="LogId" />
                        <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                        <asp:BoundField DataField="UpdateType" HeaderText="UpdateType" SortExpression="UpdateType" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" SelectCommand="SELECT LogUser.LogId, Registration.Username, LogUser.Date, LogUser.UpdateType, LogUser.Name FROM LogUser INNER JOIN Registration ON Registration.Id = LogUser.Id"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="To CSV" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Login Logs Information&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="LogId" DataSourceID="SqlDataSource3" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="LogId" HeaderText="LogId" InsertVisible="False" ReadOnly="True" SortExpression="LogId" />
                        <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                        <asp:BoundField DataField="LogDate" HeaderText="LogDate" SortExpression="LogDate" />
                        <asp:BoundField DataField="LogTime" HeaderText="LogTime" SortExpression="LogTime" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConferenceManagementConnectionString %>" SelectCommand="SELECT LogLogin.LogId, Registration.Username, LogLogin.LogDate, LogLogin.LogTime FROM LogLogin INNER JOIN Registration ON Registration.Id = LogLogin.Id"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="To CSV" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

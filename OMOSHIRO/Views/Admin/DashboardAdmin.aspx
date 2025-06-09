<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="DashboardAdmin.aspx.cs" Inherits="OMOSHIRO.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Omoshiro - Admin Dashboard
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="w-full flex flex-col px-[7rem]">

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 mb-10 overflow-clip">
            <div class="p-4 bg-slate-800 rounded-xl shadow">
                <h3 class="text-purple-200 mb-2">Games Sold(week)</h3>
                <p class="text-2xl font-bold text-black dark:text-white">
                    <asp:Label ID="WeeklySold" runat="server" Text="Label"></asp:Label>
                </p>
            </div>

            <div class="p-4 bg-slate-800 rounded-xl shadow">
                <h3 class="text-purple-200 mb-2">Games Sold(all time)</h3>
                <p class="text-2xl font-bold text-black dark:text-white">
                    <asp:Label ID="TotalSold" runat="server" Text="Label"></asp:Label>
                </p>
            </div>

            <div class="p-4 bg-slate-800 rounded-xl shadow">
                <h3 class="text-purple-200 mb-2">Total Product</h3>
                <p class="text-2xl font-bold text-black dark:text-white">
                    <asp:Label ID="TotalCount" runat="server" Text="Label"></asp:Label>
                </p>
            </div>
        </div>

        <div class="mb-10">
            <h2 class="text-xl font-semibold mb-4">Recent Orders</h2>
            <asp:GridView ID="InvoiceGridView" CssClass="w-full rounded-[5px]" runat="server" DataSourceID="RecentSales1" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <RowStyle BackColor="#0f172a" ForeColor="White" Height="20px" />
                <HeaderStyle BackColor="#1e293b" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="RecentSales1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Invoices]"></asp:SqlDataSource>
    
    </div>
</asp:Content>

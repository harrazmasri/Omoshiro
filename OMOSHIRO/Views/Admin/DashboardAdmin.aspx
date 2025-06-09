<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="DashboardAdmin.aspx.cs" Inherits="OMOSHIRO.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <main class="flex-1 p-6">
    <!-- Header -->
    <header class="flex items-center justify-between mb-8">
      <h1 class="text-2xl font-bold">Dashboard</h1>
      <div class="flex items-center space-x-4">
        <input type="text " placeholder="Search..." class="px-3 py-1.5 rounded-md border border-zinc-300 dark:border-zinc-700 bg-white dark:bg-zinc-800 focus:outline-none focus:ring focus:ring-blue-500 text-black dark:text-white" />
        <asp:Button ID="LogoutButton" runat="server" Text="Log Out"
            CssClass="p-2 bg-blue-600 text-white rounded-md hover:bg-blue-700"
            OnClick="LogoutButton_Click" />
      </div>
    </header>

    <!-- Stats Cards -->
 <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 mb-10">
   <div class="p-4 bg-white dark:bg-zinc-800 rounded-xl shadow">
     <h3 class="text-sm text-zinc-500 mb-2">Games Sold(month)</h3>
     <p class="text-2xl font-bold text-black dark:text-white">563</p>
   </div>

   <div class="p-4 bg-white dark:bg-zinc-800 rounded-xl shadow">
     <h3 class="text-sm text-zinc-500 mb-2">Games Sold(all time)</h3>
     <p class="text-2xl font-bold text-black dark:text-white">2,347</p>
   </div>

   <div class="p-4 bg-white dark:bg-zinc-800 rounded-xl shadow">
     <h3 class="text-sm text-zinc-500 mb-2">Total Product</h3>
     <p class="text-2xl font-bold text-black dark:text-white">1,026</p>
   </div>
 </div>

<!-- Charts Section -->
<div class="grid grid-cols-1 md:grid-cols-1 gap-6 mb-10">


  

</div>

  
 <!-- Recent Orders -->

    
             <asp:GridView ID="InvoiceGridView" CssClass="w-full rounded-[5px]" runat="server" DataSourceID="RecentSales1" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                 <AlternatingRowStyle BackColor="White" />
                 <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
        <RowStyle BackColor="#EFF3FB" Height="20px" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
</div>
         <asp:SqlDataSource ID="RecentSales1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Invoices]"></asp:SqlDataSource>


    

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminLogIn.aspx.cs" Inherits="OMOSHIRO.AdminLogIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="text-2xl font-600 mb-5">Admin Log In</h3>

    <div class="mb-1 rounded bg-slate-800 py-2 px-4">
        <p class="inputLabel">Username</p>
        <asp:TextBox ID="UserName" runat="server" CssClass="w-full rounded text-[1rem] outline-none border-none bg-slate-800 ring-0"></asp:TextBox>
    </div>
    <div class="mb-1 rounded bg-slate-800 py-2 px-4">
        <p class="inputLabel">Password</p>
        <asp:TextBox ID="Password" runat="server" CssClass="w-full rounded text-[1rem] outline-none border-none bg-slate-800 ring-0"></asp:TextBox>
    </div>
    <asp:Button ID="RegisterButton" runat="server" Text="Login" CssClass="w-full mt-4 hover:cursor-pointer label rounded outline-none border-none ring-0 bg-slate-700 hover:bg-purple-700 transition py-2 px-4" />

    <div class="w-full h-[2px] bg-slate-700 rounded my-5"></div>
</asp:Content>

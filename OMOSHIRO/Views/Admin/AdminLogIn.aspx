<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin.Master" AutoEventWireup="true" CodeBehind="AdminLogIn.aspx.cs" Inherits="OMOSHIRO.AdminLogIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="text-2xl font-600 mb-5">Admin Log In</h3>
    <p class="text-red-500 text-sm mt-2 mb-3"><asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></p>

    <div class="mb-1 rounded bg-slate-800 py-2 px-4">
        <p class="inputLabel">Username</p>

        <asp:TextBox ID="UserName" runat="server" CssClass="w-full rounded text-[1rem] outline-none border-none bg-slate-800 ring-0"></asp:TextBox>
    </div>

    <div class="mb-1 rounded bg-slate-800 py-2 px-4">
        <p class="inputLabel text-white">Password</p>
        <asp:TextBox ID="Password" runat="server" 
            TextMode="Password" 
            CssClass="w-full rounded text-[1rem] outline-none border-none bg-slate-800 ring-0 text-white" />
    </div>
    <asp:Button ID="LoginButton" OnClick="LoginButton_Click" runat="server" Text="Login" CssClass="w-full mt-4 hover:cursor-pointer label rounded outline-none border-none ring-0 bg-slate-700 hover:bg-purple-700 transition py-2 px-4" />

    <div class="w-full h-[2px] bg-slate-700 rounded my-5"></div>

     <div class="w-full flex flex-col items-center justify-center">
         <asp:HyperLink ID="HyperLink1" CssClass="inputLabel" NavigateUrl="~/Views/Authentication/Login.aspx" runat="server">Back to customer portal, click here</asp:HyperLink>
     </div>
</asp:Content>

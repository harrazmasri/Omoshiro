<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Auth.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OMOSHIRO.Views.Authentication.Login" %>
<asp:Content ContentPlaceHolderID="title" runat="server">
    Omoshiro - Login
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="AuthPlaceholder" runat="server">
    <h3 class="text-2xl font-600 mb-5">Welcome Back!</h3>
    <p class="text-red-500 text-sm mt-2 mb-3"><asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></p>

    <div class="mb-1 rounded bg-slate-800 py-2 px-4">
        <p class="inputLabel">Username</p>
        <asp:TextBox ID="UserName" runat="server" CssClass="w-full rounded text-[1rem] outline-none border-none bg-slate-800 ring-0"></asp:TextBox>
    </div>
    <div class="mb-1 rounded bg-slate-800 py-2 px-4">
        <p class="inputLabel">Password</p>
        <asp:TextBox ID="Password" TextMode="Password" runat="server" CssClass="w-full rounded text-[1rem] outline-none border-none bg-slate-800 ring-0"></asp:TextBox>
    </div>
    <asp:Button ID="RegisterButton" OnClick="RegisterButton_Click" runat="server" Text="Login" CssClass="w-full mt-4 hover:cursor-pointer label rounded outline-none border-none ring-0 bg-slate-700 hover:bg-purple-700 transition py-2 px-4" />

    <div class="w-full h-[2px] bg-slate-700 rounded my-5"></div>

    <div class="w-full flex flex-col items-center justify-center">
        <asp:HyperLink ID="HyperLink1" CssClass="inputLabel" NavigateUrl="~/Views/Authentication/Register.aspx" runat="server">Haven't registered? Click here</asp:HyperLink>
        <asp:HyperLink ID="HyperLink2" CssClass="inputLabel opacity-75" NavigateUrl="~/Views/Admin/AdminLogIn.aspx" runat="server">Are you an administrator? Click here</asp:HyperLink>
    </div>
</asp:Content>

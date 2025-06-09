<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Auth.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OMOSHIRO.Views.Authentication.Register" %>
<asp:Content ContentPlaceHolderID="title" runat="server">
    Omoshiro - Register
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="AuthPlaceholder" runat="server">
    <h3 class="text-2xl font-600 mb-5">Create a New Account</h3>
    <p class="text-red-500 text-sm mt-2 mb-3"><asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></p>

    <div class="mb-1 rounded bg-slate-800 py-2 px-4">
        <p class="inputLabel">Username</p>
        <asp:TextBox ID="UserName" runat="server" CssClass="w-full rounded text-[1rem] outline-none border-none bg-slate-800 ring-0"></asp:TextBox>
        <p class="text-[11px] text-red-500">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="UserName" runat="server" ErrorMessage="Username is required."></asp:RequiredFieldValidator>
        </p>
    </div>
    <div class="mb-1 rounded bg-slate-800 py-2 px-4">
        <p class="inputLabel">Full Name</p>
        <asp:TextBox ID="FullName" runat="server" CssClass="w-full rounded text-[1rem] outline-none border-none bg-slate-800 ring-0"></asp:TextBox>
        <p class="text-[11px] text-red-500">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="FullName" runat="server" ErrorMessage="Username is required."></asp:RequiredFieldValidator>
        </p>
    </div>
    <div class="mb-1 rounded bg-slate-800 py-2 px-4">
        <p class="inputLabel">Email</p>
        <asp:TextBox ID="Email" runat="server" CssClass="w-full rounded text-[1rem] outline-none border-none bg-slate-800 ring-0" TextMode="Email"></asp:TextBox>
        <p class="text-[11px] text-red-500">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="Email" runat="server" ErrorMessage="Username is required."></asp:RequiredFieldValidator>
        </p>
    </div>
    <div class="mb-1 rounded bg-slate-800 py-2 px-4">
        <p class="inputLabel">Password</p>
        <asp:TextBox ID="Password" runat="server" CssClass="w-full rounded text-[1rem] outline-none border-none bg-slate-800 ring-0" TextMode="Password"></asp:TextBox>
        <p class="text-[11px] text-red-500">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="Password" runat="server" ErrorMessage="Username is required."></asp:RequiredFieldValidator>
        </p>
    </div>
    <div class="mb-1 rounded bg-slate-800 py-2 px-4">
        <p class="inputLabel">Repeat Password</p>
        <asp:TextBox ID="RepPassword" runat="server" CssClass="w-full rounded text-[1rem] outline-none border-none bg-slate-800 ring-0" TextMode="Password"></asp:TextBox>
        <p class="text-[11px] text-red-500">
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="RepPassword" ControlToCompare="Password" ErrorMessage="Password doesn't match."></asp:CompareValidator>
        </p>
    </div>
    <asp:Button ID="RegisterButton" OnClick="RegisterButton_Click" runat="server" Text="Register" CssClass="w-full mt-4 hover:cursor-pointer label rounded outline-none border-none ring-0 bg-slate-700 hover:bg-purple-700 transition py-2 px-4" />

    <div class="w-full h-[2px] bg-slate-700 rounded my-5"></div>

    <div class="w-full flex justify-center">
        <asp:HyperLink ID="HyperLink1" CssClass="inputLabel" NavigateUrl="~/Views/Authentication/Login.aspx" runat="server">Already have an account? Click Here</asp:HyperLink>
    </div>
</asp:Content>

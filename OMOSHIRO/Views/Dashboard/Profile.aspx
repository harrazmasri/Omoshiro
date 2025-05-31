<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Dashboard.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="OMOSHIRO.Views.Dashboard.Profile" %>
<%@ Register Src="~/Views/Dashboard/UC/ProfileInventory.ascx" TagName="ProfileInventory" TagPrefix="component" %>

<asp:Content ContentPlaceHolderID="title" runat="server">
    Omoshiro - Profile
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="DashboardPlaceholder" runat="server">
    <h1 class="text-4xl mb-5">My Profile</h1>

    <div class="relative w-full h-fit px-[7rem] mb-7 flex gap-[100px] items-start mt-[70px] py-6">
    
        <div class="w-[250px] flex items-center gap-4">
            <div class="w-[100px] h-[100px] hover:brightness-75 rounded-full overflow-clip bg-slate-800 flex items-center justify-center">
                <asp:Image CssClass="w-[80%] h-[80%] opacity-50 invert" ID="Image1" ImageUrl="~/Public/Icon/user.svg" runat="server" />
            </div>
            <h2 class="text-2xl font-bold">John Doe</h2>
        </div>

        <div class="grow pt-[20px]">
            <div class="flex items-start gap-5 mb-5">
                <div>
                    <p class="text-slate-500 mb-2">Balance</p>
                    <p class="text-3xl">RM 500.50</p>
                </div>
                <div>
                    <p class="text-slate-500 mb-2">Spent Amount</p>
                    <p class="text-3xl">RM 720</p>
                </div>
            </div>

            <div class="mb-5">
                <p class="text-slate-500 mb-2">Inventory</p>
                <component:ProfileInventory runat="server" ID="ProfileInventory"></component:ProfileInventory>
            </div>

            <div class="mb-5">
                <p class="text-slate-500 mb-2">Reset Password</p>
                <asp:Button CssClass="bg-red-600 hover:brightness-75 rounded py-2 px-3" ID="Button1" runat="server" Text="Click to Reset Password" />
            </div>

            <div class="mb-5">
                <p class="text-slate-500 mb-2">Delete Account</p>
                <asp:Button CssClass="bg-red-600 hover:brightness-75 rounded py-2 px-3" ID="Button2" runat="server" Text="Click to Delete Your Account" />
            </div>
        </div>
    </div>
</asp:Content>
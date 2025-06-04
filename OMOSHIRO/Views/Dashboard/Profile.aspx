<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Dashboard.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="OMOSHIRO.Views.Dashboard.Profile" %>
<%@ Register Src="~/Views/Dashboard/UC/ProfileInventory.ascx" TagName="ProfileInventory" TagPrefix="component" %>

<asp:Content ContentPlaceHolderID="title" runat="server">
    Omoshiro - Profile
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="DashboardPlaceholder" runat="server">
    
    <div class="w-full mt-[70px] px-[7rem] py-6">
        <h1 class="text-4xl mb-5">My Profile</h1>
        <div class="relative w-full h-fit mb-7 flex gap-[100px] items-start">
        
            <div class="w-[250px] flex items-center gap-4">
                <div class="w-[100px] h-[100px] hover:brightness-75 rounded-full overflow-clip bg-slate-800 flex items-center justify-center">
                    <asp:Image CssClass="w-[80%] h-[80%] opacity-50 invert" ID="Image1" ImageUrl="~/Public/Icon/user.svg" runat="server" />
                </div>
                <h2 class="text-2xl font-bold">
                    <asp:Label ID="UserName" runat="server" Text="Guest"></asp:Label>
                </h2>
            </div>

            <div class="grow pt-[20px]">
                <div class="flex items-start gap-5 mb-5 h-fit">
                    <div>
                        <p class="text-slate-500 mb-2">Balance</p>
                        <p class="text-3xl">RM <asp:Label ID="UserBalance" runat="server" Text="0.00"></asp:Label></p>
                    </div>
                    <div>
                        <p class="text-slate-500 mb-2">Spent Amount</p>
                        <p class="text-3xl">RM <asp:Label ID="SpentAmount" runat="server" Text="0.00"></asp:Label></p>
                    </div>
                    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Views/Dashboard/TopUpWallet.aspx" CssClass="" runat="server">
                        <div class="h-[65px] bg-purple-800 w-fit text-white hover:brightness-75 rounded py-2 px-4 flex items-center justify-center gap-2">
                            <asp:Image ID="Image2" ImageUrl="~/Public/Icon/plus.svg" CssClass="w-[20px] h-[20px] ml-2 inline-block invert" runat="server" />
                            <asp:Label ID="HyperLinkText" runat="server" Text="Top Up"></asp:Label>
                        </div>
                    </asp:HyperLink>
                </div>

                <div class="mb-5">
                    <p class="text-slate-500 mb-2">Inventory</p>
                    <component:ProfileInventory runat="server" ID="ProfileInventory"></component:ProfileInventory>
                </div>

                <!-- div class="mb-5">
                    <p class="text-slate-500 mb-2">Reset Password</p>
                    <asp:Button CssClass="bg-red-600 hover:brightness-75 rounded py-2 px-3" ID="Button1" runat="server" Text="Click to Reset Password" />
                </div -->

                <div class="mb-5">
                    <p class="text-slate-500 mb-2">Delete Account</p>
                    <asp:Button CssClass="hover:cursor-pointer bg-red-600 hover:brightness-75 rounded py-2 px-3" OnClientClick="showDeleteModal(); return false;" ID="OpenModal" runat="server" Text="Click to Delete Your Account" />
                </div>
            </div>
        </div>
    </div>

    <div id="DeleteModal" class="hidden fixed z-20 top-0 right-0 w-screen h-screen bg-[rgba(20,20,20,.2)] flex items-center justify-center">
        <div class="w-[400px] h-fit rounded-[10px] bg-slate-800 border border-slate-700">
            <div class="py-4 px-6">
                <h3 class="text-3xl">Alert</h3>
            </div>
            <div class="bg-slate-700 py-4 px-6">
                <p>You are about to delete this account. You will not be able to access this account and purchased items in the future.<br/><br/> Are you sure?</p>
            </div>
            <div class="py-4 px-6 flex items-center justify-end gap-3 text-sm">
                <asp:Button OnClick="ConfirmDeleteButton_Click" CssClass="hover:cursor-pointer bg-red-600 hover:brightness-75 rounded py-2 px-3" ID="ConfirmDeleteButton" runat="server" Text="Confirm" />
                <asp:Button OnClientClick="hideDeleteModal(); return false;" CssClass="hover:cursor-pointer  bg-gray-600 hover:brightness-75 rounded py-2 px-3" ID="CancelDeleteButton" runat="server" Text="Cancel" />
            </div>
        </div>
    </div>
</asp:Content>
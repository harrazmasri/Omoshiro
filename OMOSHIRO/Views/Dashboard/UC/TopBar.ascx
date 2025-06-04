<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopBar.ascx.cs" Inherits="OMOSHIRO.Views.Dashboard.UC.TopBar" %>

<div class="absolute flex items-center top-0 z-20 h-[70px] mx-auto px-[6rem] py-6 w-full rounded-b-[30px] bg-slate-700/25 border-slate-600 backdrop-blur-md">
    <div class="w-1/3 flex gap-2 items-center">
        <asp:Image ID="Image1" ImageUrl="~/Public/logoMascot.png" CssClass="w-[50px]" runat="server" />
        <asp:Label ID="Label1" runat="server" Text="omoshiro" CssClass="text-[2rem]"></asp:Label>
    </div>
    <div class="w-1/3 flex justify-center items-center gap-4">
        <asp:HyperLink ID="HyperLink1" CssClass="font-400 hover:brightness-75" NavigateUrl="~/Views/Dashboard/Store.aspx" runat="server">Store</asp:HyperLink>
        <asp:HyperLink ID="HyperLink2" CssClass="font-400 hover:brightness-75" NavigateUrl="~/Views/Dashboard/Category.aspx" runat="server">Categories</asp:HyperLink>
        <div class="relative group p-0 flex items-center">
            <asp:Label ID="UserName" runat="server" Text="User" CssClass="font-400 hover:brightness-75"></asp:Label>
            <div class="scale-0 opacity-0 group-hover:scale-100 group-hover:opacity-100 top-7 origin-top -translate-x-[70px] absolute px-6 py-4 w-[200px] rounded-[10px] bg-slate-700 border-slate-600 transition">
                <p class="flex items-center gap-2">
                    <asp:Image ID="Image3" ImageUrl="~/Public/Icon/user.svg" CssClass="w-[15px] invert" runat="server" />
                    <asp:HyperLink ID="HyperLink3" CssClass="inputLabel hover:brightness-75" NavigateUrl="~/Views/Dashboard/Profile.aspx" runat="server">My Profile</asp:HyperLink>
                </p>
                <p class="flex items-center gap-2">
                    <asp:Image ID="Image4" ImageUrl="~/Public/Icon/log-out.svg" CssClass="w-[15px] invert" runat="server" />
                    <asp:Button CssClass="inputLabel hover:brightness-75" OnClick="Logout_Click" ID="Logout" runat="server" Text="Log Out" />
                </p>
            </div>
        </div>
    </div>
    <div class="w-1/3 flex justify-end items-center">
        <asp:HyperLink ID="HyperLink5" CssClass="inputLabel hover:brightness-75" NavigateUrl="~/Views/Dashboard/Cart.aspx" runat="server">
            <asp:Image ID="Image2" ImageUrl="~/Public/Icon/shopping-cart.svg" CssClass="w-[20px] invert" runat="server" />
        </asp:HyperLink>
    </div>
</div>
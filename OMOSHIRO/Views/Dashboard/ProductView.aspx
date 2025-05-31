<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Dashboard.Master" AutoEventWireup="true" CodeBehind="ProductView.aspx.cs" Inherits="OMOSHIRO.Views.Dashboard.ProductView" %>

<asp:Content ContentPlaceHolderID="title" runat="server">
    Omoshiro - Battlefield 1
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="DashboardPlaceholder" runat="server">
    <div class="relative w-full h-fit px-[7rem] mb-7 mt-[70px] py-6">
        
        <div class="w-full flex items-start gap-5">
            
            <div class="w-1/3 flex flex-col gap-3">
                <h1 class="text-3xl mb-5">Battlefield 1</h1>
                <div class="w-full overflow-clip rounded-[10px]">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Public/Banner/banner1.jpg" CssClass="w-full object-cover" />
                </div>

                <div class="w-full">
                    <asp:Label class="bg-purple-900 w-fit rounded py-1 px-2 text-sm font-400">war</asp:Label>
                    <asp:Label class="bg-purple-900 w-fit rounded py-1 px-2 text-sm font-400">rpg</asp:Label>
                    <asp:Label class="bg-purple-900 w-fit rounded py-1 px-2 text-sm font-400">firt-person-shooter</asp:Label>
                    <asp:Label class="bg-purple-900 w-fit rounded py-1 px-2 text-sm font-400">action</asp:Label>
                    <asp:Label class="bg-purple-900 w-fit rounded py-1 px-2 text-sm font-400">thriller</asp:Label>
                </div>

                <div class="bg-purple-800 w-fit text-white hover:brightness-75 rounded py-2 px-4">
                    <asp:Image CssClass="invert w-[14px]" ImageURL="~/Public/Icon/shopping-cart.svg" runat="server"></asp:Image>
                    <p>Add To Cart</p>
                </div>
            </div>

            <div class="w-2/3">
                <div class="w-[300px] mb-5">
                    <h4 class="mb-3 text-xl">Gallery</h4>

                    <div class="flex gap-3">
                        <asp:Image CssClass="rounded-[10px]" ImageURL="~/Public/TestProducts/test_preview/1.jpg" runat="server"></asp:Image>
                        <asp:Image CssClass="rounded-[10px]" ImageURL="~/Public/TestProducts/test_preview/2.jpg" runat="server"></asp:Image>
                        <asp:Image CssClass="rounded-[10px]" ImageURL="~/Public/TestProducts/test_preview/3.jpg" runat="server"></asp:Image>
                    </div>
                </div>

                <div class="w-full mb-5">
                    <h4 class="mb-3 text-xl">Description</h4>
                    <p class="text-slate-500">Battlefield 1 is a first-person shooter video game developed by EA DICE and published by Electronic Arts. It is the fifteenth installment in the Battlefield series, and the first main entry since Battlefield 4. The game is set in the World War I era, featuring a variety of historical battles and locations.</p>
                </div>

                <div class="w-full mb-5">
                    <h4 class="mb-3 text-xl">Requirements</h4>
                    <asp:BulletedList runat="server">
                        <asp:ListItem>OS: Windows 10 64-bit</asp:ListItem>
                        <asp:ListItem>Processor: AMD FX-6350 / Intel Core i5-6600K</asp:ListItem>
                        <asp:ListItem>Memory: 8 GB RAM</asp:ListItem>
                        <asp:ListItem>Graphics: AMD Radeon HD 7850 / NVIDIA GeForce GTX 660</asp:ListItem>
                        <asp:ListItem>DirectX: Version 11</asp:ListItem>
                        <asp:ListItem>Network: Broadband Internet connection</asp:ListItem>
                        <asp:ListItem>Storage: 50 GB available space</asp:ListItem>
                    </asp:BulletedList>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
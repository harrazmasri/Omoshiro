<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RackLayout.ascx.cs" Inherits="OMOSHIRO.Views.Dashboard.UC.RackLayout" %>

<h1 class="text-2xl font-600 mb-5">Featured For You</h1>

<div class="flex items-center w-full gap-4">

    <div class="relative w-[500px] aspect-[460/215] overflow-clip rounded-lg group">
        <asp:Image CssClass="absolute z-0 top-0 left-0 w-[500px] group-hover:scale-110 transition duration-500 brightness-50 group-hover:brightness-75" ID="Image1" ImageUrl="~/Public/TestProducts/header (14).jpg" runat="server" />
        <div class="flex items-end relative h-full">
            <div class="z-10 w-1/2 ps-6 pb-4 text-[1.2rem]">Game Haha</div>
            <div class="z-10 w-1/2 pe-6 pb-4 text-[1.2rem] flex justify-end">RM 20</div>
        </div>
    </div>

    <div class="relative w-[500px] aspect-[460/215] overflow-clip rounded-lg group">
        <asp:Image CssClass="absolute z-0 top-0 left-0 w-[500px] group-hover:scale-110 transition duration-500 brightness-50 group-hover:brightness-75" ID="Image2" ImageUrl="~/Public/TestProducts/header (15).jpg" runat="server" />
        <div class="flex items-end relative h-full">
            <div class="z-10 w-1/2 ps-6 pb-4 text-[1.2rem]">Game Haha</div>
            <div class="z-10 w-1/2 pe-6 pb-4 text-[1.2rem] flex justify-end">RM 20</div>
        </div>
    </div>

    <div class="relative w-[500px] aspect-[460/215] overflow-clip rounded-lg group">
        <asp:Image CssClass="absolute z-0 top-0 left-0 w-[500px] group-hover:scale-110 transition duration-500 brightness-50 group-hover:brightness-75" ID="Image3" ImageUrl="~/Public/TestProducts/header (16).jpg" runat="server" />
        <div class="flex items-end relative h-full">
            <div class="z-10 w-1/2 ps-6 pb-4 text-[1.2rem]">Game Haha</div>
            <div class="z-10 w-1/2 pe-6 pb-4 text-[1.2rem] flex justify-end">RM 20</div>
        </div>
    </div>
</div>
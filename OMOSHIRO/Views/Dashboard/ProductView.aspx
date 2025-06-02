<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Dashboard.Master" AutoEventWireup="true" CodeBehind="ProductView.aspx.cs" Inherits="OMOSHIRO.Views.Dashboard.ProductView" %>

<asp:Content ContentPlaceHolderID="title" runat="server">
    Omoshiro - Battlefield 1
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="DashboardPlaceholder" runat="server">
    <div class="relative w-full h-fit px-[7rem] mb-7 mt-[70px] py-6">
        
        <div class="w-[800px] mx-auto flex flex-col items-start gap-5">
            
            <div class="w-full flex flex-col gap-3">
                <asp:Label ID="GameTitle" runat="server" CssClass="text-3xl mb-5" Text="Label"></asp:Label>
                
                <div class="w-full overflow-clip rounded-[10px]">
                    <asp:Image ID="GameImage" runat="server" ImageUrl="" CssClass="w-full object-cover" />
                </div>

                <asp:Repeater ID="CategoryRepeater" runat="server">
                    <HeaderTemplate>
                        <div class="w-full">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <label class="bg-gray-800 w-fit rounded py-1 px-2 text-sm font-400"><%# Container.DataItem %></label>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="w-full flex justify-between items-end">
                    <p>RM<asp:Label CssClass="text-2xl" ID="GamePrice" runat="server" Text="0.00"></asp:Label><p>
                    <div class="bg-purple-800 flex items-center gap-3 w-fit text-white hover:brightness-75 rounded py-2 px-4">
                        <asp:Image CssClass="invert w-[14px]" ImageURL="~/Public/Icon/shopping-cart.svg" runat="server"></asp:Image>
                        <p>Add To Cart</p>
                    </div>
                </div>
            </div>

            <div class="w-full">
                <div class="w-full mb-5">
                    <h4 class="mb-3 text-xl">Gallery</h4>

                    <asp:Repeater ID="GalleryRepeater" runat="server">
                        <HeaderTemplate>
                            <div class="flex w-full rounded-[10px] overflow-clip">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Image CssClass="w-1/3" ImageUrl='<%# ResolveUrl(Eval("directory").ToString() + "/" + Eval("fileName").ToString()) %>' runat="server" />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <div class="w-full mb-5">
                    <h4 class="mb-3 text-xl">Description</h4>
                    <asp:Label CssClass="text-slate-300" ID="GameDescription" runat="server" Text="-"></asp:Label>
                </div>

                <div class="w-full mb-5">
                    <h4 class="mb-3 text-xl">Requirements</h4>
                    <asp:Label CssClass="text-slate-300" ID="GameRequirement" runat="server" Text="-"></asp:Label>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RackLayout.ascx.cs" Inherits="OMOSHIRO.Views.Dashboard.UC.RackLayout" %>

<h1 class="text-2xl font-600 mb-5">Featured For You</h1>

<asp:Repeater ID="RackRepeater" runat="server">
    <HeaderTemplate>
        <div class="flex items-center w-full gap-4">
    </HeaderTemplate>
    <ItemTemplate>
       <a href='<%# ResolveUrl("~/Views/Dashboard/ProductView.aspx?title=" + Eval("Title")) %>'>
            <div class="relative w-[500px] aspect-[460/215] overflow-clip rounded-lg group">
                <asp:Image CssClass="absolute z-0 top-0 left-0 w-[500px] group-hover:scale-110 transition duration-500 brightness-50 group-hover:brightness-75" ID="Image1" ImageUrl='<%# ResolveUrl(Eval("Image").ToString()) %>' runat="server" />
                <div class="flex items-end relative h-full">
                    <div class="z-10 w-1/2 ps-6 pb-4 text-[1.2rem]"><%# Eval("Title") %></div>
                    <div class="z-10 w-1/2 pe-6 pb-4 text-[1.2rem] flex justify-end">RM <%# Eval("Price") %></div>
                </div>
            </div>
        </a>
    </ItemTemplate>
    <FooterTemplate>
        </div>
    </FooterTemplate>
</asp:Repeater>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartList.ascx.cs" Inherits="OMOSHIRO.Views.Dashboard.UC.CartList" %>

<div class="w-full">
    <% for (int index = 0; index < 10; index++) { %>
        <div class="relative w-full overflow-clip flex gap-5 group hover:backdrop-brightness-90 py-2 px-3 rounded-lg">
            <div class="w-[200px] aspect-[460/215] rounded-lg overflow-clip">
                <img class="z-0 mb-3 top-0 left-0 w-full group-hover:scale-110 transition duration-500 brightness-50 group-hover:brightness-75" src="<%= ResolveUrl("~/Public/TestProducts/header (" + (index + 20) + ").jpg") %>" />
            </div>
            <div class="flex justify-between items-center grow">
                <div class="z-10 text-xl w-1/2">Game Haha</div>
                <div class="z-10 w-1/2 flex justify-end">RM <span class="text-2xl">20</span></div>
            </div>
            <div class="my-auto hover:bg-slate-950 rounded-full w-[30px] h-[30px] flex items-center justify-center">
                <asp:Image class="invert w-[20px]" ImageUrl="~/Public/Icon/x.svg" runat="server"></asp:Image>
            </div>
        </div>
    <% } %>

</div>
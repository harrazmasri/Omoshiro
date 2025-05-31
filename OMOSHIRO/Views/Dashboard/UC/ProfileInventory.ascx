<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfileInventory.ascx.cs" Inherits="OMOSHIRO.Views.Dashboard.UC.CategoryGrid" %>

<div class="grid grid-cols-4 grid-flow-row auto-rows-max gap-4">
    <% for (int index = 0; index < 10; index++) { %>
        <div class="relative w-[300px] overflow-clip rounded-lg group">
            <img class="z-0 mb-3 top-0 left-0 w-full group-hover:scale-110 transition duration-500 brightness-50 group-hover:brightness-75"
                 src="<%= ResolveUrl("~/Public/TestProducts/header (" + (index + 20) + ").jpg") %>" />
            <div class="flex">
                <div class="z-10 w-1/2">Game Haha</div>
                <div class="z-10 w-1/2 flex justify-end">RM 20</div>
            </div>
        </div>
    <% } %>

</div>
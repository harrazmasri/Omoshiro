<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GridLayout.ascx.cs" Inherits="OMOSHIRO.Views.Dashboard.UC.GridLayout" %>

<h1 class="text-2xl font-600 mb-5">New Entries</h1>

<asp:Repeater ID="rptProducts" runat="server">
    <HeaderTemplate>
        <div class="grid grid-cols-5 grid-flow-row auto-rows-max gap-4">
    </HeaderTemplate>

    <ItemTemplate>
        <a href='<%# ResolveUrl("~/Views/Dashboard/ProductView.aspx?title=" + Eval("Title")) %>'>
            <div class="relative w-full overflow-clip rounded-lg group">
                <img class="z-0 mb-3 top-0 left-0 w-full group-hover:scale-110 transition duration-500 brightness-50 group-hover:brightness-75"
                        src='<%# ResolveUrl(Eval("Image").ToString()) %>' />
                <div class="flex">
                    <div class="z-10 w-1/2"><%# Eval("Title") %></div>
                    <div class="z-10 w-1/2 flex justify-end">RM <%# Eval("Price") %></div>
                </div>
            </div>
        </a>
    </ItemTemplate>

    <FooterTemplate>
        </div>
    </FooterTemplate>
</asp:Repeater>
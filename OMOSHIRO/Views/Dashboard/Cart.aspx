<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Dashboard.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="OMOSHIRO.Views.Dashboard.Cart" %>
<%@ Register Src="~/Views/Dashboard/UC/CartList.ascx" TagPrefix="component" TagName="CartList" %>

<asp:Content ContentPlaceHolderID="title" runat="server">
    Omoshiro - Your Cart
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="DashboardPlaceholder" runat="server">
    <div class="relative w-full h-fit px-[7rem] mb-7 mt-[70px] py-6">
        <h1 class="text-4xl mb-5">My Cart</h1>

        <div>
            <component:CartList runat="server" ID="CartList"></component:CartList>
        </div>

        <div class="w-full flex flex-col items-end border-t border-slate-700 pt-4">
            <div class="w-full mb-5 flex justify-between items-center">
                <p>Total amount:</p>
                <h3 class="text-3xl">RM30.33</h3>
            </div>

            <asp:Button CssClass="bg-purple-800 w-fit text-white hover:brightness-75 rounded py-2 px-4" ID="Button1" runat="server" Text="Checkout" />
        </div>
    </div>
</asp:Content>
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Dashboard.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="OMOSHIRO.Views.Dashboard.Cart" %>
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
                <h3 class="text-3xl">RM <asp:Label ID="TotalAmountLabel" runat="server" Text=""></asp:Label></h3>
            </div>

            <asp:Button OnClick="CheckoutButton_Click" CssClass="hover:cursor-pointer bg-purple-800 w-fit text-white hover:brightness-75 rounded py-2 px-4 disabled:brightness-75 disabled:bg-gray-700" ID="CheckoutButton" runat="server" Text="Checkout" />
            <asp:Label ID="LowBalanceLabel" CssClass="text-[12px] text-gray-400 mt-2" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
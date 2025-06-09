<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Dashboard.Master" AutoEventWireup="true" CodeBehind="TopUpWallet.aspx.cs" Inherits="OMOSHIRO.Views.Dashboard.TopUpWallet" %>
<asp:Content ContentPlaceHolderID="title" runat="server">
    Omoshiro - Top Up Balance
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="DashboardPlaceholder" runat="server">
    <div class="w-full mt-[70px] px-[7rem] py-6">
        <h1 class="text-4xl mb-5">Top Up Balance</h1>
        <div class="relative w-full h-fit mb-7">

            <div class="w-full flex gap-2">
                <asp:LinkButton OnCommand="TopUpFixedAmount_Click" CommandArgument="10.00" CssClass="w-1/6 h-[70px] p-6 rounded-[10px] bg-gradient-to-r from-red-400 to-purple-900 hover:brightness-90 flex items-center justify-end" ID="LinkButton1" runat="server">
                    <p class="text-lg">+RM <label class="text-2xl">10.00</label></p>
                </asp:LinkButton>
                <asp:LinkButton OnCommand="TopUpFixedAmount_Click" CommandArgument="20.00" CssClass="w-1/6 h-[70px] p-6 rounded-[10px] bg-gradient-to-r from-orange-400 to-purple-900  hover:brightness-90 flex items-center justify-end" ID="LinkButton2" runat="server">
                    <p class="text-lg">+RM <label class="text-2xl">20.00</label></p>
                </asp:LinkButton>
                <asp:LinkButton OnCommand="TopUpFixedAmount_Click" CommandArgument="50.00" CssClass="w-1/6 h-[70px] p-6 rounded-[10px] bg-gradient-to-r from-cyan-400 to-purple-900  hover:brightness-90 flex items-center justify-end" ID="LinkButton3" runat="server">
                    <p class="text-lg">+RM <label class="text-2xl">50.00</label></p>
                </asp:LinkButton>
                <asp:LinkButton OnCommand="TopUpFixedAmount_Click" CommandArgument="100.00" CssClass="w-1/6 h-[70px] p-6 rounded-[10px] bg-gradient-to-r from-purple-400 to-purple-900  hover:brightness-90 flex items-center justify-end" ID="LinkButton5" runat="server">
                    <p class="text-lg">+RM <label class="text-2xl">100.00</label></p>
                </asp:LinkButton>
            </div>

            <div class="w-full h-[2px] bg-slate-800 rounded my-5"></div>

            <div class="w-full flex items-center gap-3">
                <asp:Label ID="label1" runat="server" Text="" CssClass="text-slate-400">Enter your amount: </asp:Label>
                <asp:TextBox ID="AmountValue" CssClass="w-[200px] py-2 px-4 text-[1rem] outline-none ring-0 pb-3 border-b-2 border-slate-700 active:border-purple-700" runat="server" AutoPostBack="True" TextMode="Number" MinLength="0" Value="0.00"></asp:TextBox>
                <asp:Button ID="TopUpButton" runat="server" Text="Add Balance" CssClass="bg-purple-800 hover:brightness-75 rounded py-2 px-4 text-white" OnClick="TopUpButton_Click" />
            </div>

            <asp:Label ID="SuccessMessage" runat="server" CssClass="mt-3 text-sm text-green-400"></asp:Label>
            <asp:Label ID="FailedMessage" runat="server" CssClass="mt-3 text-sm text-red-400"></asp:Label>

        </div>
    </div>
</asp:Content>
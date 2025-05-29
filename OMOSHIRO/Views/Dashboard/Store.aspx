<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Dashboard.Master" AutoEventWireup="true" CodeBehind="Store.aspx.cs" Inherits="OMOSHIRO.Views.Dashboard.Store" %>
<%@ Register Src="~/Views/Dashboard/UC/Featured.ascx" TagPrefix="component" TagName="Featured" %>
<%@ Register Src="~/Views/Dashboard/UC/RackLayout.ascx" TagPrefix="component" TagName="RackLayout" %>
<%@ Register Src="~/Views/Dashboard/UC/GridLayout.ascx" TagPrefix="component" TagName="GridLayout" %>

<asp:Content ContentPlaceHolderID="title" runat="server">
    Omoshiro - Store
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="DashboardPlaceholder" runat="server">
    
    <div class="relative w-full h-fit aspect-[1920/540]">
        <component:Featured runat="server" ID="Featured" />
    </div>

    <div class="relative w-full h-fit px-[7rem] mb-7">
        <component:RackLayout runat="server" ID="RackLayout" />
    </div>

    <div class="relative w-full h-fit px-[7rem] mb-7">
        <component:GridLayout runat="server" ID="GridLayout" />
    </div>

</asp:Content>
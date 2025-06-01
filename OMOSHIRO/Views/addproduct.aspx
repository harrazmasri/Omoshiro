<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="OMOSHIRO.Views.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Omoshiro - Add Product
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="p-8 max-w-xl mx-auto">
    <h2 class="text-2xl font-bold mb-4 text-white">Add New Game Product</h2>

    <asp:Label ID="lblMessage" runat="server" CssClass="text-red-500 font-medium block mb-4" />

    <div class="mb-4">
        <asp:Label AssociatedControlID="txtDirectory" runat="server" Text="Game Directory Path" CssClass="block text-white mb-1" />
        <asp:TextBox ID="txtDirectory" runat="server" CssClass="w-full px-3 py-2 rounded bg-gray-800 text-white border border-gray-600" />
    </div>

    <div class="mb-4">
        <asp:Label AssociatedControlID="fuThumbnail" runat="server" Text="Thumbnail Image" CssClass="block text-white mb-1" />
        <asp:FileUpload ID="fuThumbnail" runat="server" CssClass="w-full text-white file:bg-purple-600 file:text-white file:rounded file:px-4 file:py-2 file:border-none file:cursor-pointer file:hover:bg-purple-700 bg-gray-800 border border-gray-600 rounded px-3 py-2" />
    </div>


    <div class="mb-4">
        <asp:Label AssociatedControlID="txtTitle" runat="server" Text="Game Title" CssClass="block text-white mb-1" />
        <asp:TextBox ID="txtTitle" runat="server" CssClass="w-full px-3 py-2 rounded bg-gray-800 text-white border border-gray-600" />
    </div>

    <div class="mb-4">
        <asp:Label AssociatedControlID="txtDesc" runat="server" Text="Game Description" CssClass="block text-white mb-1" />
        <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Rows="3" CssClass="w-full px-3 py-2 rounded bg-gray-800 text-white border border-gray-600" />
    </div>

    <div class="mb-4">
        <asp:Label AssociatedControlID="txtPrice" runat="server" Text="Game Price (RM)" CssClass="block text-white mb-1" />
        <asp:TextBox ID="txtPrice" runat="server" CssClass="w-full px-3 py-2 rounded bg-gray-800 text-white border border-gray-600" />
    </div>

    <div class="mb-4">
        <asp:Label AssociatedControlID="txtReq" runat="server" Text="Game Requirements" CssClass="block text-white mb-1" />
        <asp:TextBox ID="txtReq" runat="server" TextMode="MultiLine" Rows="3" CssClass="w-full px-3 py-2 rounded bg-gray-800 text-white border border-gray-600" />
    </div>

    <div class="mb-4 flex items-center gap-2">
        <asp:CheckBox ID="chkIsActive" runat="server" CssClass="form-checkbox accent-purple-600" />
        <asp:Label AssociatedControlID="chkIsActive" runat="server" Text="Active Product" CssClass="text-white" />
    </div>

    <asp:Button ID="btnAdd" runat="server" Text="Add Product" CssClass="bg-purple-600 hover:bg-purple-700 text-white px-4 py-2 rounded" OnClick="btnAdd_Click" />
</div>

</asp:Content>

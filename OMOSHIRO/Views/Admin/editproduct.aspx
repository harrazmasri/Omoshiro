<%@ Page Title="" Language="C#" MasterPageFile="../DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="editproduct.aspx.cs" Inherits="OMOSHIRO.Views.Admin.editproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Omoshiro - Edit Product
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="p-8 max-w-xl mx-auto">
    <h2 class="text-2xl font-bold mb-4 text-white">Edit Game Product</h2>

    <asp:Label ID="lblMessage" runat="server" CssClass="text-red-500 font-medium block mb-4" />

    <div class="mb-4">
        <asp:Label AssociatedControlID="fuThumbnail" runat="server" Text="Thumbnail Image" CssClass="block text-white mb-1" />
        <asp:Image ID="thumbnail" CssClass="w-[300px] rounded mb-3" runat="server" />
        <asp:FileUpload ID="fuThumbnail" runat="server" CssClass="w-full text-white file:bg-purple-600 file:text-white file:rounded file:px-4 file:py-2 file:border-none file:cursor-pointer file:hover:bg-purple-700 bg-gray-800 border border-gray-600 rounded px-3 py-2" />
    </div>

    <div class="mb-4">
        <asp:Label AssociatedControlID="txtTitle" runat="server" Text="Game Title" CssClass="block text-white mb-1" />
        <asp:TextBox ID="txtTitle" runat="server" CssClass="w-full px-3 py-2 rounded bg-gray-800 text-white border border-gray-600" />
    </div>

    <div class="mb-4">
        <asp:Label AssociatedControlID="txtPrice" runat="server" Text="Game Price (RM)" CssClass="block text-white mb-1" />
        <asp:TextBox ID="txtPrice" runat="server" CssClass="w-full px-3 py-2 rounded bg-gray-800 text-white border border-gray-600" />
    </div>

    <div class="mb-4">
        <asp:Label AssociatedControlID="txtDesc" runat="server" Text="Game Description" CssClass="block text-white mb-1" />
        <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Rows="3" CssClass="w-full px-3 py-2 rounded bg-gray-800 text-white border border-gray-600" />
    </div>

    <div class="mb-4">
        <asp:Label AssociatedControlID="txtReq" runat="server" Text="Game Requirements" CssClass="block text-white mb-1" />
        <asp:TextBox ID="txtReq" runat="server" TextMode="MultiLine" Rows="3" CssClass="w-full px-3 py-2 rounded bg-gray-800 text-white border border-gray-600" />
    </div>

    <div class="mb-4">
        <asp:Label AssociatedControlID="GenreListBox" runat="server" Text="Select Genres" CssClass="block text-white mb-1" />
        <asp:ListBox ID="GenreListBox" runat="server" CssClass="form-select" SelectionMode="Multiple" Rows="15" Width="300px">
            <asp:ListItem Enabled="false" Text="Action" Value="action" />
            <asp:ListItem Text="Arcade & Rhythm" Value="arcade_rhythm" />
            <asp:ListItem Text="Fighting & Martial Arts" Value="fighting_martial_arts" />
            <asp:ListItem Text="First-Person Shooter" Value="fps" />
            <asp:ListItem Text="Hack & Slash" Value="hack_slash" />
            <asp:ListItem Text="Platformer & Runner" Value="platformer_runner" />
            <asp:ListItem Text="Third-Person Shooter" Value="tps" />
            <asp:ListItem Text="shmup" Value="shmup" />

            <asp:ListItem Enabled="false" Text="Adventure RPG" Value="adventure_rpg" />
            <asp:ListItem Text="Casual" Value="casual" />
            <asp:ListItem Text="Hidden Object" Value="hidden_object" />
            <asp:ListItem Text="Metroidvania" Value="metroidvania" />
            <asp:ListItem Text="Puzzle" Value="puzzle" />
            <asp:ListItem Text="Story-Rich" Value="story_rich" />
            <asp:ListItem Text="Visual Novel" Value="visual_novel" />

            <asp:ListItem Enabled="false" Text="Action RPG" Value="action_rpg" />
            <asp:ListItem Text="JRPG" Value="jrpg" />
            <asp:ListItem Text="Party-Based" Value="party_based" />
            <asp:ListItem Text="Rogue-Like" Value="rogue_like" />
            <asp:ListItem Text="Strategy RPG" Value="strategy_rpg" />
            <asp:ListItem Text="Turn-Based" Value="turn_based" />

            <asp:ListItem Enabled="false" Text="Card & Board" Value="card_board" />
            <asp:ListItem Text="City & Settlement" Value="city_settlement" />
            <asp:ListItem Text="Grand & 4X" Value="grand_4x" />
            <asp:ListItem Text="Military" Value="military" />
            <asp:ListItem Text="Real-Time Strategy" Value="rts" />
            <asp:ListItem Text="Tower Defense" Value="tower_defense" />
            <asp:ListItem Text="Turn-Based Strategy" Value="turn_based_strategy" />

            <asp:ListItem Enabled="false" Text="Building & Automation" Value="building_automation" />
            <asp:ListItem Text="Dating" Value="dating" />
            <asp:ListItem Text="Farming & Crafting" Value="farming_crafting" />
            <asp:ListItem Text="Hobby & Job" Value="hobby_job" />
            <asp:ListItem Text="Life & Immersive" Value="life_immersive" />
            <asp:ListItem Text="Sandbox & Physics" Value="sandbox_physics" />
            <asp:ListItem Text="Space & Flight" Value="space_flight" />

            <asp:ListItem Enabled="false" Text="All Sports" Value="all_sports" />
            <asp:ListItem Text="Fishing & Hunting" Value="fishing_hunting" />
            <asp:ListItem Text="Individual Sports" Value="individual_sports" />
            <asp:ListItem Text="Racing" Value="racing" />
            <asp:ListItem Text="Racing Sim" Value="racing_sim" />
            <asp:ListItem Text="Sports Sim" Value="sports_sim" />
            <asp:ListItem Text="Team Sports" Value="team_sports" />
        </asp:ListBox>
    </div>

    <div class="mb-4">
        <asp:Label AssociatedControlID="fuGallery" runat="server" Text="Gallery" CssClass="block text-white mb-1" />
        <asp:FileUpload ID="fuGallery" AllowMultiple="true" CssClass="w-full text-white file:bg-purple-600 file:text-white file:rounded file:px-4 file:py-2 file:border-none file:cursor-pointer file:hover:bg-purple-700 bg-gray-800 border border-gray-600 rounded px-3 py-2" runat="server" />
    </div>

    <div class="mb-4 flex items-center gap-2">
        <asp:CheckBox ID="chkIsActive" runat="server" CssClass="form-checkbox accent-purple-600" />
        <asp:Label AssociatedControlID="chkIsActive" runat="server" Text="Active Product" CssClass="text-white" />
    </div>

    <asp:Button ID="btnAdd" runat="server" Text="Save" CssClass="hover:cursor-pointer bg-purple-600 hover:bg-purple-700 text-white px-4 py-2 rounded" OnClick="EditButton" />
</div>

</asp:Content>

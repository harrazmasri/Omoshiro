<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Dashboard.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="OMOSHIRO.Views.Dashboard.Category" %>
<%@ Register Src="~/Views/Dashboard/UC/CategoryGrid.ascx" TagPrefix="component" TagName="CategoryGrid" %>

<asp:Content ContentPlaceHolderID="title" runat="server">
    Omoshiro - Category
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="DashboardPlaceholder" runat="server">
    
    <div class="relative w-full h-fit px-[7rem] mb-7 flex mt-[70px] py-6">
    
        <div class="w-[250px] py-4 px-5 rounded-[5px] bg-slate-800 text-sm">
            <h4 class="text-lg mb-5">Genres</h4>

            <!-- Action -->
            <asp:Label CssClass="font-400 text-slate-500" runat="server" Text="Action" Font-Bold="true" /><br />
            <asp:Button runat="server" Text="Action" OnClick="Genre_Click" CommandArgument="action" /><br />
            <asp:Button runat="server" Text="Arcade & Rhythm" OnClick="Genre_Click" CommandArgument="arcade_rhythm" /><br />
            <asp:Button runat="server" Text="Fighting & Martial Arts" OnClick="Genre_Click" CommandArgument="fighting_martial_arts" /><br />
            <asp:Button runat="server" Text="First-Person Shooter" OnClick="Genre_Click" CommandArgument="fps" /><br />
            <asp:Button runat="server" Text="Hack & Slash" OnClick="Genre_Click" CommandArgument="hack_slash" /><br />
            <asp:Button runat="server" Text="Platformer & Runner" OnClick="Genre_Click" CommandArgument="platformer_runner" /><br />
            <asp:Button runat="server" Text="Third-Person Shooter" OnClick="Genre_Click" CommandArgument="tps" /><br />
            <asp:Button runat="server" Text="shmup" OnClick="Genre_Click" CommandArgument="shmup" /><br /><br />

            <!-- Adventure -->
            <asp:Label CssClass="font-400 text-slate-500" runat="server" Text="Adventure" Font-Bold="true" /><br />
            <asp:Button runat="server" Text="Adventure RPG" OnClick="Genre_Click" CommandArgument="adventure_rpg" /><br />
            <asp:Button runat="server" Text="Casual" OnClick="Genre_Click" CommandArgument="casual" /><br />
            <asp:Button runat="server" Text="Hidden Object" OnClick="Genre_Click" CommandArgument="hidden_object" /><br />
            <asp:Button runat="server" Text="Metroidvania" OnClick="Genre_Click" CommandArgument="metroidvania" /><br />
            <asp:Button runat="server" Text="Puzzle" OnClick="Genre_Click" CommandArgument="puzzle" /><br />
            <asp:Button runat="server" Text="Story-Rich" OnClick="Genre_Click" CommandArgument="story_rich" /><br />
            <asp:Button runat="server" Text="Visual Novel" OnClick="Genre_Click" CommandArgument="visual_novel" /><br /><br />

            <!-- Role-Playing -->
            <asp:Label CssClass="font-400 text-slate-500" runat="server" Text="Role-Playing" Font-Bold="true" /><br />
            <asp:Button runat="server" Text="Action RPG" OnClick="Genre_Click" CommandArgument="action_rpg" /><br />
            <asp:Button runat="server" Text="Adventure RPG" OnClick="Genre_Click" CommandArgument="adventure_rpg" /><br />
            <asp:Button runat="server" Text="JRPG" OnClick="Genre_Click" CommandArgument="jrpg" /><br />
            <asp:Button runat="server" Text="Party-Based" OnClick="Genre_Click" CommandArgument="party_based" /><br />
            <asp:Button runat="server" Text="Rogue-Like" OnClick="Genre_Click" CommandArgument="rogue_like" /><br />
            <asp:Button runat="server" Text="Strategy RPG" OnClick="Genre_Click" CommandArgument="strategy_rpg" /><br />
            <asp:Button runat="server" Text="Turn-Based" OnClick="Genre_Click" CommandArgument="turn_based" /><br /><br />

            <!-- Strategy -->
            <asp:Label CssClass="font-400 text-slate-500" runat="server" Text="Strategy" Font-Bold="true" /><br />
            <asp:Button runat="server" Text="Card & Board" OnClick="Genre_Click" CommandArgument="card_board" /><br />
            <asp:Button runat="server" Text="City & Settlement" OnClick="Genre_Click" CommandArgument="city_settlement" /><br />
            <asp:Button runat="server" Text="Grand & 4X" OnClick="Genre_Click" CommandArgument="grand_4x" /><br />
            <asp:Button runat="server" Text="Military" OnClick="Genre_Click" CommandArgument="military" /><br />
            <asp:Button runat="server" Text="Real-Time Strategy" OnClick="Genre_Click" CommandArgument="rts" /><br />
            <asp:Button runat="server" Text="Tower Defense" OnClick="Genre_Click" CommandArgument="tower_defense" /><br />
            <asp:Button runat="server" Text="Turn-Based Strategy" OnClick="Genre_Click" CommandArgument="turn_based_strategy" /><br /><br />

            <!-- Simulation -->
            <asp:Label CssClass="font-400 text-slate-500" runat="server" Text="Simulation" Font-Bold="true" /><br />
            <asp:Button runat="server" Text="Building & Automation" OnClick="Genre_Click" CommandArgument="building_automation" /><br />
            <asp:Button runat="server" Text="Dating" OnClick="Genre_Click" CommandArgument="dating" /><br />
            <asp:Button runat="server" Text="Farming & Crafting" OnClick="Genre_Click" CommandArgument="farming_crafting" /><br />
            <asp:Button runat="server" Text="Hobby & Job" OnClick="Genre_Click" CommandArgument="hobby_job" /><br />
            <asp:Button runat="server" Text="Life & Immersive" OnClick="Genre_Click" CommandArgument="life_immersive" /><br />
            <asp:Button runat="server" Text="Sandbox & Physics" OnClick="Genre_Click" CommandArgument="sandbox_physics" /><br />
            <asp:Button runat="server" Text="Space & Flight" OnClick="Genre_Click" CommandArgument="space_flight" /><br /><br />

            <!-- Sports & Racing -->
            <asp:Label CssClass="font-400 text-slate-500" runat="server" Text="Sports & Racing" Font-Bold="true" /><br />
            <asp:Button runat="server" Text="All Sports" OnClick="Genre_Click" CommandArgument="all_sports" /><br />
            <asp:Button runat="server" Text="Fishing & Hunting" OnClick="Genre_Click" CommandArgument="fishing_hunting" /><br />
            <asp:Button runat="server" Text="Individual Sports" OnClick="Genre_Click" CommandArgument="individual_sports" /><br />
            <asp:Button runat="server" Text="Racing" OnClick="Genre_Click" CommandArgument="racing" /><br />
            <asp:Button runat="server" Text="Racing Sim" OnClick="Genre_Click" CommandArgument="racing_sim" /><br />
            <asp:Button runat="server" Text="Sports Sim" OnClick="Genre_Click" CommandArgument="sports_sim" /><br />
            <asp:Button runat="server" Text="Team Sports" OnClick="Genre_Click" CommandArgument="team_sports" /><br />
        </div>


        <div class="px-5 rounded-[5px] grow">
            <component:CategoryGrid runat="server" ID="CategoryGrid"></component:CategoryGrid>
        </div>


    </div>

</asp:Content>
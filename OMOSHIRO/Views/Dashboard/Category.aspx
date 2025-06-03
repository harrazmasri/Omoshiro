<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Dashboard.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="OMOSHIRO.Views.Dashboard.Category" %>
<%@ Register Src="~/Views/Dashboard/UC/CategoryGrid.ascx" TagPrefix="component" TagName="CategoryGrid" %>

<asp:Content ContentPlaceHolderID="title" runat="server">
    Omoshiro - Category
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="DashboardPlaceholder" runat="server">
    
    <div class="relative w-full h-fit px-[7rem] mb-7 flex mt-[70px] py-6">
    
        <div class="w-[250px] py-4 px-5 rounded-[5px] bg-slate-800 text-sm">
            <h4 class="text-lg mb-2">Genres</h4>

            <p class="mt-3 font-400 text-slate-500"><asp:Label runat="server" Text="Action" Font-Bold="true" /></p>
            <asp:HyperLink ID="arcade_rhythm" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=arcade_rhythm">Arcade & Rhythm</asp:HyperLink><br />
            <asp:HyperLink ID="fighting_martial_arts" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=fighting_martial_arts">Fighting & Martial Arts</asp:HyperLink><br />
            <asp:HyperLink ID="fps" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=fps">First-Person Shooter</asp:HyperLink><br />
            <asp:HyperLink ID="hack_slash" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=hack_slash">Hack & Slash</asp:HyperLink><br />
            <asp:HyperLink ID="platformer_runner" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=platformer_runner">Platformer & Runner</asp:HyperLink><br />
            <asp:HyperLink ID="tps" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=tps">Third-Person Shooter</asp:HyperLink><br />
            <asp:HyperLink ID="shmup" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=shmup">shmup</asp:HyperLink><br />

            <p class="mt-3 font-400 text-slate-500"><asp:Label runat="server" Text="Adventure RPG" Font-Bold="true" /></p>
            <asp:HyperLink ID="casual" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=casual">Casual</asp:HyperLink><br />
            <asp:HyperLink ID="hidden_object" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=hidden_object">Hidden Object</asp:HyperLink><br />
            <asp:HyperLink ID="metroidvania" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=metroidvania">Metroidvania</asp:HyperLink><br />
            <asp:HyperLink ID="puzzle" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=puzzle">Puzzle</asp:HyperLink><br />
            <asp:HyperLink ID="story_rich" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=story_rich">Story-Rich</asp:HyperLink><br />
            <asp:HyperLink ID="visual_novel" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=visual_novel">Visual Novel</asp:HyperLink><br />

            <p class="mt-3 font-400 text-slate-500"><asp:Label runat="server" Text="Action RPG" Font-Bold="true" /></p>
            <asp:HyperLink ID="jrpg" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=jrpg">JRPG</asp:HyperLink><br />
            <asp:HyperLink ID="party_based" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=party_based">Party-Based</asp:HyperLink><br />
            <asp:HyperLink ID="rogue_like" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=rogue_like">Rogue-Like</asp:HyperLink><br />
            <asp:HyperLink ID="strategy_rpg" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=strategy_rpg">Strategy RPG</asp:HyperLink><br />
            <asp:HyperLink ID="turn_based" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=turn_based">Turn-Based</asp:HyperLink><br />

            <p class="mt-3 font-400 text-slate-500"><asp:Label runat="server" Text="Card & Board" Font-Bold="true" /></p>
            <asp:HyperLink ID="city_settlement" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=city_settlement">City & Settlement</asp:HyperLink><br />
            <asp:HyperLink ID="grand_4x" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=grand_4x">Grand & 4X</asp:HyperLink><br />
            <asp:HyperLink ID="military" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=military">Military</asp:HyperLink><br />
            <asp:HyperLink ID="rts" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=rts">Real-Time Strategy</asp:HyperLink><br />
            <asp:HyperLink ID="tower_defense" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=tower_defense">Tower Defense</asp:HyperLink><br />
            <asp:HyperLink ID="turn_based_strategy" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=turn_based_strategy">Turn-Based Strategy</asp:HyperLink><br />

            <p class="mt-3 font-400 text-slate-500"><asp:Label runat="server" Text="Building & Automation" Font-Bold="true" /></p>
            <asp:HyperLink ID="dating" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=dating">Dating</asp:HyperLink><br />
            <asp:HyperLink ID="farming_crafting" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=farming_crafting">Farming & Crafting</asp:HyperLink><br />
            <asp:HyperLink ID="hobby_job" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=hobby_job">Hobby & Job</asp:HyperLink><br />
            <asp:HyperLink ID="life_immersive" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=life_immersive">Life & Immersive</asp:HyperLink><br />
            <asp:HyperLink ID="sandbox_physics" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=sandbox_physics">Sandbox & Physics</asp:HyperLink><br />
            <asp:HyperLink ID="space_flight" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=space_flight">Space & Flight</asp:HyperLink><br />

            <p class="mt-3 font-400 text-slate-500"><asp:Label runat="server" Text="All Sports" Font-Bold="true" /></p>
            <asp:HyperLink ID="fishing_hunting" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=fishing_hunting">Fishing & Hunting</asp:HyperLink><br />
            <asp:HyperLink ID="individual_sports" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=individual_sports">Individual Sports</asp:HyperLink><br />
            <asp:HyperLink ID="racing" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=racing">Racing</asp:HyperLink><br />
            <asp:HyperLink ID="racing_sim" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=racing_sim">Racing Sim</asp:HyperLink><br />
            <asp:HyperLink ID="sports_sim" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=sports_sim">Sports Sim</asp:HyperLink><br />
            <asp:HyperLink ID="team_sports" runat="server" NavigateUrl="~/Views/Dashboard/Category.aspx?category=team_sports">Team Sports</asp:HyperLink><br />
        </div>


        <div class="px-5 rounded-[5px] grow">
            <component:CategoryGrid runat="server" ID="CategoryGrid"></component:CategoryGrid>
        </div>


    </div>

</asp:Content>
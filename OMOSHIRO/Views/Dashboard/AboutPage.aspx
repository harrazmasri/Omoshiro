<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Dashboard.Master" AutoEventWireup="true" CodeBehind="AboutPage.aspx.cs" Inherits="OMOSHIRO.Views.Dashboard.AboutPage" %>
<asp:Content ContentPlaceHolderID="title" runat="server">
    Omoshiro History
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="DashboardPlaceholder" runat="server">
    <div class="w-[1000px] mx-auto flex gap-[4rem] py-6 mt-[70px]">
        <div class="w-2/3 pl-[4rem] flex flex-col items-start justify-center">
            <h1 class="text-4xl mb-2">Meet The Founder</h1>
            <p>Born in Pahang in 1965, Hafiz Syahrin had a deep passion for technology and gaming from an early age. After earning a degree in Computer Science, he built a successful career in banking, modernizing financial systems as a Project Director.</p>
            <p>Despite his achievements, Hafiz longed for something more creative. Inspired by Japanese gaming giants, he left his stable job in 1994 and founded KZLab, initially as a tech solutions firm. Over time, he recognized the potential of Malaysia’s gaming industry and pivoted KZLab into digital game development, determined to bring local talent to the global stage.</p>
        </div>
        <div class="w-1/3">
            <asp:Image ID="Image1" CssClass="rounded-[5px]" ImageUrl="~/Public/About/founder.png" runat="server" />
        </div>
    </div>
    <div class="w-[1000px] mx-auto flex flex-row-reverse gap-[4rem] py-6 mt-[70px]">
        <div class="w-2/3 pl-[4rem] flex flex-col items-start justify-center">
            <h1 class="text-4xl mb-2">The Rise of Omoshiro</h1>
            <p>In 2012, Hafiz officially rebranded KZLab’s gaming division as Omoshiro, meaning “fun” and “interesting” in Japanese—a perfect reflection of its mission. The studio started small, focusing on digital game distribution before venturing into game development. Its first major hit was a mobile strategy game that gained traction in Southeast Asia, proving that local developers could compete globally.</p>
            <p>Over time, Omoshiro expanded into different genres, from action-adventure to simulation games, catering to a diverse audience. The company also embraced the rise of cloud gaming and digital storefronts, ensuring seamless access to their games across various platforms.</p>
        </div>
        <div class="">
            <asp:Image ID="Image2" CssClass="h-[300px] aspect-[1536/1024] rounded-[5px]" ImageUrl="~/Public/About/Office.png" runat="server" />
        </div>
    </div>
    <div class="w-[1000px] mx-auto flex gap-[4rem] py-6 mt-[70px]">
        <div class="w-2/3 pl-[4rem] flex flex-col items-start justify-center">
            <h1 class="text-4xl mb-2">Partnerships & Affiliates</h1>
            <p>To solidify its presence in the industry, Omoshiro formed strategic partnerships with established game studios and tech giants. By collaborating with international developers, they gained access to cutting-edge tools and broadened their reach.</p>
            <p>In addition to partnerships, the company actively supported indie developers by providing funding and distribution channels, fostering a thriving gaming ecosystem in Malaysia. Their affiliate programs allowed streamers and content creators to showcase Omoshiro’s games, boosting their visibility and strengthening their brand.</p>
        </div>
        <div class="w-[300px] grid grid-cols-2 grid-rows-2 gap-5 items-center">
            <asp:Image ID="Image7" CssClass="w-full rounded-[5px]" ImageUrl="~/Public/About/logitech.png" runat="server" />
            <asp:Image ID="Image5" CssClass="w-full rounded-[5px]" ImageUrl="~/Public/About/crowdstrike.png" runat="server" />
            <asp:Image ID="Image3" CssClass="w-full rounded-[5px]" ImageUrl="~/Public/About/lenovo.png" runat="server" />
            <asp:Image ID="Image6" CssClass="w-full rounded-[5px]" ImageUrl="~/Public/About/maybank.png" runat="server" />
        </div>
    </div>
    <div class="w-[1000px] mx-auto flex flex-row-reverse gap-[4rem] py-6 mt-[70px]">
        <div class="w-2/3 pl-[4rem] flex flex-col items-start justify-center">
            <h1 class="text-4xl mb-2">Global Success</h1>
            <p>By the late 2010s, Omoshiro had become a recognizable name in the digital gaming industry, competing in the Southeast Asian and global markets. With a strong presence in mobile and PC gaming, KZLab secured a substantial market share, attracting both casual and competitive gamers.</p>
            <p>Their success was further reinforced by acquisitions and expansions into game publishing, solidifying their reputation as a leader in the digital gaming space. The company’s ability to adapt to evolving gaming trends, such as virtual reality and AI-driven experiences, kept them at the forefront of innovation.</p>
        </div>
        <div class="">
            <asp:Image ID="Image4" CssClass="h-[300px] aspect-[1536/1024] rounded-[5px]" ImageUrl="~/Public/About/reception.png" runat="server" />
        </div>
    </div>
</asp:Content>

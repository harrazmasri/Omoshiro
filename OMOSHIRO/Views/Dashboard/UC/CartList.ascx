<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartList.ascx.cs" Inherits="OMOSHIRO.Views.Dashboard.UC.CartList" %>

<asp:Repeater ID="CartRepeater" runat="server">
    <HeaderTemplate>
        <div class="w-full">
    </HeaderTemplate>

    <ItemTemplate>
        <div class="w-full flex items-center gap-5">
            <a class="grow" href='<%# ResolveUrl("~/Views/Dashboard/ProductView.aspx?title=" + Eval("Title")) %>'>
                <div class="relative w-full overflow-clip flex gap-5 group hover:backdrop-brightness-90 py-2 px-3 rounded-lg">
                    <div class="w-[200px] aspect-[460/215] rounded-lg overflow-clip">
                        <asp:Image ID="Image1" CssClass="z-0 mb-3 top-0 left-0 w-full group-hover:scale-110 transition duration-500 brightness-50 group-hover:brightness-75" ImageUrl='<%# ResolveUrl(Eval("Image").ToString()) %>' runat="server" />
                    </div>
                    <div class="flex justify-between items-center grow">
                        <div class="z-10 text-xl w-1/2">
                            <asp:Label ID="GameTitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                        </div>
                        <div class="z-10 w-1/2 flex justify-end">
                            RM&nbsp;
                            <asp:Label ID="GamePrice" runat="server" Text='<%# Eval("Price", "{0:N2}") %>' CssClass="text-xl"></asp:Label>
                        </div>
                    </div>
                </div>
            </a>
            
            <asp:LinkButton ID="RemoveFromCart" OnClick="RemoveFromCart_Click" runat="server">
                <div class="my-auto hover:bg-slate-950 rounded-full w-[30px] h-[30px] flex items-center justify-center">
                    <asp:Image class="invert w-[20px]" ImageUrl="~/Public/Icon/x.svg" runat="server"></asp:Image>
                </div>
            </asp:LinkButton>
        </div>
    </ItemTemplate>

    <FooterTemplate>
        </div>
    </FooterTemplate>
</asp:Repeater>
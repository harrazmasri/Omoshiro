<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Dashboard.Master" AutoEventWireup="true" CodeBehind="InvoicePage.aspx.cs" Inherits="OMOSHIRO.Views.Dashboard.InvoicePage" %>
<asp:Content ContentPlaceHolderID="title" runat="server">
    Omoshiro - Category
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="DashboardPlaceholder" runat="server">
    
    <div class="w-full px-[7rem] mb-7 mt-[70px] py-6">
        <asp:HyperLink ID="HyperLink1" CssClass="mb-2 text-gray-300 text-sm hover:brightness-50" NavigateUrl="~/Views/Dashboard/Profile.aspx" runat="server">< Go Back</asp:HyperLink>
        <h1 class="text-4xl mb-5">Invoice Details</h1>
        
        <div class="aspect-[4/3] w-2/3 rounded bg-white py-[5%] px-[5%] text-black font-[arial]">
            <div class="flex justify-between items-end border-b pb-5 mb-5">
                <h2 class="text-4xl">Invoice</h2>
                <p>Order No: <asp:Label ID="InvoiceIdLabel" runat="server" Text="-"></asp:Label></p>
            </div>
            <p class="mb-2">This is a system-generated invoice outlining the summary of services rendered and/or goods provided as per the mutual agreement between both parties. The invoice includes applicable charges, terms, and regulatory considerations in accordance with relevant commercial standards.</p>
            <p class="mb-2">All amounts are calculated based on current rates, applicable taxes, and standard service terms. By proceeding with payment, the client acknowledges the accuracy of the listed items and agrees to the conditions specified herein.</p>
            <p class="mb-2">Please note that this invoice is subject to our general terms and conditions, privacy policy, and applicable jurisdictional regulations. Any discrepancies or queries should be reported within seven (7) business days from the date of issue. Delayed payments may incur additional charges as stipulated under our late payment policy.</p>
            
            <asp:Table ID="InvoiceTable" runat="server" CssClass="mb-5">
                <asp:TableRow>
                    <asp:TableHeaderCell CssClass="text-left pr-5">Date Purchased: </asp:TableHeaderCell>
                    <asp:TableCell  CssClass="text-left">
                        <asp:Label ID="PurchasedDate" runat="server" Text="-"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableHeaderCell CssClass="text-left pr-5">Paid Amount: </asp:TableHeaderCell>
                    <asp:TableCell  CssClass="text-left">
                        RM <asp:Label ID="PurchasedAmount" runat="server" Text="-"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <h5 class="font-bold mb-2">Purchased Items:</h5>
            <asp:Repeater ID="ProductRepeater" runat="server">
                <HeaderTemplate>
                    <div class="grid grid-cols-1 grid-flow-row auto-cols-max gap-4">
                </HeaderTemplate>

                <ItemTemplate>
                    <a href='<%# ResolveUrl("~/Views/Dashboard/ProductView.aspx?title=" + Eval("Title")) %>'>
                        <div class="relative flex items-center gap-5 w-full overflow-clip group">
                            <img class="z-0 mb-3 top-0 left-0 w-[100px]"
                                    src='<%# ResolveUrl(Eval("Image").ToString()) %>' />
                            <div class="flex grow items-center">
                                <div class="z-10 w-1/2"><%# Eval("Title") %></div>
                                <div class="z-10 w-1/2 flex justify-end">RM <%# Eval("Price") %></div>
                            </div>
                        </div>
                    </a>
                </ItemTemplate>

                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

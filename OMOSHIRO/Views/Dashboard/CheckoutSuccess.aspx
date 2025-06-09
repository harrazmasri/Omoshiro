<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckoutSuccess.aspx.cs" Inherits="OMOSHIRO.Views.CheckoutSuccess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Omoshiro - You've made a purchase</title>
    <link href="~/Src/Style/Styling.css" rel="stylesheet" type="text/css" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="w-full h-screen flex items-center justify-center">
            <div class="flex justify-center flex-col">
                <asp:Image ID="Image1" CssClass="w-[150px] mx-auto invert animate-pulse" ImageUrl="~/Public/Icon/check.svg" runat="server" />
                <h1 class="text-3xl font-bold text-center mt-5">Checkout Successful!</h1>
                <p class="text-center text-slate-500">Thank you for your purchase. Your order has been successfully processed.</p>
                <p class="text-center text-slate-500">You can view your order details in your profile.</p>
                <div class="w-full flex gap-4 justify-center mt-5">
                    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Views/Dashboard/Profile.aspx" CssClass="flex items-center gap-2 border-[2px] border-purple-800 bg-purple-800 text-white hover:brightness-75 rounded py-2 px-4 transition" runat="server">
                        <asp:Image ID="Image3" ImageUrl="~/Public/Icon/user.svg" CssClass="w-[15px] invert" runat="server" />
                        Check In Profile
                    </asp:HyperLink>
                    <asp:HyperLink ID="HyperLink2" NavigateUrl="~/Views/Dashboard/Store.aspx" CssClass="flex items-center gap-2 border-[2px] border-purple-800 hover:bg-purple-800 text-white hover:brightness-75 rounded py-2 px-4 transition" runat="server">
                        <asp:Image ID="Image2" ImageUrl="~/Public/Icon/shopping-bag.svg" CssClass="w-[15px] invert" runat="server" />
                        Continue Browsing
                    </asp:HyperLink>
                </div>
            </div>
        </div>

        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Path="~/Src/Script/tailwind.js" />
            </Scripts>
        </asp:ScriptManager>
    </form>
</body>
</html>

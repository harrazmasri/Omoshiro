<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DashboardAdmin.Master" AutoEventWireup="true" CodeBehind="ProductTable.aspx.cs" Inherits="OMOSHIRO.Views.Admin.ProductTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Omoshiro - Add Product
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <style>
        body {
            background-color: #1b2838;
            font-family: 'Segoe UI', sans-serif;
            color: #c7d5e0;
            margin: 0;
            padding: 20px;

        }
        
        h2 {
            color: #ffffff;
            margin-top: 20px;
            margin-bottom: 20px;
            margin-left: 25px;
            margin-right: 25px;

        }

        .steam-grid {
            width: 100%;
            border-collapse: collapse;
            border-radius: 6px;
            overflow: hidden;
            box-shadow: 0 2px 6px rgba(0,0,0,0.3);
            margin-left: 10px;
            margin-right: 10px;
        }

        .steam-grid th {
            background-color: #171a21;
            color: #66c0f4;
            font-weight: bold;
            padding: 12px 20px;
            text-align: left;
            font-size: 14px;
            border-bottom: 1px solid #000;
        }

        .steam-grid td {
            padding: 12px 10px;
            font-size: 14px;
            color: #c7d5e0;
            border-bottom: 1px solid #000;
            vertical-align: middle;

        }

        .steam-grid tr:nth-child(even) {
            background-color: #1b2838;
        }

        .steam-grid tr:hover {
            background-color: #30485b;
        }

        .steam-grid img {
            border-radius: 4px;
            width: 100px;
            height: 60px;
            object-fit: cover;
            box-shadow: 0 0 4px rgba(0,0,0,0.4);
        }

        /* Edit/Delete link styling */
        .actions a {
            margin-right: 10px;
            color: #66c0f4;
            text-decoration: none;
            font-weight: bold;
        }

        .actions a:hover {
            text-decoration: underline;
            color: #ffffff;
        }
    </style>
   
    <div class="">
        
        <div class="flex justify-between">
            <h2 class="text-2xl font-bold mb-4 text-white">Game Product</h2>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Views/Admin/addproduct.aspx" CssClass="hover:cursor-pointer bg-purple-600 hover:bg-purple-700 text-white px-4 py-2 rounded">Add Product</asp:HyperLink>
            
        </div>

        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CssClass="steam-grid" AllowSorting="True">
            <Columns>
                
                <asp:BoundField DataField="gameID" HeaderText="" SortExpression="gameID" ReadOnly="True" Visible="True"/>
                
                <asp:TemplateField HeaderText="Thumbnail">
                    <ItemTemplate>
                        <asp:Image ID="imgThumbnail" runat="server" 
                           ImageUrl='<%# ResolveUrl(Eval("gameDirectory").ToString()+ Eval("gameThumbnail").ToString()) %>' 
                           Width="100px" Height="60px" />
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField DataField="gameTitle" HeaderText="Game Title" SortExpression="gameTitle" />
                <asp:BoundField DataField="gameDesc" HeaderText="Game Description" SortExpression="gameDesc" />
                <asp:BoundField DataField="gamePrice" HeaderText="Game Price" SortExpression="gamePrice" />
                <asp:BoundField DataField="gameReq" HeaderText="Game Requirement" SortExpression="gameReq" />
                <asp:BoundField DataField="gameisActive" HeaderText="Game is Active" SortExpression="gameisActive" />
                <asp:BoundField DataField="gameDirectory" HeaderText="Game Directory" SortExpression="gameDirectory" />
                

                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Actions" ItemStyle-CssClass="actions"/>
                

            </Columns>
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [GameProduct]" DeleteCommand="DELETE FROM [GameProduct] WHERE [gameID] = @gameID" InsertCommand="INSERT INTO [GameProduct] ([gameTitle], [gameDesc], [gamePrice], [gameReq], [gameisActive], [gameDirectory], [gameThumbnail]) VALUES (@gameTitle, @gameDesc, @gamePrice, @gameReq, @gameisActive, @gameDirectory, @gameThumbnail)" UpdateCommand="UPDATE [GameProduct] SET [gameTitle] = @gameTitle, [gameDesc] = @gameDesc, [gamePrice] = @gamePrice, [gameReq] = @gameReq, [gameisActive] = @gameisActive, [gameDirectory] = @gameDirectory, [gameThumbnail] = @gameThumbnail WHERE [gameID] = @gameID">
            <DeleteParameters>
                <asp:Parameter Name="gameID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="gameTitle" Type="String" />
                <asp:Parameter Name="gameDesc" Type="String" />
                <asp:Parameter Name="gamePrice" Type="Decimal" />
                <asp:Parameter Name="gameReq" Type="String" />
                <asp:Parameter Name="gameisActive" Type="Boolean" />
                <asp:Parameter Name="gameDirectory" Type="String" />
                <asp:Parameter Name="gameThumbnail" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="gameTitle" Type="String" />
                <asp:Parameter Name="gameDesc" Type="String" />
                <asp:Parameter Name="gamePrice" Type="Decimal" />
                <asp:Parameter Name="gameReq" Type="String" />
                <asp:Parameter Name="gameisActive" Type="Boolean" />
                <asp:Parameter Name="gameDirectory" Type="String" />
                <asp:Parameter Name="gameThumbnail" Type="String" />
                <asp:Parameter Name="gameID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>


    </div>

</asp:Content>



using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OMOSHIRO.Views.Dashboard.UC
{
    public partial class CartList : System.Web.UI.UserControl
	{
        public class Product
        {
            public int GameId { get; set; }
            public string Title { get; set; }
            public decimal Price { get; set; }
            public string Image { get; set; }
            public string Description { get; set; }
            public string Requirement { get; set; }
            public string Category { get; set; }

        }

        public decimal totalAmount = 0;

        protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                loadCart();
            }
        }

        protected void loadCart()
        {
            CartRepeater.DataSource = null;
            CartRepeater.DataBind();

            List<Product> fetchedProducts = new List<Product>();

            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // fetch product details
                string query = @"SELECT 
                        Cart.GameProductId,
                        Cart.UserId,
                        GameProduct.gameID,
                        GameProduct.gameTitle,
                        GameProduct.gamePrice,
                        GameProduct.gameDirectory,
                        GameProduct.gameThumbnail,
                        GameProduct.gameDesc,
                        GameProduct.gameReq,
                        GameProduct.gameCategory
                        FROM GameProduct
                        INNER JOIN Cart
                        ON GameProduct.gameID = Cart.GameProductId
                        WHERE Cart.UserId = @userId;";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["LoggedUserId"]));

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    fetchedProducts.Add(new Product
                    {
                        GameId = Convert.ToInt32(reader["gameID"]),
                        Title = reader["gameTitle"].ToString(),
                        Price = Convert.ToDecimal(reader["gamePrice"]),
                        Image = reader["gameDirectory"].ToString() + reader["gameThumbnail"].ToString(),
                        Description = reader["gameDesc"].ToString(),
                        Requirement = reader["gameReq"].ToString(),
                        Category = reader["gameCategory"].ToString()
                    });

                    addPrice(Convert.ToDecimal(reader["gamePrice"]));

                    CartRepeater.DataSource = fetchedProducts;
                    CartRepeater.DataBind();
                }

                Session["IsCartEmpty"] = fetchedProducts.Count == 0 ? "1" : "0";

                conn.Close();
            }

            updateTotalAmount();
        }

        private void addPrice(decimal price)
        {
            totalAmount += price;
        } 

        private void updateTotalAmount()
        {
            if (Page is Cart)
            {
                bool isCartEmpty = Session["IsCartEmpty"] != null && Session["IsCartEmpty"].ToString() == "1";
                ((Cart)Page).updateTotalAmount(totalAmount, isCartEmpty);
            }
        }

        protected void RemoveFromCart_Click(object sender, CommandEventArgs e)
        {
            string gameId = e.CommandArgument.ToString();
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    // delete from cart
                    string query = @"DELETE FROM Cart WHERE UserId = @userId AND GameProductId = @gameProductId;";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["LoggedUserId"]));
                    cmd.Parameters.AddWithValue("@gameProductId", gameId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    loadCart();
                }

            }
            catch (Exception exception)
            {
                errorMessage.Text = "Error removing item from cart: " + exception.Message;
            }
        }
    }
}
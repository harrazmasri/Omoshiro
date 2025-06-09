using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OMOSHIRO.Views.Dashboard
{
    public partial class Cart : System.Web.UI.Page
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

        public class Invoice
        {
            public int Id { get; set; }
            public DateTime PurchasedDate { get; set; }
            public decimal PurchasedAmount { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
		{

        }

        public void updateTotalAmount(decimal totalAmount, Boolean isCartEmpty)
        {
            ViewState["purchasedTotalAmount"] = totalAmount;
            TotalAmountLabel.Text = totalAmount.ToString("N2");

            if (isCartEmpty)
            {
                CheckoutButton.Enabled = false;
                LowBalanceLabel.Text = "Cart is empty :(";
            }

            if (Convert.ToDecimal(Session["loggedBalance"]) < totalAmount)
            {
                CheckoutButton.Enabled = false;
                LowBalanceLabel.Text = "Your wallet balance is low. :(";
            }
        }

        protected void CheckoutButton_Click(object sender, EventArgs e)
        {
            Invoice createdInvoice = new Invoice();
            List<Product> fetchedProducts = new List<Product>();
            int loggedUserId = Convert.ToInt32(Session["loggedUserId"]);

            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Step 1: Fetch cart items
                string selectQuery = @"
                    SELECT 
                        Cart.GameProductId,
                        GameProduct.gameID,
                        GameProduct.gameTitle,
                        GameProduct.gamePrice,
                        GameProduct.gameDirectory,
                        GameProduct.gameThumbnail,
                        GameProduct.gameDesc,
                        GameProduct.gameReq,
                        GameProduct.gameCategory
                    FROM GameProduct
                    INNER JOIN Cart ON GameProduct.gameID = Cart.GameProductId
                    WHERE Cart.UserId = @userId";

                using (SqlCommand cmd = new SqlCommand(selectQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@userId", loggedUserId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
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
                        }
                    }
                }

                // Step 2: Remove items from cart AFTER reader is closed
                string deleteQuery = "DELETE FROM Cart WHERE UserId = @userId";
                using (SqlCommand deleteCmd = new SqlCommand(deleteQuery, conn))
                {
                    deleteCmd.Parameters.AddWithValue("@userId", loggedUserId);
                    deleteCmd.ExecuteNonQuery();
                }

                // Step 3: Create invoice
                string invoiceQuery = @"
                    INSERT INTO Invoices (OrderId, PurchasedDate, PurchasedAmount, UserId)
                    VALUES (@orderId, @purchasedDate, @purchasedAmount, @userId);
                    SELECT SCOPE_IDENTITY();";

                using (SqlCommand invoiceCmd = new SqlCommand(invoiceQuery, conn))
                {
                    invoiceCmd.Parameters.Clear();
                    invoiceCmd.Parameters.AddWithValue("@orderId", "invoice_"+StringGenerator(10)+"_OMOSHIRO");
                    invoiceCmd.Parameters.AddWithValue("@purchasedAmount", ViewState["purchasedTotalAmount"]);
                    invoiceCmd.Parameters.AddWithValue("@userId", loggedUserId);
                    invoiceCmd.Parameters.AddWithValue("@purchasedDate", DateTime.Now);

                    createdInvoice = new Invoice
                    {
                        Id = Convert.ToInt32(invoiceCmd.ExecuteScalar()),
                        PurchasedDate = DateTime.Now,
                        PurchasedAmount = Convert.ToDecimal(ViewState["purchasedTotalAmount"])
                    };
                }

                // Step 4: Insert into Orders
                string insertQuery = @"
                    INSERT INTO Orders (gameProductId, userId, purchasedDate, invoiceId)
                    VALUES (@gameProductId, @userId, @purchasedDate, @invoiceId)";

                using (SqlCommand insertCmd = new SqlCommand(insertQuery, conn))
                {
                    foreach (Product product in fetchedProducts)
                    {
                        insertCmd.Parameters.Clear();
                        insertCmd.Parameters.AddWithValue("@gameProductId", product.GameId);
                        insertCmd.Parameters.AddWithValue("@userId", loggedUserId);
                        insertCmd.Parameters.AddWithValue("@purchasedDate", DateTime.Now);
                        insertCmd.Parameters.AddWithValue("@invoiceId", createdInvoice.Id);

                        insertCmd.ExecuteNonQuery();
                    }
                }

                // Step 5: Deduct balance
                string deductQuery = @"UPDATE Users SET balance = balance - @purchasedAmount WHERE Id = @userId";

                using (SqlCommand deductCmd = new SqlCommand(deductQuery, conn))
                {
                    deductCmd.Parameters.AddWithValue("@purchasedAmount", ViewState["purchasedTotalAmount"]);
                    deductCmd.Parameters.AddWithValue("@userId", loggedUserId);
                    deductCmd.ExecuteNonQuery();
                }


                conn.Close();
            }

            Server.Transfer("~/Views/Dashboard/CheckoutSuccess.aspx");
        }

        protected string StringGenerator(int stringlen)
        {
            Random rand = new Random();
            char[] chars = new char[stringlen];
            for (int i = 0; i < stringlen; i++)
            {
                chars[i] = (char)(rand.Next(0, 26) + 65);
            }
            return new string(chars);
        }
    }
}
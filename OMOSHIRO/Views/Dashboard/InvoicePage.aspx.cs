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
	public partial class InvoicePage : System.Web.UI.Page
	{
        public class Product
        {
            public string Title { get; set; }
            public decimal Price { get; set; }
            public string Image { get; set; }
        }

        public class Invoice
        {
            public int Id { get; set; }
            public string OrderId { get; set; }
            public DateTime PurchasedDate { get; set; }
            public decimal PurchasedAmount { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
		{
            string invoiceId = Request.QueryString["id"];
            Invoice invoice = new Invoice();
            List<Product> products = new List<Product>();

            // get invoice
            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT * FROM Invoices WHERE OrderId=@invoiceId;";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@invoiceId", invoiceId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    invoice = new Invoice
                    {
                        Id = Convert.ToInt32(reader["Id"]),
                        OrderId = reader["OrderId"].ToString(),
                        PurchasedDate = Convert.ToDateTime(reader["PurchasedDate"]),
                        PurchasedAmount = Convert.ToDecimal(reader["PurchasedAmount"])
                    };
                }
                conn.Close();
            }

            // get purchased products            
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT 
                    GameProduct.gameTitle, 
                    GameProduct.gamePrice, 
                    GameProduct.gameDirectory, 
                    GameProduct.gameThumbnail 
                    FROM Orders
                    INNER JOIN GameProduct
                    ON GameProduct.gameID = Orders.gameProductId
                    WHERE GameProduct.gameisActive = 1 
                    AND Orders.invoiceId = @invoiceId  
                    ORDER BY gameID DESC";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@invoiceId", invoice.Id);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    products.Add(new Product
                    {
                        Title = reader["gameTitle"].ToString(),
                        Price = Convert.ToDecimal(reader["gamePrice"]),
                        Image = reader["gameDirectory"].ToString() + reader["gameThumbnail"].ToString()
                    });
                }
            }

            InvoiceIdLabel.Text = invoice.OrderId.ToString();
            PurchasedAmount.Text = invoice.PurchasedAmount.ToString("N2");
            PurchasedDate.Text = invoice.PurchasedDate.ToString();

            ProductRepeater.DataSource = products;
            ProductRepeater.DataBind();
        }
	}
}
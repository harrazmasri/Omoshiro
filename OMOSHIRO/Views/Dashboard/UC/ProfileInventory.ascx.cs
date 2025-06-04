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
    public partial class ProfileInventory : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                InventoryRepeater.DataSource = null;
                InventoryRepeater.DataBind();

                List<Product> products = new List<Product>();
                string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"
                        SELECT 
                        GameProduct.gameTitle, 
                        GameProduct.gamePrice, 
                        GameProduct.gameDirectory, 
                        GameProduct.gameThumbnail 
                        FROM GameProduct 
                        INNER JOIN Orders ON GameProduct.gameID = Orders.gameProductId
                        WHERE GameProduct.gameisActive = 1 
                        AND Orders.userId = @userId
                        ORDER BY Orders.Id DESC;
                    ";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@userId", Session["loggedUserId"]);

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

                InventoryRepeater.DataSource = products;
                InventoryRepeater.DataBind();
            }
        }
	}
}
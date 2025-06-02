using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OMOSHIRO.Views.Dashboard.UC
{
    public class Product
    {
        public string Title { get; set; }
        public decimal Price { get; set; }
        public string Image { get; set; }
    }

    public partial class GridLayout : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                List<Product> products = new List<Product>();
                string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT gameTitle, gamePrice, gameDirectory, gameThumbnail FROM GameProduct WHERE gameisActive = 1 ORDER BY gameID DESC";
                    SqlCommand cmd = new SqlCommand(query, conn);

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

                rptProducts.DataSource = products;
                rptProducts.DataBind();
            }
        }
	}
}
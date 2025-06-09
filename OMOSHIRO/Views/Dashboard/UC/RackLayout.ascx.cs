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
	public partial class RackLayout : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                List<Product> products = new List<Product>();
                string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT TOP 3 gameID, gameTitle, gamePrice, gameDirectory, gameThumbnail FROM GameProduct WHERE gameisActive = 1 ORDER BY NEWID()";
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

                RackRepeater.DataSource = products;
                RackRepeater.DataBind();
            }
        }

	}
}
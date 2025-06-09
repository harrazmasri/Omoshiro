using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OMOSHIRO.Views.Dashboard
{
    [Serializable]
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

    public class Gallery
    {
        public string directory { get; set; }
        public string fileName { get; set; }
        public string GameProductId { get; set; }
    }

    public partial class ProductView : System.Web.UI.Page
	{
        public Product CurrentProduct
        {
            get { return ViewState["CurrentProduct"] as Product; }
            set { ViewState["CurrentProduct"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string parameter = Request.QueryString["Title"];
                if (string.IsNullOrEmpty(parameter))
                {
                    // Optionally redirect or show error
                    GameTitle.Text = "Invalid product title.";
                    return;
                }

                Product fetchedProduct = new Product();
                List<Gallery> fetchedGallery = new List<Gallery>();
                
                string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    // fetch product details
                    string query = "SELECT * FROM GameProduct WHERE gameTitle = @title";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@title", parameter);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        fetchedProduct = new Product
                        {
                            GameId = Convert.ToInt32(reader["gameID"]),
                            Title = reader["gameTitle"].ToString(),
                            Price = Convert.ToDecimal(reader["gamePrice"]),
                            Image = reader["gameDirectory"].ToString() + reader["gameThumbnail"].ToString(),
                            Description = reader["gameDesc"].ToString(),
                            Requirement = reader["gameReq"].ToString(),
                            Category = reader["gameCategory"].ToString()
                        };

                        ViewState["CurrentProduct"] = fetchedProduct;
                    }
                    conn.Close();

                    // fetch gallery
                    string galleryQuery = "SELECT * FROM Gallery WHERE GameProductId=@gameId";
                    SqlCommand galleryCmd = new SqlCommand(galleryQuery, conn);
                    galleryCmd.Parameters.AddWithValue("@gameId", fetchedProduct.GameId);
                    conn.Open();
                    SqlDataReader galleryReader = galleryCmd.ExecuteReader();

                    while (galleryReader.Read())
                    {
                        fetchedGallery.Add(new Gallery
                        {
                            directory = galleryReader["directory"].ToString(),
                            fileName = galleryReader["fileName"].ToString(),
                            GameProductId = galleryReader["GameProductId"].ToString()
                        });
                    }
                    conn.Close();
                }

                GameTitle.Text = fetchedProduct.Title;
                GameDescription.Text = fetchedProduct.Description;
                GamePrice.Text = fetchedProduct.Price.ToString("F2");
                GameImage.ImageUrl = fetchedProduct.Image;
                GameRequirement.Text = fetchedProduct.Requirement;

                CategoryRepeater.DataSource = extractCategories(fetchedProduct.Category);
                CategoryRepeater.DataBind();

                GalleryRepeater.DataSource = fetchedGallery;
                GalleryRepeater.DataBind();
            }
        }

        protected List<string> extractCategories(string categoryString)
        {
            if (string.IsNullOrWhiteSpace(categoryString))
                return new List<string>();

            List<string> split = categoryString
                .Replace('_', ' ')
                .Split(',')
                .Select(c => c.Trim())
                .Where(c => !string.IsNullOrEmpty(c))
                .ToList();

            split.Reverse();

            return split;
        }

        protected void CartButton_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // fetch product details
                string query = "INSERT INTO Cart (GameProductId, UserId) VALUES (@GameProductId, @UserId);";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@GameProductId", Convert.ToInt32(CurrentProduct.GameId));
                cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(Session["LoggedUserId"]));
                conn.Open();

                int execution = cmd.ExecuteNonQuery();

                if (execution > 0)
                {
                    CartButtonLabel.Text = "Added to Cart";
                }

                conn.Close();
            }
        }
    }
}
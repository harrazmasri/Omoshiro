using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OMOSHIRO.Views.Admin
{
    public class Product
    {
        public string Title { get; set; }
        public decimal Price { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }
        public string Requirement { get; set; }
        public string Category { get; set; }
        public string IsActive { get; set; }
    }

    public partial class editproduct : System.Web.UI.Page
    {
        // Use ViewState to persist GameID across postbacks
        protected int GameID
        {
            get
            {
                object o = ViewState["GameID"];
                return (o == null) ? 0 : (int)o;
            }
            set
            {
                ViewState["GameID"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string parameter = Request.QueryString["GameID"];
                if (!int.TryParse(parameter, out int gameIdFromQuery))
                {
                    lblMessage.Text = "Invalid GameID";
                    return;
                }
                GameID = gameIdFromQuery;

                Product fetchedProduct = new Product();
                string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT * FROM GameProduct WHERE gameID = @gameID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@gameID", GameID);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        fetchedProduct = new Product
                        {
                            Title = reader["gameTitle"].ToString(),
                            Price = Convert.ToDecimal(reader["gamePrice"]),
                            Image = reader["gameDirectory"].ToString() + reader["gameThumbnail"].ToString(),
                            Description = reader["gameDesc"].ToString(),
                            Requirement = reader["gameReq"].ToString(),
                            Category = reader["gameCategory"].ToString(),
                            IsActive = reader["gameisActive"].ToString()
                        };
                    }
                }

                txtTitle.Text = fetchedProduct.Title;
                txtDesc.Text = fetchedProduct.Description;
                txtPrice.Text = fetchedProduct.Price.ToString("F2");
                thumbnail.ImageUrl = fetchedProduct.Image;
                txtReq.Text = fetchedProduct.Requirement;
                chkIsActive.Checked = fetchedProduct.IsActive == "1" || fetchedProduct.IsActive.ToLower() == "true";

                // Select categories in GenreListBox
                foreach (ListItem item in GenreListBox.Items)
                {
                    foreach (string category in extractCategories(fetchedProduct.Category))
                    {
                        if (category == item.Value.Replace("_", " "))
                        {
                            item.Selected = true;
                        }
                    }
                }
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

        protected void EditButton(object sender, EventArgs e)
        {
            // Use persisted GameID
            if (GameID <= 0)
            {
                lblMessage.Text = "Invalid GameID";
                return;
            }

            string directory = "/Storage/Images/Thumbnails/";
            string galleryDirectory = "/Storage/Images/Gallery/";
            string thumbnailFileName = "";

            string title = txtTitle.Text.Trim();
            string desc = txtDesc.Text.Trim();
            string priceText = txtPrice.Text.Trim();
            string req = txtReq.Text.Trim();
            bool isActive = chkIsActive.Checked;

            // Gather selected genres
            string selectedGenres = string.Join(",", GenreListBox.Items.Cast<ListItem>()
                                                .Where(i => i.Selected)
                                                .Select(i => i.Value));

            // Validation
            if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(desc) || string.IsNullOrEmpty(priceText) || string.IsNullOrEmpty(req))
            {
                lblMessage.Text = "All fields are required.";
                return;
            }

            if (!decimal.TryParse(priceText, out decimal price))
            {
                lblMessage.Text = "Invalid price format.";
                return;
            }

            // Handle thumbnail upload if any
            if (fuThumbnail.HasFile)
            {
                string fileName = StringGenerator(10) + Path.GetExtension(fuThumbnail.FileName).ToLower();
                string savePath = Server.MapPath("~" + directory) + fileName;
                fuThumbnail.SaveAs(savePath);
                thumbnailFileName = fileName;

                // Update thumbnail separately
                try
                {
                    string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        string query = @"
                            UPDATE GameProduct
                            SET gameDirectory = @directory,
                                gameThumbnail = @thumbnail
                            WHERE GameID = @gameId;";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@gameId", GameID);
                            cmd.Parameters.AddWithValue("@directory", directory);
                            cmd.Parameters.AddWithValue("@thumbnail", thumbnailFileName);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error saving thumbnail: " + ex.Message;
                    return; // stop further processing
                }

                lblMessage.CssClass = "text-success";
                lblMessage.Text = $"{title} updated successfully!";
            }

            // Update main product info
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"
                        UPDATE GameProduct
                        SET gameTitle = @title,
                            gameDesc = @desc,
                            gamePrice = @price,
                            gameReq = @req,
                            gameisActive = @active,
                            gameCategory = @category
                        WHERE GameID = @gameId";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@gameId", GameID);
                        cmd.Parameters.AddWithValue("@title", title);
                        cmd.Parameters.AddWithValue("@desc", desc);
                        cmd.Parameters.AddWithValue("@price", price);
                        cmd.Parameters.AddWithValue("@req", req);
                        cmd.Parameters.AddWithValue("@active", isActive ? 1 : 0);
                        cmd.Parameters.AddWithValue("@category", selectedGenres);

                        conn.Open();
                        int rows = cmd.ExecuteNonQuery();

                        if (rows == 0)
                        {
                            lblMessage.Text = "No record updated - check the GameID.";
                            return;
                        }
                    }
                }

                lblMessage.CssClass = "text-success";
                lblMessage.Text = $"{title} updated successfully!";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error updating product: " + ex.Message;
                return;
            }

            // Save gallery files if any
            if (fuGallery.HasFiles)
            {
                foreach (HttpPostedFile file in fuGallery.PostedFiles)
                {
                    string galleryFileName = StringGenerator(10) + Path.GetExtension(file.FileName).ToLower();
                    string savePath = Server.MapPath("~" + galleryDirectory) + galleryFileName;
                    file.SaveAs(savePath);

                    try
                    {
                        string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                        using (SqlConnection conn = new SqlConnection(connStr))
                        {
                            string query = "INSERT INTO Gallery (directory, fileName, GameProductId) " +
                                            "VALUES (@directory, @fileName, @GameProductId)";

                            using (SqlCommand cmd = new SqlCommand(query, conn))
                            {
                                cmd.Parameters.AddWithValue("@directory", galleryDirectory);
                                cmd.Parameters.AddWithValue("@fileName", galleryFileName);
                                cmd.Parameters.AddWithValue("@GameProductId", GameID);

                                conn.Open();
                                cmd.ExecuteNonQuery();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error saving gallery image: " + ex.Message;
                        return;
                    }
                }

                lblMessage.CssClass = "text-success";
                lblMessage.Text = $"{title} updated successfully!";
            }

            Response.Redirect(Request.RawUrl);
        }

        protected string StringGenerator(int stringlen)
        {
            Random rand = new Random();
            char letter;
            string str = "";
            for (int i = 0; i < stringlen; i++)
            {
                letter = Convert.ToChar(rand.Next(0, 26) + 65);
                str += letter;
            }
            return str;
        }
    }
}

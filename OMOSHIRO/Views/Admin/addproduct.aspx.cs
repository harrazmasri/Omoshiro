using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OMOSHIRO.Views.Admin
{
    public partial class addproduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // No special logic on load for add page
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            // Directories for files
            string directory = "/Storage/Images/Thumbnails/";
            string galleryDirectory = "/Storage/Images/Gallery/";

            // Variables for form values
            string thumbnail = "";
            string title = txtTitle.Text.Trim();
            string desc = txtDesc.Text.Trim();
            string priceText = txtPrice.Text.Trim();
            string req = txtReq.Text.Trim();
            bool isActive = chkIsActive.Checked;
            string selectedGenres = "";

            int GameProductId = 0;

            // Validate thumbnail upload
            if (!fuThumbnail.HasFile)
            {
                lblMessage.Text = "Please upload a thumbnail image.";
                return;
            }

            // Save thumbnail file
            try
            {
                string fileName = StringGenerator(10) + Path.GetExtension(fuThumbnail.FileName).ToLower();
                string savePath = Server.MapPath("~" + directory) + fileName;
                fuThumbnail.SaveAs(savePath);
                thumbnail = fileName;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error saving thumbnail: " + ex.Message;
                return;
            }

            // Collect selected genres
            foreach (ListItem item in GenreListBox.Items)
            {
                if (item.Selected)
                {
                    selectedGenres += item.Value + ",";
                }
            }
            selectedGenres = selectedGenres.TrimEnd(',');

            // Validate required fields
            if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(desc) || string.IsNullOrEmpty(priceText) || string.IsNullOrEmpty(req))
            {
                lblMessage.Text = "All fields are required.";
                return;
            }

            // Validate price
            if (!decimal.TryParse(priceText, out decimal price))
            {
                lblMessage.Text = "Invalid price format.";
                return;
            }

            // Insert product into database
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"
                        INSERT INTO GameProduct (gameTitle, gameDesc, gamePrice, gameReq, gameisActive, gameDirectory, gameThumbnail, gameCategory)
                        VALUES (@title, @desc, @price, @req, @active, @directory, @thumbnail, @category);
                        SELECT CAST(scope_identity() AS int);";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@title", title);
                        cmd.Parameters.AddWithValue("@desc", desc);
                        cmd.Parameters.AddWithValue("@price", price);
                        cmd.Parameters.AddWithValue("@req", req);
                        cmd.Parameters.AddWithValue("@active", isActive ? 1 : 0);
                        cmd.Parameters.AddWithValue("@directory", directory);
                        cmd.Parameters.AddWithValue("@thumbnail", thumbnail);
                        cmd.Parameters.AddWithValue("@category", selectedGenres);

                        conn.Open();
                        GameProductId = (int)cmd.ExecuteScalar();
                    }
                }

                lblMessage.CssClass = "text-success";
                lblMessage.Text = "Product added successfully!";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                return;
            }

            // Validate gallery upload
            if (!fuGallery.HasFiles)
            {
                lblMessage.Text = "Please upload at least one gallery image.";
                return;
            }

            // Save gallery images and insert records
            foreach (HttpPostedFile file in fuGallery.PostedFiles)
            {
                try
                {
                    string galleryFileName = StringGenerator(10) + Path.GetExtension(file.FileName).ToLower();
                    string savePath = Server.MapPath("~" + galleryDirectory) + galleryFileName;
                    file.SaveAs(savePath);

                    string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        string query = "INSERT INTO Gallery (directory, fileName, GameProductId) VALUES (@directory, @fileName, @GameProductId)";
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@directory", galleryDirectory);
                            cmd.Parameters.AddWithValue("@fileName", galleryFileName);
                            cmd.Parameters.AddWithValue("@GameProductId", GameProductId);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error uploading gallery image: " + ex.Message;
                    return;
                }
            }

            // Clear form fields after success
            txtTitle.Text = "";
            txtDesc.Text = "";
            txtPrice.Text = "";
            txtReq.Text = "";
            chkIsActive.Checked = false;
            foreach (ListItem item in GenreListBox.Items)
            {
                item.Selected = false;
            }
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

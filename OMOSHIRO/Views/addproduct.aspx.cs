using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace OMOSHIRO.Views
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            // Get values from form
            string directory = txtDirectory.Text.Trim();
            string thumbnailPath = "";
            string title = txtTitle.Text.Trim();
            string desc = txtDesc.Text.Trim();
            string priceText = txtPrice.Text.Trim();
            string req = txtReq.Text.Trim();
            bool isActive = chkIsActive.Checked;

            if (fuThumbnail.HasFile)
            {
                string fileName = System.IO.Path.GetFileName(fuThumbnail.FileName);
                string savePath = Server.MapPath("~/Images/Thumbnails/") + fileName;
                fuThumbnail.SaveAs(savePath);
                thumbnailPath = "~/Images/Thumbnails/" + fileName;
            }
            else
            {
                lblMessage.Text = "Please upload a thumbnail image.";
                return;
            }

            // Validation
            if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(desc) || string.IsNullOrEmpty(priceText) || string.IsNullOrEmpty(req))
            {
                lblMessage.Text = "All fields are required.";
                return;
            }

            decimal price;
            if (!decimal.TryParse(priceText, out price))
            {
                lblMessage.Text = "Invalid price format.";
                return;
            }

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "INSERT INTO GameProduct (gameTitle, gameDesc, gamePrice, gameReq, gameisActive, gameDirectory, gameThumbnail) " +
                                    "VALUES (@title, @desc, @price, @req, @active, @directory, @thumbnail)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@directory", directory);
                        cmd.Parameters.AddWithValue("@thumbnail", thumbnailPath);
                        cmd.Parameters.AddWithValue("@title", title);
                        cmd.Parameters.AddWithValue("@desc", desc);
                        cmd.Parameters.AddWithValue("@price", price);
                        cmd.Parameters.AddWithValue("@req", req);
                        cmd.Parameters.AddWithValue("@active", isActive ? 1 : 0); // TINYINT expects 0 or 1 (Boolean)

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                lblMessage.CssClass = "text-success";
                lblMessage.Text = "Product added successfully!";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}

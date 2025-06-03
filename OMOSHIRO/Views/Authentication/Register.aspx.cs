using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OMOSHIRO.Views.Authentication
{
	public partial class Register : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            string HashPassword(string password)
            {
                using (SHA256 sha256 = SHA256.Create())
                {
                    byte[] bytes = Encoding.UTF8.GetBytes(password);
                    byte[] hash = sha256.ComputeHash(bytes);
                    StringBuilder builder = new StringBuilder();
                    foreach (var b in hash)
                        builder.Append(b.ToString("x2")); // convert to hex string
                    return builder.ToString();
                }
            }

            try
            {
                if (Password.Text == RepPassword.Text)
                {
                    string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        string query = @"
                            INSERT INTO Users (username, full_name, email, role, password)
                            VALUES (@username, @full_name, @email, @role, @password);";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@username", UserName.Text);
                            cmd.Parameters.AddWithValue("@full_name", FullName.Text);
                            cmd.Parameters.AddWithValue("@email", Email.Text);
                            cmd.Parameters.AddWithValue("@role", "user");

                            string hashedPassword = HashPassword(Password.Text);
                            cmd.Parameters.AddWithValue("@password", hashedPassword);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    Response.Redirect("~/Views/Authentication/Login.aspx");
                } else
                {
                    lblMessage.Text = "Password doesn't match.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                return;
            }
        }
    }
}
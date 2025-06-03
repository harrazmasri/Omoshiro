using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OMOSHIRO.Views.Authentication
{
    public class User 
    {
        public string Username { get; set; }
        public string Fullname { get; set; }
        public string Email { get; set; }
        public string Role { get; set; }
    }

	public partial class Login : System.Web.UI.Page
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

            User fetchedUser = new User();

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"
                        SELECT * FROM Users WHERE username=@username AND password=@password AND role = 'user'";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@username", UserName.Text);

                        string hashedPassword = HashPassword(Password.Text);
                        cmd.Parameters.AddWithValue("@password", hashedPassword);

                        conn.Open();
                        cmd.ExecuteNonQuery();

                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            fetchedUser = new User
                            {
                                Username = reader["username"].ToString(),
                                Fullname = reader["full_name"].ToString(),
                                Email = reader["email"].ToString(),
                                Role = reader["role"].ToString(),
                            };

                            //lblMessage.Text = fetchedUser.Fullname;

                            Session["LoggedUsername"] = fetchedUser.Username;
                            Session["LoggedFullname"] = fetchedUser.Fullname;
                            Session["LoggedEmail"] = fetchedUser.Email;
                            Session["LoggedRole"] = fetchedUser.Role;

                            //Session["LoggedUser"] = fetchedUser;

                            Server.Transfer("~/Views/Dashboard/Store.aspx");
                        } else
                        {
                            lblMessage.Text = "Username or password mismatch. Please try again.";
                        }

                            conn.Close();

                    }
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
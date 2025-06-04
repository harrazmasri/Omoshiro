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
    public class User
    {
        public string Id { get; set; }
        public string Username { get; set; }
        public string Fullname { get; set; }
        public string Email { get; set; }
        public string Role { get; set; }
        public decimal Balance { get; set; }
    }

    public partial class Profile : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            User fetchedUser = new User();

            if (Session["loggedUsername"] != null)
            {
                UserName.Text = Session["loggedUsername"].ToString();

                decimal balance = 0.00m;

                // refresh user details on load
                string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"
                        SELECT * FROM Users WHERE username=@username AND Id=@userId AND role = 'user'";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@username", Session["loggedUsername"]);
                        cmd.Parameters.AddWithValue("@userId", Session["loggedUserId"]);

                        conn.Open();
                        cmd.ExecuteNonQuery();

                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            fetchedUser = new User
                            {
                                Id = reader["Id"].ToString(),
                                Username = reader["username"].ToString(),
                                Fullname = reader["full_name"].ToString(),
                                Email = reader["email"].ToString(),
                                Role = reader["role"].ToString(),
                                Balance = Convert.ToDecimal(reader["balance"])
                            };

                            Session["LoggedUserId"] = fetchedUser.Id;
                            Session["LoggedUsername"] = fetchedUser.Username;
                            Session["LoggedFullname"] = fetchedUser.Fullname;
                            Session["LoggedEmail"] = fetchedUser.Email;
                            Session["LoggedRole"] = fetchedUser.Role;
                            Session["LoggedBalance"] = fetchedUser.Balance;

                        }

                        conn.Close();
                    }
                }

                UserBalance.Text = Convert.ToDecimal(Session["loggedBalance"]).ToString("0.00");

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"
                        SELECT SUM(GameProduct.gamePrice) AS SpentAmount
                        FROM GameProduct
                        INNER JOIN Orders ON GameProduct.gameID = Orders.GameProductId
                        WHERE Orders.UserId = @userId;
                    ";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["LoggedUserId"]));

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // If value is DBNull, set 0.00
                        object spentValue = reader["SpentAmount"];
                        decimal spent = (spentValue == DBNull.Value) ? 0.00m : Convert.ToDecimal(spentValue);
                        SpentAmount.Text = spent.ToString("0.00");
                    }

                    conn.Close();
                }
            }

        }
    }
}
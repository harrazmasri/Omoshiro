using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OMOSHIRO
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string weeklyQuery = "SELECT COUNT(Id) AS WeeklySold FROM Orders WHERE purchasedDate > @sevenDaysFromNow";
                    SqlCommand cmd = new SqlCommand(weeklyQuery, conn);
                    cmd.Parameters.AddWithValue("@sevenDaysFromNow", DateTime.Now.AddDays(-7));

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        WeeklySold.Text = reader["WeeklySold"].ToString();                 
                    }
                }

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string totalSoldQuery = "SELECT COUNT(Id) AS TotalSold FROM Orders";
                    SqlCommand cmd = new SqlCommand(totalSoldQuery, conn);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        TotalSold.Text = reader["TotalSold"].ToString();
                    }
                }

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string totalGame = "SELECT COUNT(gameId) AS TotalGames FROM GameProduct";
                    SqlCommand cmd = new SqlCommand(totalGame, conn);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        TotalCount.Text = reader["TotalGames"].ToString();
                    }
                }
            }
            catch (Exception exception)
            {
                //
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            // Optional: Clear session or authentication data here
            // Session.Abandon();

            // Redirect to the admin login page
            Response.Redirect("~/Views/Admin/AdminLogIn.aspx");
        }
    }
}
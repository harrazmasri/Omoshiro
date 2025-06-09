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
	public partial class TopUpWallet : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void TopUpFixedAmount_Click(object sender, CommandEventArgs e)
        {
            if (decimal.TryParse(e.CommandArgument.ToString(), out decimal amount))
            {
                AddBalanceToUser(amount);
            }
        }

        protected void TopUpButton_Click(object sender, EventArgs e)
        {
            if (decimal.TryParse(AmountValue.Text, out decimal amount))
            {
                AddBalanceToUser(amount);
            }
        }

        private void AddBalanceToUser(decimal addAmount)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "UPDATE Users SET balance = balance + @addAmount WHERE Id = @loggedUser";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@addAmount", addAmount);
                    cmd.Parameters.AddWithValue("@loggedUser", Convert.ToInt32(Session["LoggedUserId"]));

                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        SuccessMessage.Text = $"Successfully added RM {addAmount:0.00} to your balance.";
                    }
                    else
                    {
                        FailedMessage.Text = "Failed to update balance. User not found.";
                    }

                    conn.Close();
                }

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT balance FROM Users WHERE Id = @loggedUser";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@loggedUser", Convert.ToInt32(Session["LoggedUserId"]));

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        Session["loggedBalance"] = reader["balance"];
                    }

                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                FailedMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}
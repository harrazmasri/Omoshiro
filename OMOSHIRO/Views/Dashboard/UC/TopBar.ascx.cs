using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OMOSHIRO.Views.Authentication;

namespace OMOSHIRO.Views.Dashboard.UC
{
    public class User
    {
        public string Username { get; set; }
        public string Fullname { get; set; }
        public string Email { get; set; }
        public string Role { get; set; }
    }

    public partial class TopBar : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            //User currentUser = Session["LoggedUser"] as User;
            //if (currentUser != null)
            //{
            //    UserName.Text = currentUser.Username;
            //}
            //else
            //{
            //    UserName.Text = "Guest";
            //}

            User loggedUser = new User()
            {
                Username = Session["LoggedUsername"].ToString(),
                Fullname = Session["LoggedFullname"].ToString(),
                Email = Session["LoggedEmail"].ToString(),
                Role = Session["LoggedRole"].ToString(),
            };

            UserName.Text = loggedUser.Username;
        }
	}
}
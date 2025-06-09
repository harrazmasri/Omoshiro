using System;
using System.Collections.Generic;
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
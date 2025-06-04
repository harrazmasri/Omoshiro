using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OMOSHIRO
{
    public partial class DasgboardAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (
                Session["LoggedUsername"] == null
            )
            {
                Response.Redirect("~/Views/Authentication/Login.aspx");
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
            Response.Cookies.Clear();
            Response.Redirect("~/Views/Admin/AdminLogIn.aspx", false);
        }
    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OMOSHIRO.Views
{
    public partial class Site1 : System.Web.UI.MasterPage
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
	}
}
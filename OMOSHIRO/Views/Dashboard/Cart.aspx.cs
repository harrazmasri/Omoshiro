using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OMOSHIRO.Views.Dashboard
{
    public partial class Cart : System.Web.UI.Page
	{
        
        protected void Page_Load(object sender, EventArgs e)
		{
            //
        }

        protected void CheckoutButton_Click(object sender, EventArgs e)
        {
			//
        }

        public void updateTotalAmount(decimal totalAmount)
        {
            TotalAmountLabel.Text = totalAmount.ToString("N2");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Session["uname"].ToString()))
        {
            Response.Redirect("~/LoginPage.aspx");
        }

        
    }

    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session["uname"] = "";
        Session["RoleID"] = "";
        Response.Redirect("~/LoginPage.aspx");
    }


    protected void btnCustomer_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Customers.aspx");
    }
}

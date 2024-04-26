using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox1.Text = Session["uname"].ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text == TextBox3.Text)
        {
            string strcmd = "UPDATE       DbManagers " +
                             " SET Password = '"+TextBox3.Text+"' " +
                                "WHERE(UserName = '"+Session["uname"]+"')";
            SqlHelper.CommandExecuting(strcmd);
        }
    }
}
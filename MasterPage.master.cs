using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (string.IsNullOrEmpty(Session["uname"].ToString()))
        {
            Response.Redirect("~/LoginPage.aspx");
        }
        Label1.Text="";
        if (Session["uname"] != null)
        {
            Label1.Text +="Welcome, "+ Session["uname"].ToString();
            getUser();
            if (dt.Rows[0]["ManagerID"].ToString() == "1")
            {
                btnDetails.Visible = true;
                return;
            }
            return;
        }
        else
        {
            Response.Redirect("~/LoginPage.aspx");
        }

        if (Session["RoleID"].ToString() == "2")
        {
            
        }
    }


    protected void getUser()
    {
        string strcmd = "select ManagerID from DbManagers where UserName='" +
            Session["uname"].ToString()+"'";
        dt = SqlHelper.getData(strcmd);
    }


    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session["uname"] = "";
        Session["RoleID"] = "";
        Session["BillData"] = null;
        Response.Redirect("~/LoginPage.aspx");
    }

    protected void btnDetails_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AccountDetails.aspx");
    }


}

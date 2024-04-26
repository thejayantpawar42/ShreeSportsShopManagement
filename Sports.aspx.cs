using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sports : System.Web.UI.Page
{
    string FirstName = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Session["uname"].ToString()) || Session["RoleID"].ToString() != "1")
        {
            Response.Redirect("~/LoginPage.aspx");
        }
        string strcmd2 = "select * from Sports";
        DataTable dt1 = SqlHelper.getData(strcmd2);
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        lblerror.Text = "";
        string name = Button1.Text;
        if (name == "Update")
        {
            DataTable dt1=getName();
            
            if (dt1.Rows.Count > 0)
            {
                lblerror.Text = "This Sport is Already Exists!";
                TextBox1.Text = FirstName;
                TextBox1.Focus();
                Button1.Text = "Update";
            }
            else
            {
                string strcmd = "update Sports set SportName='" + TextBox1.Text.Trim() + "' where SportsId=" +
                hdfsportsid.Value;
                DataTable dt = SqlHelper.getData(strcmd);
                GridView1.DataBind();
                lblerror.ForeColor = System.Drawing.Color.Green;
                lblerror.Text = "Product Updated Successfully!";
                TextBox1.Text = "";
            }
        }
        if (name == "Add")
        {
            string strcmd = "select * from Sports where SportName='" + TextBox1.Text.Trim() + "'";
            DataTable dt = SqlHelper.getData(strcmd);
            if (dt.Rows.Count > 0)
            {
                lblerror.ForeColor = System.Drawing.Color.Red;
                lblerror.Text = "Sport Name is Alerady Exists";
                TextBox1.Text = "";
            }
            else
            {
                lblerror.Text = "";
                string strcmd1 = "insert into Sports values('" + TextBox1.Text.Trim() + "')";
                SqlHelper.CommandExecuting(strcmd1);
                string strcmd2 = "select * from Sports";
                DataTable dt1= SqlHelper.getData(strcmd2);
                GridView1.DataBind();
                lblerror.ForeColor = System.Drawing.Color.Green;
                lblerror.Text = "Sport Added Successfully!";
                TextBox1.Text = "";
            }
        }
        Button1.Text = "Add";
        
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        lblerror.Text = "";
        int index = e.NewEditIndex;
        TextBox1.Text = GridView1.Rows[index].Cells[1].Text;
        TextBox1.Focus();
        FirstName = TextBox1.Text;       
        hdfsportsid.Value = GridView1.Rows[index].Cells[0].Text;
        Button1.Text = "Update";
   }

   protected DataTable getName()
    {
        string strcmd = "SELECT        SportsId " +
                       " FROM Sports " +
                        " WHERE(SportName = '"+TextBox1.Text.Trim()+"')";
        DataTable dt = SqlHelper.getData(strcmd);
        return dt;
    }

   
}
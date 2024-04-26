using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AccountDetails : System.Web.UI.Page
{
    DataTable datatable1;
    int index;
    protected void Page_Load(object sender, EventArgs e)
   {
        
        if (string.IsNullOrEmpty(Session["uname"].ToString()))
        {
            Response.Redirect("~/LoginPage.aspx");
        }
        else
        {
            if (Session["uname"].ToString() != "Manager1" || Session["RoleID"].ToString() != "1")
            {
                Response.Redirect("~/LoginPage.aspx");
            }
            
        }
        if (!Page.IsPostBack)
        {
            LoadCategory();
            LoadData();
            //datatable1 = SqlHelper.getData(strcmd);
            //datatable1.Columns["ManagerID"].ReadOnly = true;
            //datatable1.Columns["UserName"].ReadOnly = true;
            //datatable1.Columns["RoleName"].ReadOnly = true;
            //datatable1.Columns["Active"].ReadOnly = true;
        }
        LoadData();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if(!(ddlCategory.SelectedValue == "-1"))
        {
            DataTable dt= getUser();
            if (dt.Rows.Count > 0)
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "User is Already Exists!";
            }
            else
            {
                string strcmd = "";
                if(Button1.Text=="Add User")
                {
                    if (ChechActive.Checked)
                    {
                        strcmd = "INSERT INTO DbManagers " +
                                          "(RoleID, UserName, Password, Active) " +
                                              "VALUES(" + ddlCategory.SelectedValue + ", '" + TextBox1.Text + "', '" + TextBox2.Text + "', 1)";
                    }
                    else
                    {
                        strcmd = "INSERT INTO DbManagers " +
                                    "(RoleID, UserName, Password, Active) " +
                                        "VALUES(" + ddlCategory.SelectedValue + ", '" + TextBox1.Text + "', '" + TextBox2.Text + "', 0)";
                    }
                    SqlHelper.CommandExecuting(strcmd);
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    lblmsg.Text = "User Added Successfully!";
                    LoadData();
                }
                if (Button1.Text == "Update")
                {
                    int ManagerID = getID();
                    if (ChechActive.Checked)
                    {
                        strcmd = "UPDATE DbManagers "+
                                    "SET RoleID = "+ddlCategory.SelectedValue+", UserName = '"+TextBox1.Text+"', Active = 1 "+
                                        "WHERE ManagerID = "+ManagerID;
                    }
                    else
                    {
                        strcmd = "UPDATE DbManagers " +
                                    "SET RoleID =" + ddlCategory.SelectedValue + ", UserName = '" + TextBox1.Text + "', Active = 0 " +
                                        "WHERE ManagerID = " + ManagerID; 
                    }
                    SqlHelper.CommandExecuting(strcmd);
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    lblmsg.Text = "User Updated Successfully!";
                    //LoadCategory();
                    LoadData();
                }
            }
        }
        else
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Select Category first!";
            LoadCategory();
        }
    }

    protected void LoadCategory()
    {   
        string strcmd = "SELECT RoleID, RoleName " +
                          "FROM UserCategory " +
                                "ORDER BY RoleID";
        DataTable dt = SqlHelper.getData(strcmd);
        ddlCategory.DataSource = dt;
        ddlCategory.DataTextField = "RoleName";
        ddlCategory.DataValueField = "RoleID";
        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0, new ListItem("~Select Category~", "-1"));
    }

    protected DataTable getUser()
    {
        string strcmd = "SELECT RoleName, RoleID " +
                          "FROM UserCategory " +
                             "WHERE(RoleName = '"+TextBox1.Text+"') AND (RoleID = "+ddlCategory.SelectedValue+")";
        DataTable dt = SqlHelper.getData(strcmd);
        return dt;
    }


    protected void Clears()
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        ChechActive.Checked = false;
        Button1.Text = "Add User";
    }

    protected int getID()
    {
        string strcmd = "SELECT        ManagerID " +
                           " FROM DbManagers " +
                               "WHERE(UserName = '"+TextBox1.Text+"') AND(RoleID = "+ddlCategory.SelectedValue+") ";
        DataTable dt = SqlHelper.getData(strcmd);
        return Convert.ToInt32(dt.Rows[0]["ManagerID"].ToString());
    }



    protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        
        index = e.NewEditIndex;
        TextBox1.Text = GridView1.Rows[index].Cells[2].Text.ToString();
        ddlCategory.SelectedValue = ddlCategory.Items.FindByText(GridView1.Rows[index].Cells[3].Text).Value;
        string strcmd = "SELECT        Active, Password " +
                          "FROM DbManagers " +
                             " WHERE(UserName = '" + GridView1.Rows[index].Cells[2].Text.ToString() + "')";
        DataTable dt = SqlHelper.getData(strcmd);
        if (dt.Rows[0]["Active"].ToString() == "True")
        {
            ChechActive.Checked = true;
        }
        else
        {
            ChechActive.Checked = false;
        }
        TextBox2.Text = dt.Rows[0]["Password"].ToString();
        //TextBox2.ReadOnly = true;
        Button1.Text = "Update";
    }

    protected void LoadData()
    {
        string strcmd = "SELECT DbManagers.ManagerID, DbManagers.UserName, UserCategory.RoleName, DbManagers.Active FROM DbManagers INNER JOIN UserCategory ON DbManagers.RoleID = UserCategory.RoleID";
        datatable1 = SqlHelper.getData(strcmd);
        datatable1.Columns["ManagerID"].ReadOnly = true;
        datatable1.Columns["UserName"].ReadOnly = true;
        datatable1.Columns["RoleName"].ReadOnly = true;
        datatable1.Columns["Active"].ReadOnly = true;
        GridView1.DataSource = datatable1;
        GridView1.DataBind();
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Session["uname"].ToString()) || Session["RoleID"].ToString() != "1")
        {
            Response.Redirect("~/LoginPage.aspx");
        }
        if (Page.IsPostBack)
        {
            lblShow.Visible = false;
            LoadTemp();
        }
    }

    protected void LoadData()
    {
        string strcmd = "SELECT        Equipments.EquipmetName, SellChild.Quantity, SellChild.Price "+
                         "FROM Equipments INNER JOIN "+
                           "SellChild ON Equipments.EquipmentID = SellChild.EquipmentID INNER JOIN "+
                               "SellParent ON SellChild.SellID = SellParent.SellID "+
                                 "WHERE SellParent.Dated >= CONVERT(DATETIME, '"+txtFromDate.Text.ToString()+"', 102)"+
                                " AND SellParent.Dated <= CONVERT(DATETIME, '" + txtToDate.Text.ToString() + "',102)";
        DataTable dt = SqlHelper.getData(strcmd);
        GridView1.DataSource = dt;
        GridView1.DataBind();

        if (!(GridView1.Rows.Count >= 1))
        {
            lblShow.Visible = true;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if(string.IsNullOrEmpty(txtFromDate.Text.ToString()) || string.IsNullOrEmpty(txtToDate.Text.ToString()))
        {
            return;
        }
        else
        {
            LoadData();
        }
    }

    protected void LoadTemp()
    {
        string strcmd = "SELECT        Equipments.EquipmetName, SellChild.Quantity, SellChild.Price " +
                         "FROM Equipments INNER JOIN " +
                           "SellChild ON Equipments.EquipmentID = SellChild.EquipmentID INNER JOIN " +
                               "SellParent ON SellChild.SellID = SellParent.SellID " +
                                 "WHERE SellParent.Dated >= CONVERT(DATETIME, '" + txtFromDate.Text.ToString() + "', 102)";
        DataTable dt = SqlHelper.getData(strcmd);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}

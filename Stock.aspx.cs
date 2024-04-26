using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Stock : System.Web.UI.Page
{
    int PID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Session["uname"].ToString()) || Session["RoleID"].ToString() != "1")
        {
            Response.Redirect("~/LoginPage.aspx");
        }
        if (!Page.IsPostBack)
        {
            LoadCategory();
            LoadProduct();
            GridViewDisplay();
            

            string functionName = Session["ChangeQuantity"] as string;
            string arg1 = Session["arg1"] as string;
            string arg2 = Session["arg2"] as string;
            if (!string.IsNullOrEmpty(functionName))
            {
                if(functionName== "ChangeQuantity")
                {
                    ChangeQuantity(arg1, arg2);
                }
            }
            Session.Remove("ChangeQuantity");
            Session.Remove("arg1");
            Session.Remove("arg2");
        }
    }

    private void LoadCategory()
    {
        string strcmd = "SELECT DISTINCT SportsId, SportName FROM Sports order by SportName";
        DataTable dt = SqlHelper.getData(strcmd);
        ddlCategory.DataSource = dt;
        ddlCategory.DataTextField = "SportName";
        ddlCategory.DataValueField = "SportsId";
        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0, new ListItem("~Select Sport~", "-1"));
    }

    private void LoadProduct()
    {
        string strcmd = "SELECT DISTINCT EquipmetName, EquipmentID FROM Equipments ";
        if (ddlCategory.SelectedValue != "-1")
            strcmd += "WHERE(SportsId = " + ddlCategory.SelectedValue + ")";
        strcmd += " ORDER BY EquipmetName";
        DataTable dt = SqlHelper.getData(strcmd);
        ddlproducts.DataSource = dt;
        ddlproducts.DataTextField = "EquipmetName";
        ddlproducts.DataValueField = "EquipmentID";
        ddlproducts.DataBind();
        ddlproducts.Items.Insert(0, new ListItem("~Select Equipment~", "-1"));
    }

    protected void GridViewDisplay()
    {

        string strcmd = "SELECT        EquipmentID, EquipmetName, EquipmentPrice, EquipmentQuantity"+
                         " FROM Equipments "+
                         " WHERE(SportsId = "+ddlCategory.SelectedValue+") ";
        
        DataTable dt = SqlHelper.getData(strcmd);
        DgvDisplay.DataSource = dt;
        DgvDisplay.DataBind();

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        lblmsg.Text = "";
        if(ddlCategory.SelectedValue!="-1" || ddlproducts.SelectedValue != "-1")
        {
            if (!(string.IsNullOrEmpty(txtinqty.Text)))
            {
                if (Convert.ToInt32(txtinqty.Text) > 0)
                {
                    int Qty = getQuantity();
                    string strcmd = "UPDATE       Equipments " +
                                   " SET EquipmentQuantity = " + (Qty + Convert.ToInt32(txtinqty.Text)) +
                                  " FROM Equipments WHERE EquipmentID=" + ddlproducts.SelectedValue;
                    DataTable dt = SqlHelper.getData(strcmd);
                    DgvDisplay.DataBind();
                    GridViewDisplay();

                    DataTable datatable = getStock(Convert.ToInt32(ddlproducts.SelectedValue));
                    if (datatable.Rows.Count>0)
                    {
                        //update
                        int qty;
                        DataTable dt2 = getInQty(Convert.ToInt32(ddlproducts.SelectedValue));
                        if (string.IsNullOrEmpty(dt2.Rows[0]["InQty"].ToString()))
                        {
                            qty = 0;
                        }
                        else
                        {
                            qty = Convert.ToInt32(dt2.Rows[0]["InQty"].ToString());
                        }
                        qty += Convert.ToInt32(txtinqty.Text);
                        strcmd = "UPDATE       Stocks " +
                                 "SET InQty = "+qty+", DateModified = '"+DateTime.Now.ToString("MM-dd-yyyy")+"' " +
                                    "WHERE(EquipmentID = "+ddlproducts.SelectedValue+")";
                        SqlHelper.CommandExecuting(strcmd);
                    }
                    else
                    {
                        //insert
                        strcmd = "INSERT INTO Stocks " +
                                   "(EquipmentID, SportsId, InQty, OutQty, DateModified) " +
                                      "VALUES("+ddlproducts.SelectedValue+","+ddlCategory.SelectedValue+","+Convert.ToInt32(txtinqty.Text)+", NULL, '"+DateTime.Now.ToString("MM-dd-yyyy")+"')";
                        SqlHelper.CommandExecuting(strcmd);
                    }

                    txtinqty.Text = "";
                }
                else
                {
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    lblmsg.Text = "Minimum Quantity Should be ONE";
                }
            }
            else
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Quantity Can't be Zero";
                txtinqty.Focus();
            }
            
        }
        else
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Mendetory to select the Category and Product!";
        }
    }

    protected int getQuantity()
    {
        if((ddlCategory.SelectedValue == "-1" || ddlproducts.SelectedValue == "-1"))
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Select Values First";        
        }
        string strcmd = "SELECT        EquipmentQuantity " +
                        " FROM Equipments " +
                         " WHERE(EquipmentID =" + ddlproducts.SelectedValue + ")";

        int qty;
        DataTable dt = SqlHelper.getData(strcmd);
        if (string.IsNullOrEmpty(dt.Rows[0]["EquipmentQuantity"].ToString()))
        {
            qty = 0;
        }
        else
        {
            qty = Convert.ToInt32(dt.Rows[0]["EquipmentQuantity"].ToString());
        }
        return qty;
    }

    protected void txtinqty_TextChanged(object sender, EventArgs e)
    {
        //ddlCategory.AutoPostBack = false;
        //PID = Convert.ToInt32(ddlproducts.SelectedValue);
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        LoadProduct();
        GridViewDisplay();
    }

    public void ChangeQuantity(string arg1,string arg2)
    {
        ddlCategory.SelectedValue = ddlCategory.Items.FindByText(arg1).Value;
        ddlproducts.SelectedValue = ddlproducts.Items.FindByText(arg2).Value;
        GridViewDisplay();
    }

    protected DataTable getStock(int index)
    {
        string strcmd = "SELECT        StockID " +
                         "FROM Stocks " +
                           "WHERE(EquipmentID = "+index+")";
        DataTable dt = SqlHelper.getData(strcmd);
        return dt;
    }

    protected DataTable getInQty(int index)
    {
        string strcmd = "SELECT        InQty " +
                         "FROM Stocks " +
                           "WHERE(EquipmentID = " + index + ")";
        DataTable dt = SqlHelper.getData(strcmd);
        return dt;
    }
}
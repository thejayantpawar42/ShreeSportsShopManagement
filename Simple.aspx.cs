using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Simple : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Session["uname"].ToString()) || Session["RoleID"].ToString() != "1")
        {
            Response.Redirect("~/LoginPage.aspx");
        }
        LoadProducts();
    }

    protected void LoadProducts()
    {
        string strcmd = "";
        strcmd = "SELECT        COUNT(InvID) As Total FROM InvNos";
        DataTable dt = SqlHelper.getData(strcmd);
        lblorders.ForeColor = System.Drawing.Color.Green;
        lblorders.Text = dt.Rows[0]["Total"].ToString();

        strcmd = "SELECT COUNT(SportsId) AS Categories FROM Sports";
        dt = SqlHelper.getData(strcmd);
        lblCategory.ForeColor = System.Drawing.Color.WhiteSmoke;
        lblCategory.Text = dt.Rows[0]["Categories"].ToString();

        strcmd = "SELECT COUNT(EquipmentID) AS Products FROM Equipments";
        dt = SqlHelper.getData(strcmd);
        lblProducts.ForeColor = System.Drawing.Color.WhiteSmoke;
        lblProducts.Text = dt.Rows[0]["Products"].ToString();

        strcmd = "SELECT SUM(Price) TotalEarn FROM SellChild";
        dt = SqlHelper.getData(strcmd);
        lblTotaRs.ForeColor= System.Drawing.Color.Yellow;
        double price = Convert.ToDouble(dt.Rows[0]["TotalEarn"].ToString());
        lblTotaRs.Text = price.ToString("##,###.00") + " Rs.";
    }
}
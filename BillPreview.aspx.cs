using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BillPreview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e) 
    {
        int id = getSellId();
        if (id == 0)
            return;

        LoadData();
        LoadCustomer();
        ItemsLoad();
        DispBill();
    }

    private int getSellId()
    {
        return Convert.ToInt32(Request.QueryString["id"]);
    }

    private void LoadData()
    {
        string strcmd = "SELECT CustomerID, InvNo, Dated " +
                         "FROM SellParent " +
                            "WHERE(SellID ="+getSellId()+")";
        DataTable dt = SqlHelper.getData(strcmd);
        int CustID = Convert.ToInt32(dt.Rows[0]["CustomerID"].ToString());
        int InnNO = Convert.ToInt32(dt.Rows[0]["InvNo"].ToString());
        DateTime date = Convert.ToDateTime(dt.Rows[0]["Dated"].ToString());
        string dateString = date.ToString("dd/MMM/yyyy");

        lblInv.Text = InnNO.ToString();
        lblDate.Text = dateString.ToString();
        lblBiller.Text = Session["uname"].ToString();
    }

    private void LoadCustomer()
    {
        string strcmd = "SELECT        CustomerID " +
                           "FROM SellParent " +
                              "WHERE(SellID = "+getSellId()+")";
        DataTable dt = SqlHelper.getData(strcmd);

        int CustID = Convert.ToInt32(dt.Rows[0]["CustomerID"].ToString());

        strcmd = "SELECT CustomerName, CustomerMobile, Discount, CustomerAddress, State, City, Taluka " +
                   "FROM Customers " +
                       "WHERE(CustomerID = "+CustID+")";

        DataTable dt1 = SqlHelper.getData(strcmd);

        if (dt1.Rows.Count > 0)
        {
            lblCustName.Text = dt1.Rows[0]["CustomerName"].ToString();
            lblAdd.Text = dt1.Rows[0]["CustomerAddress"].ToString();
            lblMob.Text = dt1.Rows[0]["CustomerMobile"].ToString();
            lblState.Text = dt1.Rows[0]["Taluka"].ToString() + ", " + dt1.Rows[0]["City"].ToString() + ", " + dt1.Rows[0]["State"].ToString();
        }
    }

    protected void ItemsLoad()
    {
        int id = getSellId();
        string strcmd = "SELECT Equipments.EquipmetName, SellChild.Quantity, SellChild.Price, SellChild.EquipmentID, " +
                           "(SellChild.Price * SellChild.Quantity) AS Amount " +
                              "FROM Equipments INNER JOIN " +
                                  "SellChild ON Equipments.EquipmentID = SellChild.EquipmentID " +
                                      "WHERE(SellChild.SellID = "+id+")";
        DataTable dt = SqlHelper.getData(strcmd);
        RepeatInformation.DataSource = dt;
        RepeatInformation.DataBind();
    }

    protected void DispBill()
    {
        string strcmd = "SELECT SUM(Quantity) As NetQty FROM SellChild WHERE(SellID = "+getSellId()+")";
        DataTable dt = SqlHelper.getData(strcmd);
        lblQty.Text = dt.Rows[0]["NetQty"].ToString();

        strcmd="SELECT SUM(Price) AS NetAmount FROM SellChild WHERE(SellID = "+getSellId()+")";
        dt = SqlHelper.getData(strcmd);
        double netAmt = Convert.ToDouble(dt.Rows[0]["NetAmount"].ToString());
        lblAmt.Text = netAmt.ToString("##,###.00");

        dt.Clear();
        strcmd = "SELECT CustomerID FROM SellParent WHERE(SellID = "+getSellId()+")";
        dt = SqlHelper.getData(strcmd);
        int CustID = Convert.ToInt32(dt.Rows[0]["CustomerID"].ToString());

        dt.Clear();
        strcmd = "SELECT Discount FROM Customers WHERE(CustomerID = "+CustID+")";
        dt = SqlHelper.getData(strcmd);
        lblDisc.Text = dt.Rows[0]["Discount"].ToString() + "%";
        double disc = Convert.ToDouble(dt.Rows[0]["Discount"].ToString());

        lblTotal.Text = (netAmt - ((netAmt) * (disc / 100))).ToString("##,###.00") + " Rs.";
    }
}
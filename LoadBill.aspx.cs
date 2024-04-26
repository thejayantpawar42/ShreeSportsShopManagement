using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoadBill : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Session["uname"].ToString()))
        {
            Response.Redirect("~/LoginPage.aspx");
        }

        if (!Page.IsPostBack)
        {
            getProducts();

        }

    }

    protected void getProducts()
    {
        if (ddlCategory.SelectedValue != "-1")
        {

            string strcmd = "SELECT        EquipmetName, EquipmentID " +
                            " FROM Equipments " +
                             " WHERE(SportsId = " + ddlCategory.SelectedValue + ")";

            DataTable dt = SqlHelper.getData(strcmd);
            ddlProducts.DataTextField = "EquipmetName";
            ddlProducts.DataValueField = "EquipmentID";
            ddlProducts.DataSource = dt;
            ddlProducts.DataBind();
            ddlProducts.Items.Insert(0, (new ListItem("~Select Product~", "-1")));
        }
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        getProducts();
    }

    protected void ddlProducts_SelectedIndexChanged(object sender, EventArgs e)
    {
        getPrice();
    }

    protected void getPrice()
    {
        string strcmd = "SELECT        EquipmentPrice, EquipmentQuantity " +
                        " FROM Equipments " +
                         " WHERE(EquipmentID =" + ddlProducts.SelectedValue + ")";
        DataTable dt = SqlHelper.getData(strcmd);

        txtprice.Text = dt.Rows[0]["EquipmentPrice"].ToString();
        lblQty.Text = dt.Rows[0]["EquipmentQuantity"].ToString();
    }

    protected void Unnamed2_Click(object sender, EventArgs e)
    {

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (ddlCustomer.SelectedValue == "-1")
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Kindly Select Customer First!";
            ddlCustomer.Focus();
        }

        if (ddlCategory.SelectedValue == "-1")
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Kindly Select Sport First!";
            ddlCategory.Focus();
        }

        if (ddlProducts.SelectedValue == "-1")
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Kindly Select Product First!";
            ddlProducts.Focus();
        }

        if (txtQuantity.Text == "")
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Kindly Enter Quantity First!";
            ddlProducts.Focus();
        }
        else
        {
            btnbuy.Visible = true;
            if (btnAdd.Text == "Add")
            {
                string date = txtdate.Text.ToString();
                try
                {
                    if (grdDisplay.Rows.Count > 0)
                    {
                        int product = getProduct();
                        if (product == 1000)
                        {

                            if (Convert.ToDouble(txtprice.Text) != 0 && Convert.ToDouble(txtQuantity.Text) != 0 && (Convert.ToInt32(lblQty.Text) >= Convert.ToInt32(txtQuantity.Text)))
                            {
                                AddNew();
                            }
                            else
                            {
                                lblmsg.ForeColor = System.Drawing.Color.Red;
                                lblmsg.Text = "Price and Quantity Should me more than ZERO!";
                            }
                        }
                        else
                        {
                            if (Convert.ToDouble(txtprice.Text) != 0 && Convert.ToInt32(txtQuantity.Text) != 0 && (Convert.ToInt32(lblQty.Text) >= Convert.ToInt32(txtQuantity.Text)))
                            {
                                ChangeQuantity(product);
                            }
                            else
                            {
                                lblmsg.ForeColor = System.Drawing.Color.Red;
                                lblmsg.Text = "Price and Quantity Should me more than ZERO! or Remaining Quantity Should be more than Purchase Quantity";
                            }
                        }

                    }
                    else
                    {
                        if (Convert.ToDouble(txtprice.Text) != 0 && Convert.ToDouble(txtQuantity.Text) != 0 && (Convert.ToInt32(lblQty.Text) >= Convert.ToInt32(txtQuantity.Text)))
                        {
                            AddNew();
                        }
                        else
                        {
                            lblmsg.ForeColor = System.Drawing.Color.Red;
                            lblmsg.Text = "Price and Quantity Should me more than ZERO! or Remaining Quantity Should be more than Purchase Quantity";
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            if (btnAdd.Text == "Update")
            {
                if (Convert.ToDouble(txtprice.Text) != 0 && Convert.ToDouble(txtQuantity.Text) != 0 && (Convert.ToInt32(lblQty.Text) >= Convert.ToInt32(txtQuantity.Text)))
                {

                    AddNew();
                }
                else
                {
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    lblmsg.Text = "Price and Quantity Should be more than ZERO! or Remaining Quantity Should be more than Purchase Quantity";
                }
            }
        }
    }

    protected void Clears()
    {
        //ddlCustomer.SelectedValue = "-1";
        //txtdate.Text = "";
        ddlCategory.SelectedValue = "-1";
        ddlProducts.SelectedValue = "-1";
        txtprice.Text = "";

        lblQty.Text = "";
        txtQuantity.Text = "";
        btnAdd.Text = "Add";
        lblNetAmount.Text = "";
        lblmsg.Text = "";
    }

    protected void grdDisplay_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int index = Convert.ToInt32(e.NewEditIndex);
        btnAdd.Text = "Update";

        ddlCategory.SelectedValue = ddlCategory.Items.FindByText(grdDisplay.Rows[index].Cells[3].Text).Value;
        getProducts();
        ddlProducts.SelectedValue = ddlProducts.Items.FindByText(grdDisplay.Rows[index].Cells[1].Text).Value;
        txtprice.Text = grdDisplay.Rows[index].Cells[4].Text;
        txtQuantity.Text = grdDisplay.Rows[index].Cells[5].Text;
        lblNetAmount.Text = grdDisplay.Rows[index].Cells[6].Text;
        UpdateIndex.Value = index.ToString();
        getRemainingQty(Convert.ToInt32(ddlProducts.SelectedValue));
        LoadNetAmtNQty();
    }

    protected int getProduct()
    {
        int count = Convert.ToInt32(grdDisplay.Rows.Count);
        for (int i = 0; i < count; i++)
        {
            if (ddlProducts.SelectedItem.Text == grdDisplay.Rows[i].Cells[1].Text)
            {
                return i;
            }
        }
        return 1000;

    }

    protected void ChangeQuantity(int index)
    {
        int quantity = Convert.ToInt32(grdDisplay.Rows[index].Cells[5].Text);
        quantity += Convert.ToInt32(txtQuantity.Text);

        List<BillData> lst = new List<BillData>();
        BillData billData = new BillData()
        {
            CateID = Convert.ToInt32(ddlCategory.SelectedValue),
            CatName = ddlCategory.SelectedItem.Text,
            ProductID = Convert.ToInt32(ddlProducts.SelectedValue),
            ProductName = ddlProducts.SelectedItem.Text,
            Price = Convert.ToDouble(txtprice.Text),
            Qty = quantity,
            NetAmout = Convert.ToDouble(txtprice.Text) * Convert.ToInt32(txtQuantity.Text)
        };
        if (Session["BillData"] != null)
        {
            lst = (List<BillData>)Session["BillData"];
        }
        lst.Add(billData);
        Session["BillData"] = lst;
        lst.RemoveAt(index);
        grdDisplay.DataSource = lst;
        grdDisplay.DataBind();
        LoadNetAmtNQty();
        Clears();
    }

    protected void AddNew()
    {
        List<BillData> lst = new List<BillData>();
        BillData billData = new BillData()
        {
            CateID = Convert.ToInt32(ddlCategory.SelectedValue),
            CatName = ddlCategory.SelectedItem.Text,
            ProductID = Convert.ToInt32(ddlProducts.SelectedValue),
            ProductName = ddlProducts.SelectedItem.Text,
            Price = Convert.ToDouble(txtprice.Text),
            Qty = Convert.ToInt32(txtQuantity.Text),
            NetAmout = Convert.ToDouble(txtprice.Text) * Convert.ToInt32(txtQuantity.Text)
        };
        if (Session["BillData"] != null)
        {
            lst = (List<BillData>)Session["BillData"];
        }
        lst.Add(billData);
        Session["BillData"] = lst;
        if (btnAdd.Text == "Update") { lst.RemoveAt(Convert.ToInt32(UpdateIndex.Value)); }
        grdDisplay.DataSource = lst;
        grdDisplay.DataBind();
        LoadNetAmtNQty();
        Clears();
    }

    protected void grdDisplay_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int index = e.RowIndex;
        List<BillData> lst = new List<BillData>();
        lst = (List<BillData>)Session["BillData"];
        lst.RemoveAt(index);
        grdDisplay.DataSource = lst;
        grdDisplay.DataBind();
        ButtonCheck();
        LoadNetAmtNQty();

    }

    protected void ButtonCheck()
    {
        if (grdDisplay.Rows.Count == 0)
        {
            btnbuy.Visible = false;
        }
    }

    protected void btnbuy_Click(object sender, EventArgs e)
    {
        if (ddlCustomer.SelectedValue == "-1")
        {
            lblmsg.Text = "Please Select Customer";
            ddlCustomer.Focus();
        }
        else if (string.IsNullOrEmpty(txtdate.Text))
        {
            lblmsg.Text = "Please Select Date";
        }
        else
        {
            string strcmd = "SELECT        InvNo " +
                            "FROM InvNos " +
                             "WHERE(Dated ='" + Convert.ToDateTime(txtdate.Text) + "')";
            int InvNo = 1;
            DataTable dt = SqlHelper.getData(strcmd);
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    InvNo = Convert.ToInt32(dt.Rows[i]["InvNo"].ToString());
                }
                InvNo += 1;
            }
            else
            {
                InvNo = 1;
            }
            strcmd = "INSERT INTO InvNos " +
                       "(InvNo, Dated) " +
                         "VALUES(" + InvNo + ",'" + Convert.ToDateTime(txtdate.Text) + "')";
            SqlHelper.CommandExecuting(strcmd);

            strcmd = "INSERT INTO SellParent " +
                         "(InvNo, CustomerID, Dated) " +
                             "VALUES(" + InvNo + "," + ddlCustomer.SelectedValue + ",'" + Convert.ToDateTime(txtdate.Text) + "')";
            SqlHelper.CommandExecuting(strcmd);

            strcmd = "SELECT SellID " +
                        "FROM SellParent " +
                           "WHERE(InvNo = " + InvNo + ") AND(CustomerID = " + ddlCustomer.SelectedValue + ") AND(Dated = '" + Convert.ToDateTime(txtdate.Text) + "')";
            DataTable dt1 = SqlHelper.getData(strcmd);
            int SellID = Convert.ToInt32(dt1.Rows[0]["SellID"].ToString());

            List<BillData> lst = new List<BillData>();
            lst = (List<BillData>)Session["BillData"];

            int itemCount = 0;
            double NetAmount = 0.0;
            foreach (var item in lst)
            {
                strcmd = "INSERT INTO SellChild " +
                           "(SellID, EquipmentID, SportsID, Quantity, Price) " +
                              "VALUES(" + SellID + "," + item.ProductID + "," + item.CateID + "," + item.Qty + "," + item.NetAmout + ")";
                SqlHelper.CommandExecuting(strcmd);

                LoadNetAmtNQty();

                DataTable datatable = getQutqtyID(item.ProductID);
                if (datatable.Rows.Count > 0)
                {
                    int qty;
                    if (string.IsNullOrEmpty(datatable.Rows[0]["OutQty"].ToString()))
                    {
                        string command1 = "UPDATE       Stocks " +
                                     "SET OutQty = " + item.Qty +
                                        "WHERE(EquipmentID = " + item.ProductID + ")";
                        SqlHelper.CommandExecuting(command1);
                    }
                    else
                    {
                        qty = Convert.ToInt32(datatable.Rows[0]["OutQty"].ToString());
                        qty += Convert.ToInt32(item.Qty);

                        string command = "UPDATE       Stocks " +
                                    "SET OutQty = " + qty +
                                       "WHERE(EquipmentID = " + item.ProductID + ")";
                        SqlHelper.CommandExecuting(command);
                    }
                }
                else
                {

                    strcmd = "INSERT INTO Stocks " +
                          "(EquipmentID, SportsId, InQty, OutQty, DateModified) " +
                            "VALUES(" + item.ProductID + "," + item.CateID + ",NULL," + item.Qty + ",'" + DateTime.Now.ToString("MM-dd-yyyy") + "')";
                    SqlHelper.CommandExecuting(strcmd);

                }
                strcmd = "SELECT        EquipmentQuantity " +
                             "FROM Equipments " +
                                "WHERE(EquipmentID = " + item.ProductID + ")";
                DataTable dt3 = SqlHelper.getData(strcmd);
                int quantity = Convert.ToInt32(dt3.Rows[0]["EquipmentQuantity"].ToString());
                quantity -= item.Qty;

                strcmd = "UPDATE       Equipments " +
                       "SET EquipmentQuantity = " + quantity + " WHERE EquipmentID =" + item.ProductID;
                SqlHelper.CommandExecuting(strcmd);
            }
            lblmsg.Text = "Proceeded to Buy the Items";
            lbltotalitem.Text = itemCount.ToString();
            lblNetAmt.Text = NetAmount.ToString();

            Session["BillData"] = null;
            Response.Redirect("~/BillPreview.aspx?id=" + SellID, false);
        }
    }

    private void LoadNetAmtNQty()
    {
        int qty = 0;
        double amt = 0.0d;
        List<BillData> lst = new List<BillData>();
        lst = (List<BillData>)Session["BillData"];
        foreach (var itm in lst)
        {
            qty += itm.Qty;
            amt += itm.NetAmout;
        }
        lbltotalitem.Text = qty.ToString();
        lblNetAmt.Text = amt.ToString("#,###.00");
    }

    protected void getRemainingQty(int index)
    {
        string strcmd = "SELECT        EquipmentQuantity " +
                   "FROM Equipments " +
                     "WHERE(EquipmentID = " + index + ")";

        DataTable dt = SqlHelper.getData(strcmd);
        lblQty.Text = dt.Rows[0]["EquipmentQuantity"].ToString();
    }

    protected DataTable getQutqtyID(int index)
    {
        string strcmd = "SELECT        OutQty " +
                         "FROM Stocks " +
                            "WHERE(EquipmentID = " + index + ")";
        DataTable dt = SqlHelper.getData(strcmd);
        return dt;
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DisplayContent();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int index = e.NewEditIndex;
        btnRegister.Text = "Update";

        hdfCusID.Value = GridView1.Rows[index].Cells[0].Text;
        txtCusName.Text = GridView1.Rows[index].Cells[1].Text;
        txtCusMobile.Text = GridView1.Rows[index].Cells[2].Text;
        txtDiscount.Text = GridView1.Rows[index].Cells[3].Text;
        txtAddress.Text = GridView1.Rows[index].Cells[4].Text;
        txtState.Text = GridView1.Rows[index].Cells[5].Text;
        txtCity.Text = GridView1.Rows[index].Cells[6].Text;
        txtTaluka.Text = GridView1.Rows[index].Cells[7].Text;
        txtState.Text.Trim();
        txtCity.Text.Trim();
        txtTaluka.Text.Trim();
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtCusName.Text) || string.IsNullOrEmpty(txtCusMobile.Text) || string.IsNullOrEmpty(txtDiscount.Text) || string.IsNullOrEmpty(txtAddress.Text) || string.IsNullOrEmpty(txtState.Text))
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "All Fields Mentioned Above is Mendetory to Fill";
            return;
        }

        if (!(txtCusMobile.Text.Length == 10))
        {
            lblmsg.Text = "Enter Valid Mobile Number!";
            txtCusMobile.Focus();
            return;
        }
        if (btnRegister.Text == "Register")
        {
            DataTable dt = getCustomer();
            if (!(dt.Rows.Count > 0))
            {
                string strcmd = "INSERT INTO Customers " +
                           " (CustomerName, CustomerMobile, Discount, CustomerAddress, State, City, Taluka) " +
                            " VALUES('" + txtCusName.Text + "','" + txtCusMobile.Text + "'," + Convert.ToSingle(txtDiscount.Text) + ", '" + txtAddress.Text + "','" + txtState.Text + "', '" + txtCity.Text + "', '" + txtTaluka.Text + "')";
                SqlHelper.CommandExecuting(strcmd);
                DisplayContent();
                Clears();
            }
            else
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Customer is Already Exists!";
            }
        }

        if (btnRegister.Text == "Update")
        {
            string strcmd = "UPDATE       Customers " +
                            " SET CustomerName ='" + txtCusName.Text + "', CustomerMobile ='" + txtCusMobile.Text + "', Discount =" + Convert.ToSingle(txtDiscount.Text) + ", CustomerAddress ='" + txtAddress.Text + "', State ='" + txtState.Text + "', City ='" + txtCity.Text + "', Taluka = '" + txtTaluka.Text + "' WHERE CustomerID=" + hdfCusID.Value;

            SqlHelper.CommandExecuting(strcmd);
            btnRegister.Text = "Register";
            DisplayContent();
            Clears();
        }
    }

    protected void DisplayContent()
    {
        string strcmd = "SELECT * FROM Customers";
        DataTable dt = SqlHelper.getData(strcmd);
        GridView1.DataBind();
    }

    protected void Clears()
    {
        btnRegister.Text = "Register";
        txtCusName.Text = "";
        txtCusMobile.Text = "";
        txtDiscount.Text = "";
        txtAddress.Text = "";
        txtState.Text = "";
        txtCity.Text = "";
        txtTaluka.Text = "";
    }

    protected DataTable getCustomer()
    {
        string strcmd = "SELECT        CustomerID" +
                       " FROM Customers " +
                        " WHERE(CustomerMobile = '" + txtCusMobile.Text + "')";
        DataTable dt = SqlHelper.getData(strcmd);
        return dt;
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Session["uname"].ToString()) || Session["RoleID"].ToString() != "1")
        {
            Response.Redirect("~/LoginPage.aspx");
        }
        string strcmd = "select * from Equipments";
        SqlHelper.CommandExecuting(strcmd);
        gridview1.DataBind();
    }

    public void UpdateEquipment()
    {
        DataTable dt= getEquipment();
        if (!(dt.Rows.Count > 0))
        {
            string strcmd = "update Equipments set EquipmetName='" + TextBox1.Text + "',EquipmentPrice=" +
            TextBox2.Text + ",EquipmentQuantity=" + TextBox3.Text + " where EquipmentID=" + hdfid.Value;

            SqlHelper.CommandExecuting(strcmd);
            gridview1.DataBind();
            Label5.ForeColor = System.Drawing.Color.Green;
            Label5.Text = "Data Updated Successfully!";
        }
        else
        {
            Label5.Text = "Name of the Entered Equipment is already exits";
        }
    }

    protected void SqlDataSource1_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.CommandText += " where EquipmentID=" + hdfid.Value;
    }



    protected void gridview1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Label5.Text = "";
        Button2.Text = "Update";
        Label4.Visible = false;
        TextBox3.Visible = false;
        btnRedirect.Visible = true;
        int index = e.NewEditIndex;
        hdfid.Value = gridview1.Rows[index].Cells[0].Text;
        TextBox1.Text = gridview1.Rows[index].Cells[2].Text;
        TextBox2.Text = gridview1.Rows[index].Cells[3].Text;
        TextBox3.Text = gridview1.Rows[index].Cells[4].Text;
        DropDownList1.SelectedValue = DropDownList1.Items.FindByText(gridview1.Rows[index].Cells[1].Text).Value;
        // DropDownList1.Items.Remove("-Select Sport-");       
    }

    protected void clear()
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        DropDownList1.SelectedValue = "-1";
        Label4.Visible = true;
        TextBox3.Visible = true;
        btnRedirect.Visible = false;
    }

    protected void AddEquipment()
    {
        if (Convert.ToInt32(TextBox3.Text) > 0)
        {
            string strcmd = "insert into Equipments values(" + Convert.ToInt32(DropDownList1.SelectedValue) + ",'" +
            TextBox1.Text + "'," + TextBox2.Text + "," + TextBox3.Text + ")";

            SqlHelper.CommandExecuting(strcmd);                                                                                                                                                                                                                                                              
            gridview1.DataBind();
            Label5.ForeColor = System.Drawing.Color.Green;
            Label5.Text = "Equipment Added Successfully!";
            clear();
        }
        else
        {
            Label5.Text = "Minimum Quantity Should be ONE";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Label5.Text = "";
        if (Button2.Text == "Update")
        {
            UpdateEquipment();
            clear();
            Button2.Text = "Add Equipment";  
        }
        else
        {
            if (!(DropDownList1.SelectedValue == "-1"))
            {
                string strcmd = "select * from Equipments where EquipmetName='" + TextBox1.Text.Trim() + "'";
                DataTable dt = SqlHelper.getData(strcmd);

                if (dt.Rows.Count > 0)
                {
                    Label5.Text = "Equipment Already Exists";
                   
                    TextBox1.Focus();
                }
                else
                {
                    AddEquipment();
                }
            }
            else
            {
                DropDownList1.Focus();
            }
        }

    }

    protected void btnlogout_Click1(object sender, EventArgs e)
    {
        Session["uname"] = "";
        Response.Redirect("~/LoginPage.aspx");
    }

    protected void gridview1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int index = Convert.ToInt32(e.RowIndex.ToString());
        EquipmentDelete(index);
    }
    protected void EquipmentDelete(int index)
    {
        int ID = Convert.ToInt32(gridview1.Rows[index].Cells[0].Text);
        string strcmd = "DELETE FROM Equipments WHERE(EquipmentID = " + ID + ")";
        SqlHelper.CommandExecuting(strcmd);
        gridview1.DataBind();
        Label5.Text = System.Drawing.Color.Green.ToString();
        Label5.Text = "Equipments Deleted Successfully!";
    }

    protected DataTable getEquipment()
    {
        string strcmd = "SELECT        EquipmentID "
         + " FROM Equipments " +
             " WHERE(EquipmetName = '" + TextBox1.Text + "')";

        DataTable dt=SqlHelper.getData(strcmd);
        return dt;
    }


    protected void btnRedirect_Click(object sender, EventArgs e)
    {
        string arg1 = DropDownList1.SelectedItem.Text;
        string arg2 = TextBox1.Text;

        Session["ChangeQuantity"] = "ChangeQuantity";
        Session["arg1"] = arg1;
        Session["arg2"] = arg2;
        Response.Redirect("~/Stock.aspx");
    }

   
}
<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="LoadBill.aspx.cs" Inherits="LoadBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <head>
        <style>
            .Apply {
                font-size: 20px;
                margin-left: 50px;
            }

            .Apply2 {
                width: 400px;
            }

            .Apply3 {
                width: 200px;
            }
        </style>
    </head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card bg-light mb-3" style="margin-top: 5px">
        <div class="card-header display-6" style="font-size:30px; text-decoration-color:bisque">Generate Bill</div>
        <div class="card-body">
            <div>
                <asp:Label ID="Label1" runat="server" Text="Customer Name : " CssClass="Apply"></asp:Label>
                &nbsp;
                <asp:DropDownList ID="ddlCustomer" runat="server" DataSourceID="SqlDataSource1" DataTextField="CustomerName" DataValueField="CustomerID" AppendDataBoundItems="True" CssClass="btn btn-secondary dropdown-toggle Apply2">
                    <asp:ListItem Value="-1">~Select Customer~</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ASPDemoConnectionString %>" SelectCommand="SELECT [CustomerName], [CustomerID] FROM [Customers]"></asp:SqlDataSource>

                <asp:Label ID="Label2" runat="server" CssClass="Apply" Style="margin-left: 200px" Text="Date : "></asp:Label>
                <asp:TextBox ID="txtdate" runat="server" TextMode="Date" CssClass="Apply3"></asp:TextBox>
                <br />
                <hr />
                <asp:DropDownList ID="ddlCategory" runat="server" Style="margin-left: 150px; width: 150px" DataSourceID="SqlDataSource2" DataTextField="SportName" DataValueField="SportsId" AppendDataBoundItems="True" CssClass="btn btn-secondary dropdown-toggle" AutoPostBack="True" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                    <asp:ListItem Value="-1">~Select Sport~</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ASPDemoConnectionString %>" SelectCommand="SELECT [SportsId], [SportName] FROM [Sports]"></asp:SqlDataSource>

                <asp:DropDownList ID="ddlProducts" runat="server" Style="margin-left: 250px; width: 250px;" CssClass="btn btn-secondary dropdown-toggle" AutoPostBack="True" OnSelectedIndexChanged="ddlProducts_SelectedIndexChanged">
                    <asp:ListItem Value="-1">~Select Product~</asp:ListItem>
                </asp:DropDownList>

                <asp:Label ID="Label3" runat="server" CssClass="Apply" Style="margin-left: 100px;" Text="Price : "></asp:Label>
                <asp:TextBox ID="txtprice" runat="server" Text="" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtprice" Display="Dynamic" ErrorMessage="Price Can't be Null" ForeColor="Red" ValidationGroup="one"></asp:RequiredFieldValidator>
                <br />
                <hr />
                <asp:Label ID="Label4" runat="server" CssClass="Apply" Style="margin-left: 100px;" Text="Remeaning Quantity : "></asp:Label>
                <asp:Label ID="lblQty" runat="server" CssClass="Apply" Text=""></asp:Label>

                <asp:Label ID="Label5" runat="server" CssClass="Apply" Style="margin-left: 100px;" Text="Enter Quantity : "></asp:Label>
                <asp:TextBox runat="server" ID="txtQuantity" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="Quantity Can't be Null" ForeColor="Red" ValidationGroup="one"></asp:RequiredFieldValidator>
                <asp:Button runat="server" CssClass="btn btn-outline-success Apply" Text="Add" ID="btnAdd" OnClick="btnAdd_Click" ValidationGroup="one" />
                
                <asp:Label ID="lblmsg" style="align-content:center" runat="server" CssClass="Apply"></asp:Label>
                <br />
                <hr />
                <asp:Label ID="Label6" runat="server" CssClass="Apply" Text="Net Amount : "></asp:Label>
                <asp:Label ID="lblNetAmount" runat="server" CssClass="Apply" Text=""></asp:Label>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body" style="margin-left:50px">
            <asp:GridView ID="grdDisplay" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="1218px" AutoGenerateColumns="False" OnRowEditing="grdDisplay_RowEditing" OnRowDeleting="grdDisplay_RowDeleting"  >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="Product ID" ReadOnly="True" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" ReadOnly="True" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CateID" HeaderText="Category ID" ReadOnly="True" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CatName" HeaderText="Category Name" ReadOnly="True" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="True" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Qty" HeaderText="Quantity" ReadOnly="True" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NetAmout" HeaderText="Net Amount" ReadOnly="True" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:ButtonField ButtonType="Image" ImageUrl="~/images/Edit (2).png" CommandName="Edit" HeaderText="Update" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:ButtonField>
                    <asp:ButtonField ButtonType="Image" CommandName="Delete" HeaderText="Cancle item" ImageUrl="~/images/delete.png" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:ButtonField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:hiddenfield runat="server" ID="UpdateIndex"></asp:hiddenfield>
 
        </div>
        <hr />
        <div style="margin-left:50px">
            <asp:Label ID="Label7" runat="server" Text="Total Items : "></asp:Label>
            <b><asp:Label ID="lbltotalitem" runat="server" Text=""></asp:Label></b>
            <asp:Label ID="Label8" style="margin-left:100px" runat="server" Text="Total Net Amount : "></asp:Label>
            <b><asp:Label ID="lblNetAmt" runat="server" Text=""></asp:Label></b>
        </div>
        <hr />
    </div>
    <div style="display:flex; margin-top:10px; margin-bottom:10px">
            <asp:button runat="server" style="margin-left:1200px" CssClass="btn btn-outline-info" text="Proceed to Buy" ID="btnbuy" Visible="False" OnClick="btnbuy_Click"  />
        </div>
</asp:Content>
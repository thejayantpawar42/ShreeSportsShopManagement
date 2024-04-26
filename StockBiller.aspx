<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="StockBiller.aspx.cs" Inherits="StockBiller" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />

    <!-- OnClientClick="return confirm('Are you sure you want add this sport?');" (works according to messagebox) -->
    <!-- Optional: Add Bootstrap JavaScript and Popper.js if needed -->
    <script src="Scripts/jquery-3.7.1.min.js"></script>
    <script src="Scripts/jquery-3.7.1.slim.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <head>
        <style>
            .button:hover {
                background-color: #e0e0e0;
            }
        </style>
    </head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="card" style="margin-top: 30px; justify-content: center">
        <div class="card-header display-6" style="font-size: 30px">
            Manage Stock
        </div>
        <div class="card-body text-center" style="font-size: 25px">
            <div class="dropdown">
                <asp:Label runat="server" Text="Select Sport : "></asp:Label>
                <asp:DropDownList runat="server" CssClass="btn btn-secondary dropdown-toggle" ID="ddlCategory" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" AutoPostBack="True" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:Label runat="server" CssClass="ml-2" Text="Select Equipment : "></asp:Label>
                <asp:DropDownList runat="server" CssClass="btn btn-secondary dropdown-toggle" ID="ddlproducts" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" AutoPostBack="True">
                </asp:DropDownList>
                <asp:Label runat="server" CssClass="ml-2" Text="Enter In-Quantity : " ID="label2"></asp:Label>
                <asp:TextBox ID="txtinqty" runat="server" TextMode="Number" ></asp:TextBox>
                <asp:Button ID="btnSave" runat="server" Text="Insert" CssClass="btn btn-primary ml-5 button" OnClick="btnSave_Click" />
                <asp:Label ID="lblmsg" runat="server" ForeColor="#669900"></asp:Label>
            </div>
        </div>
    </div>

    <div class="card" style="margin-top: 50px">
        <h5 class="card-header display-6" style="font-size: 25px">Products</h5>
        <div class="card-body" style="align-content: center; margin-left: 100px">
            <asp:GridView ID="DgvDisplay" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="1066px">
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>


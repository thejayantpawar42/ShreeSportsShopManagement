<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />

    <!-- Optional: Add Bootstrap JavaScript and Popper.js if needed -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <head>
        <style>
            .setup {
                text-align: center;
            }

            .textbox {
                width: 200px;
                padding: 10px;
                border: 1px solid #ccc;
                transition: border-color 0.3s ease;
            }

                /* Hover effect when the user hovers over the textbox */
                .textbox:hover {
                    border-color: #999;
                }

                /* Hover effect when the user selects the textbox */
                .textbox:focus {
                    border-color: cyan;
                }
        </style>
    </head>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card form-floating" style="margin-top: 5px">
        <div class="card">

            <h5 class="card-header display-6" style="font-size:30px">Product Manager
                
            </h5>
            <div style="margin-left: 500px">
            </div>
            <div class="card-body" style="justify-content: space-between">
                <div style="display:flex">
                    <asp:Label ID="Label1" runat="server" Text="Equipment Name : " ForeColor="#3399ff" CssClass="m-2  " Font-Size="20px"></asp:Label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control textbox" runat="server" CausesValidation="false" ValidationGroup="one"></asp:TextBox>

                    &nbsp;<asp:RequiredFieldValidator ID="rqName" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Equipment Name can't be Empty" ForeColor="Red" SetFocusOnError="True" ValidationGroup="one"></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Label ID="Label2" runat="server" Text="Equipment Price : " ForeColor="#3399FF" CssClass="m-2" Font-Size="20px"></asp:Label> 
                    &nbsp;<asp:TextBox ID="TextBox2" CssClass="form-control textbox" runat="server" TextMode="Number" CausesValidation="false" ValidationGroup="one"></asp:TextBox>

                    &nbsp;<asp:RequiredFieldValidator ID="rqName0" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Equipment Price can't be Empty" ForeColor="Red" SetFocusOnError="True" ValidationGroup="one"></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Label ID="Label4" runat="server" Text="Equipment Quantity : " ForeColor="#3399FF" CssClass="m-2" Font-Size="20px"></asp:Label>
                    &nbsp;<asp:TextBox ID="TextBox3" CssClass="form-control textbox" runat="server" CausesValidation="false" TextMode="Number" ValidationGroup="one"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="rqName1" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Equipment Quantity can't be Empty" ForeColor="Red" SetFocusOnError="True" ValidationGroup="one"></asp:RequiredFieldValidator>

                    <br />
                </div>
                <div style="margin-top: 30px; margin-left: 375px">
                    <asp:Label ID="Label3" runat="server" Text="Select Sport : " ForeColor="#3399ff" CssClass="m-2 ml-1" Font-Size="20px"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" CssClass="btn btn-info dropdown-toggle" DataTextField="SportName" DataValueField="SportsId" AppendDataBoundItems="True" AutoPostBack="True">
                        <asp:ListItem Selected="True" Value="-1">-Select Sport-</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ASPDemoConnectionString %>" SelectCommand="SELECT [SportsId], [SportName] FROM [Sports] ORDER BY [SportsId], [SportName]"></asp:SqlDataSource>

                    <asp:HiddenField ID="hdfsportid" runat="server" />

                    <asp:Button ID="Button2" CssClass="btn btn-primary ml-5" runat="server" Text="Add Equipment" OnClick="Button2_Click" ValidationGroup="one" />

                    <asp:Label ID="Label5" runat="server" Text="" ForeColor="Red" CssClass="ml-3" Font-Size="20px"></asp:Label>

                    <asp:Button ID="btnRedirect" CssClass="btn btn-outline-warning" runat="server" Text="Manage Quantity" OnClick="btnRedirect_Click" Visible="False"/>
                </div>
            </div>
        </div>
        <div class="card-body">
        </div>

    </div>

    <div style="margin: 75px">
        <asp:GridView runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="1168px" AllowPaging="True" ID="gridview1" DataKeyNames="EquipmentID" OnRowEditing="gridview1_RowEditing" AllowSorting="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnRowDeleting="gridview1_RowDeleting" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="EquipmentID" HeaderText="Equipment ID" InsertVisible="False" ReadOnly="True" SortExpression="EquipmentID">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="SportName" HeaderText="Sport Name" SortExpression="SportName" ReadOnly="True">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="EquipmetName" HeaderText="Equipmet Name" SortExpression="EquipmetName" ReadOnly="True">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="EquipmentPrice" HeaderText="Price" SortExpression="EquipmentPrice" ReadOnly="True">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="EquipmentQuantity" HeaderText="Quantity" SortExpression="EquipmentQuantity" ReadOnly="True">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:ButtonField ButtonType="Image" CommandName="Edit" HeaderText="Update Equipment" ImageUrl="~/images/Edit (2).png" ShowHeader="True" Text="edit">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:ButtonField>
                <asp:ButtonField ButtonType="Image" CommandName="Delete" HeaderText="Remove " ImageUrl="~/images/delete.png" ShowHeader="True" Text="delete">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:ButtonField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ASPDemoConnectionString %>" SelectCommand="SELECT Equipments.EquipmentID, Sports.SportName, Equipments.EquipmetName, Equipments.EquipmentPrice, Equipments.EquipmentQuantity FROM Equipments INNER JOIN Sports ON Equipments.SportsId = Sports.SportsId"
            UpdateCommand="UPDATE Equipments SET EquipmetName ='@name', EquipmentPrice =@price, EquipmentQuantity =@quantity" OnUpdating="SqlDataSource1_Updating" DeleteCommand="DELETE FROM Equipments WHERE (EquipmentID = @EquipmentID)">

            <DeleteParameters>
                <asp:Parameter Name="EquipmentID" />
            </DeleteParameters>

            <UpdateParameters>
                <asp:Parameter Name="price" Type="Int32" />
                <asp:Parameter Name="quantity" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:HiddenField ID="hdfid" runat="server" />
        <asp:HiddenField ID="hdfspid" runat="server" />
    </div>
    <br />
</asp:Content>


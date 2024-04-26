<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sports.aspx.cs" Inherits="Sports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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

    <div class="card" style="margin-top: 30px; justify-content: center">
        <div class="card-header display-6" style="font-size: 30px">
            Sports Manager
        </div>
        <div class="card-body text-center" style="font-size: 25px">
            <asp:Label ID="Label1" runat="server" Text="Enter Sport Name : "></asp:Label>
            <asp:TextBox ID="TextBox1" CssClass="textbox" runat="server" CausesValidation="false" ValidationGroup="one"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Must Enter Sport Name First" ControlToValidate="TextBox1" Display="Dynamic" ForeColor="#CC3300" ValidationGroup="one">Sport Name is Mandetory</asp:RequiredFieldValidator>
            <asp:Button ID="Button1" CssClass="ml-3 btn btn-dark" runat="server" Text="Add" OnClick="Button1_Click" ValidationGroup="one" />
            &nbsp;&nbsp;
            <asp:Label ID="lblerror" runat="server" ForeColor="#CC3300"></asp:Label>
        </div>
    </div>

    <div style="margin-top: 40px">
        <div class="card">
            <div class="card-body" style="margin: 50px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="1191px" OnRowEditing="GridView1_RowEditing" DataKeyNames="SportsId" CssClass="ml6 " AllowPaging="True" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="SportsId" HeaderText="Sports Id" InsertVisible="False" ReadOnly="True" SortExpression="SportsId">
                            <ItemStyle VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SportName" HeaderText="Sport Name" SortExpression="SportName" ReadOnly="True">

                            <ItemStyle VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:ButtonField ButtonType="Image" CommandName="Edit" HeaderText="Update Sport" ImageUrl="~/images/Edit (2).png" ShowHeader="True" Text="edit">
                            <ItemStyle VerticalAlign="Middle" />
                        </asp:ButtonField>
                    </Columns>

                    <EditRowStyle BackColor="#999999" />

                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ASPDemoConnectionString %>" SelectCommand="SELECT [SportName], [SportsId] FROM [Sports]"></asp:SqlDataSource>
                <asp:HiddenField ID="hdfsportsid" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>



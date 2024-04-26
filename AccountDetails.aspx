<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AccountDetails.aspx.cs" Inherits="AccountDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


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
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card" style="margin-top: 40px">
        <h5 class="card-header">Account Handler</h5>
        <div class="card-body" style="display: flex">
            <asp:Label ID="Label2" runat="server" Style="margin-top: 5px; font-size: 20px;" Text="Enter UserName : " ForeColor="Blue"></asp:Label>
            &nbsp;
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control textbox"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="Username can't be EMPTY" ControlToValidate="TextBox1" Display="Dynamic" ForeColor="Red" ValidationGroup="one"></asp:RequiredFieldValidator>

            <asp:Label ID="Label3" runat="server" Style="margin-top: 5px; font-size: 20px; margin-left: 100px;" Text="Enter Password : " ForeColor="Blue"></asp:Label>

            <asp:TextBox ID="TextBox2" Style="margin-left: 10px;" runat="server" CssClass="form-control textbox" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="Password can't be EMPTY" ControlToValidate="TextBox2" Display="Dynamic" ForeColor="Red" ValidationGroup="one"></asp:RequiredFieldValidator>
            <asp:DropDownList Style="margin-left: 80px" CssClass="btn btn-info dropdown-toggle" ID="ddlCategory" runat="server" DataTextField="RoleName" DataValueField="RoleID" AutoPostBack="False">
                <asp:ListItem Value="-1">~Select Category~</asp:ListItem>
            </asp:DropDownList>
        </div>
        <br />
        <hr />
        <div style="color: blue; font-size: 20px; margin-bottom: 50px;">
            <asp:CheckBox ID="ChechActive" Style="margin-left: 100px; font-size: 20px" runat="server" Height="30px" /><asp:Label ID="Label1" runat="server" Style="margin-left: 10px;" Text="Active User"></asp:Label>
            <asp:Button ID="Button1" Style="margin-left: 100px;" runat="server" Text="Add User" CssClass="btn btn-primary" OnClick="Button1_Click" ValidationGroup="one" />
            <asp:Label ID="lblmsg" Style="margin-left: 50px;" runat="server"></asp:Label>
        </div>
    </div>

    <div>
        <div class="card text-dark bg-light mb-3" style="margin-top: 70px; align-items: center;">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowEditing="GridView1_RowEditing1" Width="1131px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:ButtonField ButtonType="Image" CommandName="Edit" HeaderText="Edit Admin" ImageUrl="~/images/Edit (2).png">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:ButtonField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </div>


    </div>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

</asp:Content>
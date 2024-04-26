<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>

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
    <div class="card form-floating" style="margin-top: 5px">
        <div class="card">

            <h5 class="card-header display-6" style="font-size: 30px">Report Manager
                
            </h5>
            <div style="margin-left: 500px">
            </div>
            <div class="card-body" style="justify-content: space-between">
                <div style="display: flex">
                    <asp:Label ID="Label1" Style="font-size: 30px;" ForeColor="Blue" runat="server" Text="From Date : "></asp:Label>
                    <asp:TextBox ID="txtFromDate" CssClass="textbox" Style="margin-left: 5px; margin-top: 5px;" runat="server" TextMode="Date" AutoPostBack="True"></asp:TextBox>

                    <asp:Label ID="Label2" runat="server" ForeColor="Blue" Style="margin-left: 300px; font-size: 30px;" Text="To Date : "></asp:Label>
                    <asp:TextBox ID="txtToDate" CssClass="textbox" Style="margin-left: 5px; margin-top: 5px;" runat="server" TextMode="Date" AutoPostBack="True"></asp:TextBox>
                    <asp:Button ID="Button1" Style="margin-left: 50px;" runat="server" CssClass="btn btn-outline-info" Text="Generate Report" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="card form-floating" style="margin-top: 150px">
        <div class="card">

            <h5 class="card-header display-6" style="font-size: 30px">Products
                
            </h5>
            <div style="margin-left: 500px">
            </div>
            <div class="card-body" style="justify-content: space-between">
                <h2>
                    <asp:Label ID="lblShow" runat="server" Visible="false" ForeColor="SpringGreen" Text="Data Not Found"></asp:Label></h2>
                <asp:GridView ID="GridView1" runat="server" Style="margin-left: 100px" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1078px" AllowPaging="false">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>


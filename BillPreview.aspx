<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="BillPreview.aspx.cs" Inherits="BillPreview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">



    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function LoadBill() {
            var panel = document.getElementById("<%=Panel1.ClientID%>");
            var printWindow = window.open('', '', 'hight=3508,width=2480');
            printWindow.document.write('<html><head><title>Shree Sports Shop Bill</title></head><body>');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
    </script>
    <asp:button id="btnPrint" cssclass="btn btn-outline-success ml-2" runat="server" text="Print" onclientclick="return LoadBill();" />
    <asp:hiddenfield id="HiddenField1" runat="server" />
    <asp:panel ID="Panel1" runat="server">
        <style>
            /*
  Common invoice styles. These styles will work in a browser or using the HTML
  to PDF anvil endpoint.
*/
            body {
                background-color: #F6F6F6;
                margin: 0;
                padding: 0;
            }

            h1, h2, h3, h4, h5, h6 {
                margin: 0;
                padding: 0;
            }

            p {
                margin: 0;
                padding: 0;
            }

            .container {
                width: 80%;
                margin-right: auto;
                margin-left: auto;
            }

            .brand-section {
                background-color: #0d1033;
                padding: 10px 40px;
            }

            .logo {
                width: 50%;
            }

            .row {
                display: flex;
                flex-wrap: wrap;
            }

            .col-6 {
                width: 50%;
                flex: 0 0 auto;
            }

            .text-white {
                color: #fff;
            }

            .company-details {
                float: right;
                text-align: right;
            }

            .body-section {
                padding: 16px;
                border: 1px solid gray;
            }

            .heading {
                font-size: 20px;
                margin-bottom: 08px;
            }

            .sub-heading {
                color: #262626;
                margin-bottom: 05px;
            }

            table {
                background-color: #fff;
                width: 100%;
                border-collapse: collapse;
            }

                table thead tr {
                    border: 1px solid #111;
                    background-color: #f2f2f2;
                }

                table td {
                    vertical-align: middle !important;
                    text-align: center;
                }

                table th, table td {
                    padding-top: 08px;
                    padding-bottom: 08px;
                }

            .table-bordered {
                box-shadow: 0px 0px 5px 0.5px gray;
            }

                .table-bordered td, .table-bordered th {
                    border: 1px solid #dee2e6;
                }

            .text-right {
                text-align: end;
            }

            .w-20 {
                width: 20%;
            }

            .float-right {
                float: right;
            }
        </style>
    
        <div class="container">
            <div class="brand-section">
                <div class="row">
                    <div class="col-6">
                        <h1 class="text-white">Shree Sports Shopee</h1>
                        <h3 class="text-white" style="margin-left: 50px">(Execlusive Dealears of Puma)</h3>
                    </div>
                    <div class="col-6">
                        <div class="company-details">
                            <p class="text-white">Shop no.42, Saat Rasta,</p>
                            <p class="text-white">Solapur, Maharashtra</p>
                            <p class="text-white">+91 80808 86734</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="body-section">
                <div class="row">
                    <div class="col-6">
                        <h2 class="heading">Invoice No.:
                            <asp:Label ID="lblInv" runat="server" Text=""></asp:Label></h2>
                        <p class="sub-heading">
                            Order Date:
                            <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
                        </p>
                        <p class="sub-heading">
                            Biller :
                            <asp:Label ID="lblBiller" runat="server" Text=""></asp:Label>
                        </p>
                    </div>
                    <div class="col-6">
                        <p class="sub-heading">
                            Full Name:
                            <asp:Label ID="lblCustName" runat="server" Font-Bold="True"></asp:Label>
                        </p>
                        <p class="sub-heading">
                            Phone Number:
                            <asp:Label ID="lblMob" runat="server" Font-Bold="True"></asp:Label>
                        </p>
                        <p class="sub-heading">
                            Address:
                            <asp:Label ID="lblAdd" runat="server" Text=""></asp:Label>
                        </p>
                        <p class="sub-heading">
                            Taluka,City,State:
                            <asp:Label ID="lblState" runat="server" Text=""></asp:Label>
                        </p>
                    </div>
                </div>
            </div>

            <div class="body-section">
                <h3 class="heading">Products</h3>
                <br />
                <asp:Repeater ID="RepeatInformation" runat="server">
                    <HeaderTemplate>
                        <table class="table-bordered tblcolor">
                            <tr>
                                <b>
                                    <td style="font-size: large; font: 800">Products  
                                    </td>
                                    <td class="w-20" style="font-size: large; font: 800; fon">Price
                                    </td>
                                    <td class="w-20" style="font-size: large; font: 800">Quantity
                                    </td>
                                    <td class="w-20" style="font-size: large; font: 800">Amount
                                    </td>
                                </b>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="tblrowcolor">
                            <td>
                                <%#DataBinder.Eval(Container,"DataItem.EquipmetName")%>  
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container,"DataItem.Price")%>  
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container,"DataItem.Quantity")%>  
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container,"DataItem.Amount")%>  
                            </td>
                        </tr>
                    </ItemTemplate>

                    <AlternatingItemTemplate>
                        <tr>
                            <td>
                                <%#DataBinder.Eval(Container,"DataItem.EquipmetName")%>  
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container,"DataItem.Price")%>  
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container,"DataItem.Quantity")%>  
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container,"DataItem.Amount")%>  
                            </td>
                        </tr>
                    </AlternatingItemTemplate>

                </asp:Repeater>
                <table class="table-bordered tblcolor">
                    <tr>
                        <td class="text-right" style="font-size: large; font: 800">Net Quantity : </td>
                        <td>
                            <asp:Label ID="lblQty" runat="server" Text=""></asp:Label>
                        </td>


                        <td class="text-right" style="font-size: large; font: 800">Net Amount : </td>
                        <td>
                            <asp:Label ID="lblAmt" runat="server" Text=""></asp:Label>
                        </td>

                    </tr>
                    <tr>
                        <td colspan="3" class="text-right" style="font-size: large; font: x-large">Discount : </td>
                        <td>
                            <asp:Label ID="lblDisc" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="text-right" style="font-size: large; font: 800">Grand Total : </td>
                        <td>
                            <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label></td>
                    </tr>
                </table>

                <br />
                <h3 class="heading">Payment Status: Paid</h3>
                <h3 class="heading">Payment Mode: Cash on Delivery</h3>
            </div>

            <div class="body-section">
                <p>
                    &copy; Copyright 2024 - Shree Sports Shope. All rights reserved. 
                
                </p>
            </div>
        </div>
    </asp:panel>
</asp:Content>


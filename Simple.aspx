﻿
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Simple.aspx.cs" Inherits="Simple"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />

    <!-- Optional: Add Bootstrap JavaScript and Popper.js if needed -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <div class="row row-cols-1 row-cols-md-2 g-4" style="margin-top:35px">
        <div class="col">
            <div class="card">
                <img src="images/Orders.jpg" class="card-img-top" alt="..." width="50px" height="200px">
                <hr />
                <div class="card-body" style="background-color:chocolate">
                    <h5 class="card-title" style="font-size:40px; color:whitesmoke">Orders</h5>
                    <asp:label runat="server" style="font-size:30px; color:whitesmoke" text="Total Orders : "></asp:label>
                    <b><asp:label runat="server" style="font-size:30px" ID="lblorders" text=""></asp:label></b>
                    <hr />
                    <a href="Reports.aspx">View Reports...</a>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <img src="images/Category.jpg" class="card-img-top" alt="..." width="50px" height="200px">
                <hr />
                <div class="card-body" style="background-color:chocolate">
                    <h5 class="card-title" style=" color:whitesmoke; font-size:40px;">Category</h5>
                    <asp:label runat="server" text="Total Categories : " style=" color:whitesmoke; font-size:30px;"></asp:label>
                    <asp:label runat="server" style="font-size:30px" ID="lblCategory" text=""></asp:label>
                    <hr />
                    <a href="Sports.aspx">View Sports...</a>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <img src="images/Product.jpg" class="card-img-top" alt="..." width="50px" height="200px">
                <hr />
                <div class="card-body" style="background-color:chocolate">
                    <h5 class="card-title" style=" color:whitesmoke; font-size:40px;">Product</h5>
                    <asp:label runat="server" text="Total Products : " style=" color:whitesmoke; font-size:30px;"></asp:label>
                    <asp:label runat="server" style="font-size:30px" ID="lblProducts" text=""></asp:label>
                    <hr />
                    <a href="Products.aspx">View Products...</a>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <img src="images/Money1.jpg" class="card-img-top" alt="..." width="50px" height="200px">
                <hr />
                <div class="card-body" style="background-color:chocolate;">
                    <h5 class="card-title" style=" color:whitesmoke; font-size:40px;">Earnings</h5>
                    <asp:label runat="server" text="Total Earnings : " style=" color:whitesmoke; font-size:30px;"></asp:label><br />
                    <asp:label runat="server" style="font-size:30px; margin-left:60px; margin-left:50px;" ID="lblTotaRs" text=""></asp:label>
                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>

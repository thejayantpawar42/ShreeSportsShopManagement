<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                border-color: darkviolet;
            }

        .hover-effect {
            width: 200px;
            padding: 10px;
            border: 1px solid #ccc; /* Default border color */
            transition: border-color 0.3s ease; /* Transition effect for border color change */
        }

            .hover-effect:hover {
                border-color: darkviolet; /* New border color on hover */
            }

            .hover-effect:focus {
                border-color: darkred;
            }

        .bgColor {
            background-color: darkgray;
        }

        .bgImage {
            background-image: url('images/ChangePassword.jpg');
            background-repeat: no-repeat;
        }
    </style>
    <head>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="bgImage">
        <div class="card border-light mb-3 bgColor" style="margin-top: 150px">
            <div class="card-header display-6" style="font-size: 30px">
                <asp:Label ID="Label4" ForeColor="WhiteSmoke" runat="server" Text="Change Password "></asp:Label></div>
            <div class="card-body">
                <asp:Label ID="Label1" ForeColor="WhiteSmoke" runat="server" Font-Size="20px" Text="User Name : "></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" Text="" Style="margin-bottom: 25px; margin-top: 25px; font-size: larger" ReadOnly="True"></asp:TextBox>
                <br />
                <hr />

                <div style="display: flex">
                    <asp:Label ID="Label2" Style="margin-top: 20px;" runat="server" Text="Enter New Password : " ForeColor="WhiteSmoke" CssClass="m-2" Font-Size="20px"></asp:Label>
                    &nbsp;<asp:TextBox ID="TextBox2" CssClass=" form-control hover-effect" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:Label ID="Label3" runat="server" Text="Re-Enter Password : " ForeColor="WhiteSmoke" Style="margin-left: 200px; margin-top: 5px" Font-Size="20px"></asp:Label>
                    &nbsp;<asp:TextBox ID="TextBox3" CssClass=" form-control hover-effect" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Can't match with the password" ForeColor="Red"></asp:CompareValidator>
                </div>
                <br />
                <hr />
                <div style="align-content: center">
                    <asp:Button ID="Button1" CssClass="btn btn-outline-info" Style="margin-left: 600px" runat="server" Text="Change Password" BorderColor="#99FF33" ForeColor="WhiteSmoke" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />

    <!-- Optional: Add Bootstrap JavaScript and Popper.js if needed -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <style media="screen">
        *,
        *:before,
        *:after {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #080710;
        }

        .background {
            width: 430px;
            height: 520px;
            position: absolute;
            transform: translate(-50%,-50%);
            left: 50%;
            top: 50%;
        }

            .background .shape {
                height: 200px;
                width: 200px;
                position: absolute;
                border-radius: 50%;
                z-index:0;
            }

        .shape:first-child {
            background: linear-gradient( #1845ad, #23a2f6 );
            left: -80px;
            top: -80px;
            z-index:0;
        }

        .shape:last-child {
            background: linear-gradient( to right, #ff512f, #f09819 );
            right: -30px;
            bottom: -80px;
        }

        form {
            height: 520px;
            width: 400px;
            background-color: rgba(255,255,255,0.13);
            position: absolute;
            transform: translate(-50%,-50%);
            top: 50%;
            left: 50%;
            border-radius: 10px;
            backdrop-filter: blur(10px);
            border: 2px solid rgba(255,255,255,0.1);
            box-shadow: 0 0 40px rgba(8,7,16,0.6);
            padding: 50px 35px;
        }

            form * {
                font-family: 'Poppins',sans-serif;
                color: #ffffff;
                letter-spacing: 0.5px;
                outline: none;
                border: none;
            }

            form h3 {
                font-size: 32px;
                font-weight: 500;
                line-height: 42px;
                text-align: center;
            }

        label {
            display: block;
            margin-top: 30px;
            font-size: 16px;
            font-weight: 500;
        }

        input {
            display: block;
            height: 50px;
            width: 100%;
            background-color: rgba(255,255,255,0.07);
            border-radius: 3px;
            padding: 0 10px;
            margin-top: 8px;
            font-size: 14px;
            font-weight: 300;
        }

        ::placeholder {
            color: #e5e5e5;
        }

        button {
            margin-top: 50px;
            width: 100%;
            background-color: #ffffff;
            color: #080710;
            padding: 15px 0;
            font-size: 18px;
            font-weight: 600;
            border-radius: 5px;
            cursor: pointer;
        }

        .social {
            margin-top: 30px;
            display: flex;
        }

            .social div {
                background: red;
                width: 150px;
                border-radius: 3px;
                padding: 5px 10px 10px 5px;
                background-color: rgba(255,255,255,0.27);
                color: #eaf0fb;
                text-align: center;
            }

                .social div:hover {
                    background-color: rgba(255,255,255,0.47);
                }

            .social .fb {
                margin-left: 25px;
            }

            .social i {
                margin-right: 4px;
            }

        .top {
            margin-top: 70px;
        }
        .Heading{
            z-index:-1000;
            align-items:center;
            text-align:center;
            justify-content:center;
        }
    </style>
</head>
<body>
    <div>
    <%--   <h1 style="color:aqua;" class="Heading">SHREE Sports Shop(Execlusive Delears Of PUMA)</h1>--%>
    </div>
    <div>
        <div class="background">

            <div class="shape"></div>
            <div class="shape"></div>
        </div>
        <form runat="server">
           
            <h3 style="color: #F12679">Login</h3>
            <br />

            <asp:Label ID="Label3" runat="server" Text="Enter Username :" ForeColor="Cyan" CssClass="mt-2"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

            <br />

            <asp:Label ID="Label2" runat="server" Text="Enter Password :" ForeColor="Cyan" CssClass="mt-2"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>

            <br />
            <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>

            <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-outline-info top" OnClick="Button1_Click" />

            <asp:GridView ID="GridView1" runat="server" Visible="false"></asp:GridView>
        </form>
    </div>

</body>
</html>

<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Customer2.aspx.cs" Inherits="Customer2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card border-primary mb-3" >
        <div class="card-header display-6 card border-primary" style="font-family: 'Segoe UI'; font-size: 30px;">Customer Information</div>
        <div class="card-body text-primary" style="font-size: large">
            <asp:Label runat="server" Text="Customer Name : " Style="font-size: 20px"></asp:Label>
            <asp:TextBox runat="server" CssClass="" BorderColor="#FFCCFF" ID="txtCusName"></asp:TextBox>
            <asp:Label runat="server" Text="Mobile Number : " Style="font-size: 20px; margin-left: 250px"></asp:Label>
            <asp:TextBox runat="server" MaxLength="10" TextMode="Number" CssClass="textbox" BorderColor="#FFCCFF" ID="txtCusMobile"></asp:TextBox>
            <ajaxToolkit:FilteredTextBoxExtender ID="txtCusMobile_FilteredTextBoxExtender" runat="server" BehaviorID="txtCusMobile_FilteredTextBoxExtender" TargetControlID="txtCusMobile" ValidChars="0123456789" />
            <br />
            <hr />
            <asp:Label runat="server" Text="Discount : " Style="font-size: 20px; margin-left: 100px"></asp:Label>
            <asp:TextBox runat="server" CssClass="" BorderColor="#FFCCFF" ID="txtDiscount"></asp:TextBox>
            <asp:Label runat="server" Text="Address : " Style="font-size: 20px; margin-left: 350px"></asp:Label>
            <asp:TextBox runat="server" MaxLength="500" CssClass="textbox" BorderColor="#FFCCFF" ID="txtAddress"></asp:TextBox>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label runat="server" Text="State : " Style="font-size: 20px; margin-top: 30px; margin-left: 100px"></asp:Label>
            <asp:TextBox runat="server" Style="margin-top: 30px;" CssClass="textbox" BorderColor="#FFCCFF" ID="txtState"></asp:TextBox>
            <asp:Label runat="server" Text="City : " Style="font-size: 20px; margin-top: 30px; margin-left: 100px"></asp:Label>
            <asp:TextBox runat="server" Style="margin-top: 30px;" CssClass="textbox" BorderColor="#FFCCFF" ID="txtCity"></asp:TextBox>
            <asp:Label runat="server" Text="Taluka : " Style="font-size: 20px; margin-top: 30px; margin-left: 100px"></asp:Label>
            <asp:TextBox runat="server" Style="margin-top: 30px;" CssClass="textbox" BorderColor="#FFCCFF" ID="txtTaluka"></asp:TextBox>
            <br />
            <hr />
            <div style="align-content: center">
                <asp:Button runat="server" CssClass="btn btn-outline-success btn-lg btn-block" Style="width: 600px; margin-left: 350px" Text="Register" ID="btnRegister" OnClick="btnRegister_Click" />

                <hr />
                <asp:Label ID="lblmsg" runat="server" Text="" Style="font-size: 20px; margin-top: 30px; margin-left: 400px"></asp:Label>
                <hr />
            </div>
        </div>
    </div>
    <div class="container-fluid" style="align-content: center; margin-left: 150px">
        &nbsp;<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" OnRowEditing="GridView1_RowEditing" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
                <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" ReadOnly="True" />
                <asp:BoundField DataField="CustomerMobile" HeaderText="CustomerMobile" SortExpression="CustomerMobile" ReadOnly="True" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" ReadOnly="True" />
                <asp:BoundField DataField="CustomerAddress" HeaderText="CustomerAddress" SortExpression="CustomerAddress" ReadOnly="True" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" ReadOnly="True" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" ReadOnly="True" />
                <asp:BoundField DataField="Taluka" HeaderText="Taluka" SortExpression="Taluka" ReadOnly="True" />
                <asp:ButtonField ButtonType="Image" CommandName="Edit" HeaderText="Update" ImageUrl="~/images/Edit (2).png" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ASPDemoConnectionString %>" SelectCommand="SELECT [CustomerID], [CustomerName], [CustomerMobile], [Discount], [CustomerAddress], [State], [City], [Taluka] FROM [Customers]"></asp:SqlDataSource>
        <asp:HiddenField ID="hdfCusID" runat="server" />

    </div>
</asp:Content>


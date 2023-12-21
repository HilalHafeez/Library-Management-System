<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bookissuing.aspx.cs" Inherits="Lms.bookissuing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            //$(document).ready(function () {
            //$('.table').DataTable();
            // });

            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            //$('.table1').DataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">

                <div class="card">

                    <div class="card-body">
                        <div class="row">

                            <div class="col">
                                <center>
                                    <h4>Book Issuing</h4>
                                </center>

                            </div>
                        </div>
                        <div class="row">

                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/books1.png" />
                                </center>

                            </div>
                        </div>


                        <div class="row">

                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Registration No</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Reg.  No"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Book ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:Button Class="btn btn-dark" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>User Name</label>
                                    <asp:TextBox ReadOnly="true" CssClass="form-control" ID="TextBox3" runat="server" placeholder="User Name"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Book Name</label>
                                    <asp:TextBox ReadOnly="true" CssClass="form-control" ID="TextBox4" runat="server" placeholder="Book Name"></asp:TextBox>

                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Start Date</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>End Date</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>

                                </div>
                            </div>

                        </div>



                        <div class="row">

                            <div class="col-6">
                                <asp:Button class="btn btn-primary bnt-lg btn-block" ID="Button2" runat="server" Text="Issue" OnClick="Button2_Click" />

                            </div>
                            <div class="col-6">
                                <asp:Button class="btn btn-success bnt-lg btn-block" ID="Button3" runat="server" Text="Return" OnClick="Button3_Click" />
                            </div>
                        </div>
                        <br>
                        <div class="row">

                            <div class="col-6">
                                <asp:Button class="btn btn-danger bnt-lg btn-block" ID="Button5" runat="server" Text="CheckFine" OnClick="Button5_Click" />
                            </div>
                            <div class="col-6">
                                <asp:Button class="btn btn-block bnt-lg btn-warning" ID="Button4" runat="server" Text="ReIssue" OnClick="Button4_Click" />
                            </div>

                        </div>

                        <div class="row">
                        </div>
                    </div>

                </div>
                <a href="homepage.aspx"><<< Back to Home</a><br>
                <br>
            </div>

            <div class="col-md-7">
                <div class="card">

                    <div class="card-body">
                        <div class="row">

                            <div class="col">
                                <center>
                                    <h4>Issued Book List</h4>
                                </center>

                            </div>
                        </div>
                        <div class="row">

                            <div class="col">
                                <hr>
                            </div>
                        </div>


                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString2 %>" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>

                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="book_id" OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="registration_no" HeaderText="Reg No" SortExpression="registration_no"></asp:BoundField>
                                        <asp:BoundField DataField="book_id" HeaderText="Book ID" ReadOnly="True" SortExpression="book_id"></asp:BoundField>
                                        <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name"></asp:BoundField>
                                        <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name"></asp:BoundField>
                                        <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date"></asp:BoundField>
                                        <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

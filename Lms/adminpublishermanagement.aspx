<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminpublishermanagement.aspx.cs" Inherits="Lms.adminpublishermanagement" %>

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
    <div class="container">
        <div class="row">
            <div class="col-md-5">

                <div class="card">

                    <div class="card-body">
                        <div class="row">

                            <div class="col">
                                <center>
                                    <h4>Publisher Details</h4>
                                </center>

                            </div>
                        </div>
                        <div class="row">

                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/publisher.png" />
                                </center>

                            </div>
                        </div>


                        <div class="row">

                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-4">

                                <label>Publisher ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Publisher Name</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Publisher Name"></asp:TextBox>

                                </div>
                            </div>
                        </div>






                        <div class="row">

                            <div class="col-4 mx-auto">
                                <asp:Button class="btn btn-success bnt-lg btn-block" ID="Button2" runat="server" Text="Add" OnClick="Button2_Click1" />
                            </div>
                            <div class="col-4 mx-auto">
                                <asp:Button class="btn btn-warning bnt-lg btn-block" ID="Button3" runat="server" Text="Update" OnClick="Button3_Click1" />
                            </div>
                            <div class="col-4 mx-auto">
                                <asp:Button class="btn btn-danger bnt-lg btn-block" ID="Button4" runat="server" Text="Delete" OnClick="Button4_Click" />
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
                                    <h4>Publisher List</h4>
                                </center>

                            </div>
                        </div>
                        <div class="row">

                            <div class="col">
                                <hr>
                            </div>
                        </div>


                        <div class="row">
                           
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="publisher_id">
                                    <Columns>
                                        <asp:BoundField DataField="publisher_id" HeaderText="Publisher ID" ReadOnly="True" SortExpression="publisher_id"></asp:BoundField>
                                        <asp:BoundField DataField="publisher_name" HeaderText="Publisher Name" SortExpression="publisher_name"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [publisher_matser_tbl]"></asp:SqlDataSource>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

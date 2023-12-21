<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminusermanagement.aspx.cs" Inherits="Lms.adminusermanagement" %>

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
                                    <h4>User Details</h4>
                                </center>

                            </div>
                        </div>
                        <div class="row">

                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/generaluser.png" />
                                </center>

                            </div>
                        </div>


                        <div class="row">

                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-3">
                                <label>Reg. No</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TextBox1" runat="server" placeholder="Reg. No"></asp:TextBox>
                                        <asp:LinkButton Class="btn btn-primary" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox ReadOnly="true" CssClass="form-control" ID="TextBox2" runat="server" placeholder="Ful Name"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Account Status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TextBox7" runat="server" placeholder="Status" ReadOnly="true"></asp:TextBox>
                                        <asp:LinkButton Class="btn btn-success mr-1" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton Class="btn btn-warning mr-1" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton Class="btn btn-danger mr-1" ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    </div>

                                </div>
                            </div>
                        </div>


                        <div class="row">

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Date Of BIrth</label>
                                    <asp:TextBox ReadOnly="true" CssClass="form-control" ID="TextBox3" runat="server" placeholder="DOB"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Contact No</label>
                                    <asp:TextBox ReadOnly="true" CssClass="form-control" ID="TextBox8" runat="server" placeholder="Contact No"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-5">
                                <div class="form-group">
                                    <label>Email ID</label>
                                    <asp:TextBox ReadOnly="true" CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID"></asp:TextBox>

                                </div>
                            </div>

                        </div>
                        <div class="row">

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>State</label>
                                    <asp:TextBox ReadOnly="true" CssClass="form-control" ID="TextBox9" runat="server" placeholder="State"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>City</label>
                                    <asp:TextBox ReadOnly="true" CssClass="form-control" ID="TextBox10" runat="server" placeholder="City"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Pincode</label>
                                    <asp:TextBox ReadOnly="true" CssClass="form-control" ID="TextBox11" runat="server" placeholder="Pincode"></asp:TextBox>

                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Full Address</label>
                                    <asp:TextBox CssClass="form-control" ReadOnly="true" ID="TextBox6" runat="server" placeholder="Your Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>

                                </div>
                            </div>

                        </div>



                        <div class="row">

                            <div class="col-8 mx-auto">
                                <asp:Button class="btn btn-danger bnt-lg btn-block" ID="Button2" runat="server" Text="Delete Permenently" OnClick="Button2_Click" />
                            </div>


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
                                    <h4>User List</h4>
                                </center>

                            </div>
                        </div>
                        <div class="row">

                            <div class="col">
                                <hr>
                            </div>
                        </div>


                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString2 %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="registration_no">
                                    <Columns>
                                        <asp:BoundField DataField="registration_no" HeaderText="Reg No" ReadOnly="True" SortExpression="registration_no"></asp:BoundField>
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name"></asp:BoundField>
                                        <asp:BoundField DataField="account_status" HeaderText="Status" SortExpression="account_status"></asp:BoundField>
                                        <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no"></asp:BoundField>
                                        <asp:BoundField DataField="email" HeaderText="Email ID" SortExpression="email"></asp:BoundField>
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state"></asp:BoundField>
                                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city"></asp:BoundField>
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

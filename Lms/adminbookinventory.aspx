<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="Lms.adminbookinventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });

       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();

               reader.onload = function (e) {
                   $('#imgview').attr('src', e.target.result);
               };

               reader.readAsDataURL(input.files[0]);
           }
       }

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
                                    <h4>Book Details</h4>
                                </center>

                            </div>
                        </div>
                        <div class="row">

                            <div class="col">
                                <center>
                                    <img id="imgview" height="150px" width="100px" src="BOOKS/books.png" />
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
                                <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />

                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-3">
                                <label>Book ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TextBox1" runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <label>Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="TextBox2" runat="server" placeholder="Book Name"></asp:TextBox>

                                </div>
                            </div>
                        </div>


                        <div class="row">

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Languages</label>
                                    <asp:DropDownList Class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Hindi" Value="Hindi" />
                                        <asp:ListItem Text="English" Value="English" />
                                        <asp:ListItem Text="Urdu" Value="Urdu" />
                                        <asp:ListItem Text="Kashmiri" Value="Kashmiri" />
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Publisher Name</label>
                                    <asp:DropDownList Class="form-control" ID="DropDownList2" runat="server">
                                        <asp:ListItem Text="Publisher 1" Value="Publisher 1" />
                                        <asp:ListItem Text="Publisher 2" Value="publisher 2" />
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Author Name</label>
                                    <asp:DropDownList Class="form-control" ID="DropDownList3" runat="server">
                                        <asp:ListItem Text="A1" Value="A1" />
                                        <asp:ListItem Text="A2" Value="A2" />

                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Publisher Date</label>
                                    <asp:TextBox class="form-control" ID="TextBox3" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Genre</label>
                                    <asp:ListBox Class="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                                        <asp:ListItem Text="Programming languaues" Value="Programming languaue" />
                                        <asp:ListItem Text="Web Development" Value="Web Development" />
                                        <asp:ListItem Text="Data Science" Value="Data Science" />
                                        <asp:ListItem Text="Machine Leraning" Value="Machine Leraning" />
                                        <asp:ListItem Text="Algorithm and Data Structure" Value="Algorithm and Data Structure" />
                                        <asp:ListItem Text="Software Engineering" Value="Software Engineering" />
                                        <asp:ListItem Text="Operating System" Value="Operating System" />
                                        <asp:ListItem Text="Artificial Intelligence" Value="Artificial Intelligence" />
                                        <asp:ListItem Text="Computer Network" Value="Computer Network" />
                                        <asp:ListItem Text="Cloud Computing" Value="Cloud Computing" />
                                        <asp:ListItem Text="Computer Graphics" Value="Computer Graphics" />
                                        <asp:ListItem Text="Big Data Analytics" Value="Big Data Analytics" />
                                        <asp:ListItem Text="Theory of Formal Languages" Value="Theory of Formal Languages" />
                                        
                                    </asp:ListBox>
                                </div>
                            </div>

                        </div>
                        <div class="row">

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Edition</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Edition"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Book Cost (per unit)</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Cost" TextMode="Number"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Pages</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Pages" TextMode="Number"></asp:TextBox>

                                </div>
                            </div>

                        </div>
                        <div class="row">

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Actual Stock</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Current Stock</label>
                                    <asp:TextBox ReadOnly="true" CssClass="form-control" ID="TextBox5" runat="server" placeholder="Current Stock" TextMode="Number"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>issued Books</label>
                                    <asp:TextBox ReadOnly="true" CssClass="form-control" ID="TextBox7" runat="server" placeholder="issued Books" TextMode="Number"></asp:TextBox>

                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Book Description</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Enter The Discription of Book" TextMode="MultiLine" Rows="2"></asp:TextBox>

                                </div>
                            </div>

                        </div>



                        <div class="row">

                            <div class="col-4">
                                <asp:Button class="btn btn-success bnt-lg btn-block" ID="Button2" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button class="btn btn-warning bnt-lg btn-block" ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button class="btn btn-danger bnt-lg btn-block" ID="Button3" runat="server" Text="Delete" OnClick="Button3_Click" />
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
                                    <h4>Book Inventory List</h4>
                                </center>

                            </div>
                        </div>
                        <div class="row">

                            <div class="col">
                                <hr>
                            </div>
                        </div>


                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="book_id"  AutoGenerateColumns="False">
                                     <Columns>
                              <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" >
                                 <ControlStyle Font-Bold="True" />
                                 <ItemStyle Font-Bold="True" />
                              </asp:BoundField>
                              <asp:TemplateField>
                                 <ItemTemplate>
                                    <div class="container-fluid">
                                       <div class="row">
                                          <div class="col-lg-10">
                                             <div class="row">
                                                <div class="col-12">
                                                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   <span>Author - </span>
                                                   <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label>
                                                   &nbsp;| <span><span>&nbsp;</span>Genre - </span>
                                                   <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                   &nbsp;| 
                                                   <span>
                                                      Language -<span>&nbsp;</span>
                                                      <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>
                                                   </span>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Publisher -
                                                   <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                   &nbsp;| Publish Date -
                                                   <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                   &nbsp;| Pages -
                                                   <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                   &nbsp;| Edition -
                                                   <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>'></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Cost -
                                                   <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                   &nbsp;| Actual Stock -
                                                   <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                   &nbsp;| Available Stock -
                                                   <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Description -
                                                   <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("book_description") %>'></asp:Label>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="col-lg-2">
                                             <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_ink") %>' />
                                          </div>
                                       </div>
                                    </div>
                                 </ItemTemplate>
                              </asp:TemplateField>
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

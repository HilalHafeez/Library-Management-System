using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebSockets;
using System.Drawing;

namespace Lms
{
    public partial class bookissuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        //go button
        protected void Button1_Click(object sender, EventArgs e)
        {
            getnames();

        }
        //issue Book
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkbook() && checkmember())
            {
                if (issueentry())
                {
                    Response.Write("<script>alert('This Memeber already has this book');</script>");
                }
                else
                {
                    DateTime issueDate = DateTime.Today;
                    DateTime dueDate = issueDate.AddDays(15);
                    Insert(issueDate, dueDate);
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID OR Registration Number');</script>");
            }
        }
        //return book
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkbook() && checkmember())
            {
                if (issueentry())
                {
                    returnbook();
                }
                else
                {
                    Response.Write("<script>alert('This entry does not exist');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID OR Registration Number');</script>");
            }
        }




        //user defined function


        void returnbook()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE from book_issue_tbl where book_id='" + TextBox1.Text.Trim() + "' AND registration_no='" + TextBox2.Text.Trim() + "'", con);
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    cmd = new SqlCommand("UPDATE book_master_tbl set current_stock=current_stock+1 where book_id='" + TextBox1.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book Returned  Successfully');</script>");
                    GridView1.DataBind();
                    con.Close();


                }
                else
                {
                    Response.Write("<script>alert('Error _ Invalid Detail');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void Insert(DateTime issueDate, DateTime dueDate)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                if (IsUserActive(con))
                {
                    SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM book_issue_tbl WHERE registration_no=@registration_no", con);
                    cmd.Parameters.AddWithValue("@registration_no", TextBox2.Text.Trim());
                    int issuedBooksCount = (int)cmd.ExecuteScalar();

                    if (issuedBooksCount >= 3)
                    {
                        Response.Write("<script>alert('You have already issued the maximum number of books (3).');</script>");
                    }
                    else
                    {

                        cmd = new SqlCommand("INSERT INTO book_issue_tbl(registration_no,book_id,member_name,book_name,issue_date,due_date) values(@registration_no,@book_id,@member_name,@book_name,@issue_date,@due_date)", con);
                        cmd.Parameters.AddWithValue("@registration_no", TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_id", TextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@member_name", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_name", TextBox4.Text.Trim());
                        cmd.Parameters.AddWithValue("@issue_date", issueDate.ToString("yyyy-MM-dd"));
                        cmd.Parameters.AddWithValue("@due_date", dueDate.ToString("yyyy-MM-dd"));

                        cmd.ExecuteNonQuery();
                        cmd = new SqlCommand("UPDATE  book_master_tbl set current_stock=current_stock-1 where book_id='" + TextBox1.Text.Trim() + "'", con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('Book Issued  Successfully');</script>");
                        GridView1.DataBind();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Your account is not active. You cannot issue books.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkbook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from book_master_tbl where book_id='" + TextBox1.Text.Trim() + "' AND current_stock > 0", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }

        }
        bool checkmember()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select full_name from member_master_tbl where registration_no='" + TextBox2.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }

        }
        bool issueentry()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from book_issue_tbl where registration_no='" + TextBox2.Text.Trim() + "' AND book_id='" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }

        }
        void getnames()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select book_name from book_master_tbl where book_id='" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox4.Text = dt.Rows[0]["book_name"].ToString();
                    


                }
                else
                {
                    Response.Write("<script>alert('Wrong Book ID');</script>");
                }

                cmd = new SqlCommand("select full_name from member_master_tbl where registration_no='" + TextBox2.Text.Trim() + "'", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox3.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Registration Number');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool IsUserActive(SqlConnection con)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT account_status FROM member_master_tbl WHERE registration_no=@registration_no", con);
                cmd.Parameters.AddWithValue("@registration_no", TextBox2.Text.Trim());
                string accountStatus = cmd.ExecuteScalar().ToString();

                return accountStatus == "active";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        private int CalculateTotalFine(string registrationNo, string bookId)
        {
            int totalFine = 0;

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT due_date FROM book_issue_tbl WHERE registration_no = @registration_no AND book_id = @book_id", con);
                cmd.Parameters.AddWithValue("@registration_no", registrationNo);
                cmd.Parameters.AddWithValue("@book_id", bookId);

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    DateTime dueDate = Convert.ToDateTime(dr["due_date"]);
                    int fineRate = 10;

                    // Calculate fine for each book and add it to the total fine
                    totalFine += CalculateFine(dueDate, DateTime.Now, fineRate);
                }

                dr.Close();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

            return totalFine;
        }
        // Add this method to calculate fine based on due date and current date
        int CalculateFine(DateTime dueDate, DateTime currentDate, int fineRate)
        {
            int fine = 0;

            if (currentDate > dueDate)
            {
                TimeSpan overdueDays = currentDate - dueDate;
                fine = fineRate * (int)overdueDays.TotalDays;
            }

            return fine;
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            string bookId = TextBox1.Text.Trim();
            string registrationNo = TextBox2.Text.Trim();

            // Call the method to calculate and display the total fine
            int totalFine = CalculateTotalFine(registrationNo, bookId);

            if (totalFine > 0)
            {
                // Display the total fine
                Response.Write("<script>alert('The Fine For This BOOK is: Rs" + totalFine.ToString() + "');</script>");
            }
            else
            {
                // If there is no fine, you can display a message
                Response.Write("<script>alert('No fine found for this user and book.');</script>");
            }
        }
        //reissued
        void Reissue()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                DateTime issueDate = DateTime.Today;
                DateTime dueDate = issueDate.AddDays(15);

                // Update both the issue date and due date for reissue
                SqlCommand cmd = new SqlCommand("UPDATE book_issue_tbl SET issue_date=@issue_date, due_date=@due_date WHERE book_id=@book_id AND registration_no=@registration_no", con);
                cmd.Parameters.AddWithValue("@issue_date", issueDate.ToString("yyyy-MM-dd"));
                cmd.Parameters.AddWithValue("@due_date", dueDate.ToString("yyyy-MM-dd"));
                cmd.Parameters.AddWithValue("@book_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@registration_no", TextBox2.Text.Trim());

                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    Response.Write("<script>alert('Book Reissued Successfully');</script>");
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Error in reissuing the book');</script>");
                }

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }        //Reissue
        protected void Button4_Click(object sender, EventArgs e)
        {

            if (checkbook() && checkmember())
            {
                if (issueentry())
                {
                    DateTime currentDate = DateTime.Today;
                    DateTime dueDate = currentDate.AddDays(15);

                    Reissue();
                }
                else
                {
                    Response.Write("<script>alert('This entry does not exist');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID OR Registration Number');</script>");
            }
        }
    }
}
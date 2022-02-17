using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
    
    //DeleteCommand="DELETE FROM [artists] WHERE [id] = @id" 
    //InsertCommand="INSERT INTO [artists] ([name], [gender], [image], [genre]) VALUES (@name, @gender, @image, @genre)"  
    //SelectCommand="SELECT [id], [name], [gender], [image], [genre] FROM [artists]" 
    //UpdateCommand="UPDATE [artists] SET [name] = @name, [gender] = @gender, [image] = @image, [genre] = @genre WHERE [id] = @id"

        con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        printData();
    }
    public void printData()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id], [name], [gender], [image], [genre] FROM [artists]", con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    public void resetForm()
    {
        TextBox1.Text = string.Empty;
        RadioButton2.Checked = false;
        RadioButton1.Checked = true;
        FileUpload1.Attributes.Clear();
        Image2.ImageUrl = string.Empty;
        Image2.Visible = false;
        CheckBoxList1.ClearSelection();
        Button1.Text = "Add Artist";
        Literal1.Text = string.Empty;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Button1.Text.Equals("Add Artist"))
        {
            if (FileUpload1.HasFile && Page.IsValid)
            {
                FileUpload1.SaveAs(Server.MapPath("~/uploads/" + FileUpload1.FileName));
                string gender = string.Empty;
                string genre = string.Empty;
                if (RadioButton2.Checked)
                {
                    gender = "Female";
                }
                else
                {
                    gender = "Male";
                }
                foreach (ListItem li in CheckBoxList1.Items)
                {
                    if (li.Selected)
                    {
                        genre += li.Text + ",";
                    }
                }
                if (genre.Length > 0)
                {
                    genre = genre.Remove(genre.Length - 1, 1);
                }
                else
                {
                    genre = "NOOB";
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO [artists] ([name], [gender], [image], [genre]) VALUES (@name, @gender, @image, @genre)", con);
                cmd.Parameters.AddWithValue("@name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@gender", gender);
                cmd.Parameters.AddWithValue("@genre", genre);
                cmd.Parameters.AddWithValue("@image", FileUpload1.FileName);

                con.Open();
                int s = cmd.ExecuteNonQuery();
                con.Close();

                if (s == 1)
                {
                    Literal1.Text = "Artist Added Successfully!";
                }
                else
                {
                    Literal1.Text = "Error! The Artist Details could not be Added!";
                }
                printData();
                resetForm();
            }
            else
            {
                Literal1.Text = "Photo Uploading is Compulsory!";
            }
        }
        else if (Button1.Text.Equals("Update Details"))
        {
            if (FileUpload1.HasFile && Page.IsValid)
            {
                FileUpload1.SaveAs(Server.MapPath("~/uploads/" + FileUpload1.FileName));
                string gender = string.Empty;
                string genre = string.Empty;
                if (RadioButton2.Checked)
                {
                    gender = "Female";
                }
                else
                {
                    gender = "Male";
                }
                foreach (ListItem li in CheckBoxList1.Items)
                {
                    if (li.Selected)
                    {
                        genre += li.Text + ",";
                    }
                }
                if (genre.Length > 0)
                {
                    genre = genre.Remove(genre.Length - 1, 1);
                }
                else
                {
                    genre = "NOOB";
                }
                SqlCommand cmd = new SqlCommand("UPDATE [artists] SET [name] = @name, [gender] = @gender, [image] = @image, [genre] = @genre WHERE [id] = @id", con);
                cmd.Parameters.AddWithValue("@name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@gender", gender);
                cmd.Parameters.AddWithValue("@genre", genre);
                cmd.Parameters.AddWithValue("@image", FileUpload1.FileName);
                cmd.Parameters.AddWithValue("@id", ViewState["id"]);

                con.Open();
                int s = cmd.ExecuteNonQuery();
                con.Close();

                if (s == 1)
                {
                    Literal1.Text = "Details Updated Successfully!";
                }
                else
                {
                    Literal1.Text = "Error! The Artist Details could not be Updated!";
                }
                printData();
                resetForm();
            }
            else if (!FileUpload1.HasFile && Page.IsValid)
            {
                string gender = string.Empty;
                string genre = string.Empty;
                if (RadioButton2.Checked)
                {
                    gender = "Female";
                }
                else
                {
                    gender = "Male";
                }
                foreach (ListItem li in CheckBoxList1.Items)
                {
                    if (li.Selected)
                    {
                        genre += li.Text + ",";
                    }
                }
                if (genre.Length > 0)
                {
                    genre = genre.Remove(genre.Length - 1, 1);
                }
                else
                {
                    genre = "NOOB";
                }
                SqlCommand cmd = new SqlCommand("UPDATE [artists] SET [name] = @name, [gender] = @gender, [genre] = @genre WHERE [id] = @id", con);
                cmd.Parameters.AddWithValue("@name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@gender", gender);
                cmd.Parameters.AddWithValue("@genre", genre);
                cmd.Parameters.AddWithValue("@id", ViewState["id"]);

                con.Open();
                int s = cmd.ExecuteNonQuery();
                con.Close();

                if (s == 1)
                {
                    Literal1.Text = "Details Updated Successfully!";
                }
                else
                {
                    Literal1.Text = "Error! The Artist Details could not be Updated!";
                }
                printData();
                resetForm();
            }
            else
            {
                Literal1.Text = "Error! The Artist Details could not be Updated!";
            }
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        resetForm();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        SqlCommand cmd = new SqlCommand("DELETE FROM [artists] WHERE [id] = @id", con);
        cmd.Parameters.AddWithValue("@id", btn.CommandArgument);
        con.Open();
        int s = cmd.ExecuteNonQuery();
        con.Close();
        if (s == 1)
        {
            Literal1.Text = "Data Deleted Successfully!";
        }
        else
        {
            Literal1.Text = "Error!";
        }
        printData();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Button1.Text = "Update Details";
        Button btn = new Button();
        btn = (Button)sender;
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id], [name], [gender], [image], [genre] FROM [artists] WHERE [id] = " + btn.CommandArgument, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        RadioButton1.Checked = true;
        RadioButton2.Checked = false;
        CheckBoxList1.ClearSelection();
        TextBox1.Text = dt.Rows[0][1].ToString();
        string gender = dt.Rows[0][2].ToString();
        if(gender.Equals(RadioButton2.Text))
            RadioButton2.Checked = true;
        string gen = dt.Rows[0][4].ToString();
        string[] genre = gen.Split(',');
        foreach(ListItem li in CheckBoxList1.Items)
        {
            string item = li.Text;
            foreach (string gen1 in genre)
            {
                if (gen1 == item)
                {
                    li.Selected = true;
                }
            }
        }
        Image2.Visible = true;
        Image2.ImageUrl = "~/uploads/" + dt.Rows[0][3].ToString();
        ViewState["id"] = btn.CommandArgument;
    }
}
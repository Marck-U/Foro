using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class Foro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("CreaPost.aspx");
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Response.Redirect("comentaPost.aspx");   
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int codigo = Convert.ToInt32 (Post.SelectedDataKey["Codigo"]);
        Response.Redirect("comentaPost.aspx? &id=" + codigo);
       
    }
  
 
}
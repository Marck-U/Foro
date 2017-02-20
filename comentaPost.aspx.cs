using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class comentaPost : System.Web.UI.Page
{
    sql sql = new sql();
    int Codigo = 0;
    String autor = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            Codigo = Convert.ToInt32(Request.QueryString["id"]);
            if (Codigo == 0)
            {
                Response.Redirect("Default.aspx");
            }
            autor = Session["user"].ToString();
            lbl_nombre.Text = Codigo.ToString();
        }
    }

    protected void limpiar()
    {
        txtSearch.Text = "";
    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int Codigo = Convert.ToInt32(Request.QueryString["Codigo"]);
        MuestraGrilla(Codigo);
        
    }

    protected void MuestraGrilla(int Codigo)
    {
        sql.ejecutar("exec ComentarioPost '" + Codigo + "'");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        DateTime Fecha = DateTime.Today;
        try
        {
            if(txtSearch.Text.Equals(""))
            {
                lbl_nombre.Text = " No deje el campo vacio";
            }
            else
            {
                int insert = sql.ejecutar("INSERT INTO comentario (autor,comentario,fecha,Codigo) values ('" + autor + "','" + txtSearch.Text + "','" + Fecha.Date + "','"+Codigo+"')");
                if(insert > 0){
                    lbl_nombre.Text = "has comentado";
                    lbl_nombre.ForeColor = System.Drawing.Color.Red;
                    MuestraGrilla(Codigo);
                    limpiar();
                }
                else
                {
                    lbl_nombre.Text = "Algo ocurrio";
                    lbl_nombre.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        catch
        {

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Mantenedores : System.Web.UI.Page
{

    sql sql = new sql();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       }
    protected void limpiar(){
        txt_usuario.Text = "";
        txt_nombre.Text = "";
        txt_pass.Text = "";        
}
    protected void btn_Ingresar_Click(object sender, EventArgs e)
    {
        try
        {
            if (txt_usuario.Text.Equals("") || txt_nombre.Text.Equals("") || txt_pass.Text.Equals(""))
            {
                lbl_mensaje.Text = "No debe dejar campos vacios";
                lbl_mensaje.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                if (sql.validar("SELECT * FROM Usuario WHERE usuario ='" + txt_usuario.Text + "'"))
                {
                    lbl_mensaje.Text = "El nombre de usuario ya esta ocupado, elija otro";
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    limpiar();
                }
                else
                {
                    int ingresar = sql.ejecutar("INSERT INTO Usuario VALUES('" + txt_usuario.Text + "','" + txt_nombre.Text + "'," +dropEstado.SelectedValue + ","+DropTipo.SelectedValue + ",'" + txt_pass.Text + "')");
                    if (ingresar > 0)
                    {
                        lbl_mensaje.Text = "Usuario Registrado";
                        lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                        limpiar();
                        llenaGrilla();
                    }
                    else
                    {
                        lbl_mensaje.Text = "Ocurrio un error";
                        lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                        limpiar();
                    }
                }
            }
        }
        catch
        {

        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            txt_usuario.Text = GridView1.SelectedRow.Cells[1].Text;
            txt_nombre.Text = GridView1.SelectedRow.Cells[2].Text;
            DropTipo.SelectedValue = GridView1.SelectedRow.Cells[3].Text;
            txt_pass.Attributes.Add("Value", GridView1.SelectedRow.Cells[5].Text);
            dropEstado.SelectedValue = GridView1.SelectedRow.Cells[4].Text;
        }
        catch { }
    }

    protected void llenaGrilla()
    {
        sql.llenaGrid(GridView1, "SELECT * FROM usarioes");
    }
}
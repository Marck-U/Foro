using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_mensaje.Text = "";
    }
    protected void limpiar()
    {
        txt_nombre.Text="";
        txt_pass.Text="";
        txt_usuario.Text="";
    }
    protected void btn_Ingresar_Click1(object sender, EventArgs e)
    {
        sql sql = new sql();
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
                    int ingresar = sql.ejecutar("INSERT INTO Usuario VALUES('" + txt_usuario.Text + "','" + txt_nombre.Text + "'," + "'2'" + ",'2'" + ",'" + txt_pass.Text + "')");
                    if (ingresar > 0)
                    {
                        lbl_mensaje.Text = "Usuario Registrado";
                        lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                        limpiar();
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
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreaPost : System.Web.UI.Page
{
    sql sql = new sql(); 
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void limpiar()
    {
        txt_autor.Text = "";
        txt_comentario.Text = "";
        txt_titulo.Text = "";
    }
    protected void btn_Ingresar_Click(object sender, EventArgs e)
    {
         DateTime Fecha = DateTime.Today;
           
        try {
            if (txt_titulo.Text.Equals("") || txt_autor.Text.Equals("") || txt_comentario.Text.Equals("") ) {
                lbl_mensaje.Text = "No deje los campos vacios";
                lbl_mensaje.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                if(Session["user"].Equals(txt_autor.Text))
                {
                   int insert = sql.ejecutar("INSERT INTO Post (texto,fechaCreacion,autor,idCategoria)  VALUES ('" + txt_comentario.Text + "','"+Fecha.Date+"','"+ txt_autor.Text + "','" + drop_Categoria.SelectedValue + "')");
                    if(insert > 0 ){
                        lbl_mensaje.Text = "Post Creado";
                        lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                        limpiar();
                    }
                    else
                    {
                        lbl_mensaje.Text = "No se pudo crear el post";
                        lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                        limpiar();
                    }
                }
                else
                {
                    lbl_mensaje.Text = "No puedes crear el post con el nombre de otro usuario";
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    limpiar();
                }
            }
        }
        catch
        {

        }

    }
}
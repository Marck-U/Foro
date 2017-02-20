using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class InicioS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void limpiar()
    {
        txtPass.Text = "";
        txtUsuario.Text = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        sql sql = new sql();
        try
        {
            if (txtUsuario.Text.Equals("") || txtPass.Text.Equals(""))
            {
                lbl_mensaje.Text = "No deje los campos vacios";
                lbl_mensaje.ForeColor = System.Drawing.Color.Red;                
            }
            else
            {

            
            SqlDataReader lector = sql.consulta("SELECT * FROM Usuario WHERE usuario ='" + txtUsuario.Text + "'");
            if (lector.Read())
            {
                if (lector[4].ToString().Equals(txtPass.Text))
                {
                    if(lector[2].ToString().Equals("1")){
                        Session["user"] = txtUsuario.Text;
                        Response.Redirect("Sesion.aspx");
                        //if(lector[3].ToString().Equals("1")){
                        //    Session["user"] = txtUsuario.Text;
                        //    Response.Redirect("SesionAdm.aspx");
                        //}
                        //else
                        //{
                        //    Session["user"] = txtUsuario.Text;
                        //    Response.Redirect("InicioUs.aspx");
                        //}
                        
                    }
                    else
                    { 
                        if(lector[2].ToString().Equals("2")){
                            lbl_mensaje.Text = "Espere que un admin active su cuenta";
                            lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                            limpiar();
                        }
                        else
                        {
                            lbl_mensaje.Text = "Usted a sido Bloqueado";
                            lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                            limpiar();
                        }
                        
                    }
                }
                else
                {
                    lbl_mensaje.Text = "Password Incorrecta";
                    lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                    limpiar();
                }
            }
            else
            {
                lbl_mensaje.Text = "Usuario inexistente";
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
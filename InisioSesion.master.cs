using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class InisioSesion : System.Web.UI.MasterPage
{
    protected sql sql = new sql();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            
            String usuario = (String)Session["user"];
            SqlDataReader lector = sql.consulta("SELECT * FROM Usuario WHERE usuario = '" + usuario + "'");
            lector.Read();
            int tipo = int.Parse(lector[3].ToString());
            if (tipo == 1)
            {
                menu_administrador.Visible = true;
            }
            else
            {
                menu_usuario.Visible = true;
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
            
        
    }
        protected void escondeMenu(){

        }
}

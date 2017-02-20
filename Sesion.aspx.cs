using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class SesionAdm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            String usuario = Session["user"].ToString();
            SqlDataReader lector;
            sql sql = new sql();
            lector = sql.consulta(" SELECT * FROM Usuario where usuario ='" + Session["user"].ToString() + "'");
            if (lector.Read())
            {
                lbl_nombre.Text = lector[1].ToString();
            }
        }
    }
}
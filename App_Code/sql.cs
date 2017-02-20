using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.ComponentModel;
using System.Drawing;
using System.Web.UI.WebControls;


   public class sql
    {
        String conexion = "Data Source=KURO;Initial Catalog=Foro;Integrated Security=True;MultipleActiveResultSets=True";
        SqlConnection con;
        SqlCommand sqlcm;
        SqlDataReader sqldr;

        public void llenacombo(DropDownList cb, String sentencia, String display, String value)
        {
            try
            {
                con.Close();
                SqlDataAdapter da = new SqlDataAdapter(sentencia, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                cb.DataSource = ds.Tables[0].DefaultView;
                cb.DataTextField = display;
                cb.DataValueField = value;
                cb.DataBind();
                con.Open();
            }
            catch (Exception ee)
            {

            }
        }
       
        public sql()
        {
            con = new SqlConnection(conexion);

        }

         
        public void conectar()
        {
            try
            {
                if (con.State == ConnectionState.Closed) { 
                con.Open();
                }
                
            }
            catch (Exception f)
            {

            }

        }
        public void desconectar()
        {
            try
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
            catch (Exception e)
            {

            }
        }
        public SqlDataReader consulta(String sentencia)
        {
            conectar();
            try
            {
                SqlCommand comando = new SqlCommand(sentencia, con);
                return comando.ExecuteReader();
            }
            catch (Exception e)
            {
                return null;
            }
        }
        public int ejecutar(String sentencia)
        {
            try
            {
                conectar();
                SqlCommand comando = new SqlCommand(sentencia, con);
                return comando.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                return -1;
            }
        }
        public Boolean validar(String sentencia)
        {
            if (consulta(sentencia).Read())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public void llenaGrid(GridView dg, String sentencia)
        {
            try
            {
                con.Close();
                con.Open();
                SqlDataAdapter adapt = new SqlDataAdapter(sentencia, con);
                DataSet ds = new DataSet();
                adapt.Fill(ds);
                dg.DataSource = ds.Tables[0];
                dg.DataBind();
                con.Close();
            }
            catch { }
        }
    }

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pet_Store
{
    public partial class RaportWebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("paginaprincipalawebform.aspx");
        }

        protected void btnProfit_Click(object sender, EventArgs e)
        {
            string strDrop = "drop procedure DiferentaPretListaPretMinim";
            SqlConnection myCon = new SqlConnection(@"Data Source=####;Initial Catalog=MyDB;Integrated Security=True;");
            SqlCommand myCom = new SqlCommand(strDrop, myCon);
            try
            {
                myCon.Open();
                myCom.ExecuteNonQuery();
                tbRaport.Text += "\r\n Stergere Ok!\n";
            }
            catch(Exception ex) 
            {
                tbRaport.Text += "\r\n Nu s-a putut conecta sau comanda nu a putut fi executata!\n" + ex.Message;
            }
            string strCreare = "CREATE PROCEDURE [dbo].[DiferentaPretListaPretMinim] " + 
                "(@pretlista float, @pretmin float,@diferenta float output) " + "AS " 
                + "SELECT(pretlista - pretminim) as profit from produse; "
                 + "select @diferenta = (@pretlista - @pretmin) from produse; " + "RETURN 0";
            myCom = new SqlCommand(strCreare, myCon);
            try 
            {
                myCom.ExecuteNonQuery();
                tbRaport.Text += "Creare ok!\n Se poate calcula un nou profit!";
            }
            catch (Exception ex)
            {
                tbRaport.Text += "\r\n Creare esuata\n" + ex.Message;
            }

            finally { myCon.Close(); }
        }

        protected void btnAfisareProfit_Click(object sender, EventArgs e)
        {
            SqlConnection myCon = new SqlConnection(@"Data Source=#####;Initial Catalog=MyDB;Integrated Security=True;");
            string strValCom = "DiferentaPretListaPretMinim";
            SqlCommand myCom = new SqlCommand(strValCom, myCon);
            myCom.CommandType = System.Data.CommandType.StoredProcedure;
            SqlParameter pretlista = new SqlParameter("@pretlista", System.Data.SqlDbType.Float);
            pretlista.Value = double.Parse(tbPretLista.Text);
            SqlParameter pretmin = new SqlParameter("@pretmin", System.Data.SqlDbType.Float);
            pretmin.Value = double.Parse(tbPretMin.Text);
            SqlParameter diferenta = new SqlParameter("@diferenta", System.Data.SqlDbType.Float);
            diferenta.Direction = System.Data.ParameterDirection.Output;
            myCom.Parameters.Add(pretlista); myCom.Parameters.Add(pretmin);
            myCom.Parameters.Add(diferenta);
            SqlDataReader dr = null;
            try
            {
                myCon.Open();
                dr = myCom.ExecuteReader();
                while (dr.Read())
                {
                    tbRaport.Text += "\r\n" + dr[0] + "\t" + dr[1] + "\t" + dr[2];
                }
            }
            catch (Exception ex)
            {
                tbRaport.Text += "\r\n" + ex.Message;
            }
            finally { dr.Close(); myCon.Close(); }
            tbDiferenta.Text = "\n" + diferenta.Value.ToString();
        }
    }
}
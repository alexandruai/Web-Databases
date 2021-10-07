using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pet_Store
{
    public partial class PaginaPrincipalaWebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            bool isValid = true;
            String id = tbIdProdus.Text;
            if (String.IsNullOrEmpty(id) || String.IsNullOrWhiteSpace(id))
            {
                isValid = false;
            }

            String denumire = tbDenumire.Text;
            if (String.IsNullOrEmpty(denumire) || String.IsNullOrWhiteSpace(denumire)) 
            {
                isValid = false;
            }

            String categorie = tbCategorie.Text;
            if (String.IsNullOrEmpty(categorie) || String.IsNullOrWhiteSpace(categorie))
            {
                isValid = false; 
            }

            String descriere = tbDescriere.Text;
            if(String.IsNullOrEmpty(descriere) || String.IsNullOrWhiteSpace(descriere))
            {
                isValid = false;
            }

            String pretlista = tbPretLista.Text;
            if(String.IsNullOrEmpty(pretlista) || String.IsNullOrWhiteSpace(pretlista))
            {
                isValid = false;
            }

            String pretminim = tbPretMinim.Text;
            if(String.IsNullOrEmpty(pretminim) || String.IsNullOrWhiteSpace(pretminim))
            {
                isValid = false;
            }

            if (isValid)
            {
                SqlParameter p1 = new SqlParameter("@IdProdus", System.Data.SqlDbType.Int);
                int idValidare = int.Parse(tbIdProdus.Text);
                if(idValidare > 0) 
                {
                    p1.Value = idValidare;              
                }
                else
                {
                    tbMess.Text = "\r\n Introduceti un numar pozitiv mai mare decat 0!\n";
                }
                SqlParameter p2 = new SqlParameter("@Denumire", System.Data.SqlDbType.VarChar);
                p2.Value = tbDenumire.Text;
                SqlParameter p3 = new SqlParameter("@Categorie", System.Data.SqlDbType.VarChar);
                p3.Value = tbCategorie.Text;
                SqlParameter p4 = new SqlParameter("@Descriere", System.Data.SqlDbType.VarChar);
                p4.Value = tbDescriere.Text;
                SqlParameter p5 = new SqlParameter("@PretLista", System.Data.SqlDbType.Float);
                double pretListaValid = double.Parse(tbPretLista.Text);
                if (pretListaValid > 0.00)
                {
                    p5.Value = pretListaValid;
                } 
                else
                {
                    tbMess.Text = "\r\n Pretul din lista trebuie sa fie un numar pozitiv mai mare decat 0!\n";
                }
                SqlParameter p6 = new SqlParameter("@PretMinim", System.Data.SqlDbType.Float);
                double pretMinValid = double.Parse(tbPretMinim.Text);
                if(pretMinValid > 0.00)
                {
                    p6.Value = pretMinValid;
                }
                else 
                {
                    tbMess.Text = "\r\n Pretul minim trebuie sa fie un numar pozitiv mai mare decat 0!\n";
                }
                 
                string strInsert = "INSERT INTO [Produse] ([IdProdus], [Denumire], [Categorie], [Descriere], [PretLista], [PretMinim]) VALUES (@IdProdus, @Denumire, @Categorie, @Descriere, @PretLista, @PretMinim)";
                SqlConnection conInsert = new SqlConnection(@"Data Source=###;Initial Catalog=MyDB;Integrated Security=True;");
                SqlCommand myComm = new SqlCommand(strInsert, conInsert);
                myComm.Parameters.Add(p1);
                myComm.Parameters.Add(p2);
                myComm.Parameters.Add(p3);
                myComm.Parameters.Add(p4);
                myComm.Parameters.Add(p5);
                myComm.Parameters.Add(p6);
                try
                {
                    conInsert.Open();
                    int n = myComm.ExecuteNonQuery();
                    tbMess.Text += "\r\nAdaugare reusita";
                    tbIdProdus.Text = "";
                    tbDenumire.Text = "";
                    tbDescriere.Text = "";
                    tbCategorie.Text = "";
                    tbPretLista.Text = "";
                    tbPretMinim.Text = "";
                    GridViewProduse.DataBind();
                }
                catch (Exception ex)
                {
                    tbMess.Text += "\r\nAdaugare esuata! " + ex.Message;
                }
                finally { conInsert.Close(); }
            }
            else
            {
                tbMess.Text += "\r\n Nu pot fi introduse produse noi cu date incomplete!\n";
            }

            
        }

        protected void DropDownListGraph_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSourceSelectArguments args = new DataSourceSelectArguments();
            DataView dataView1 = (DataView)SqlDataSourceProduse.Select(args);
            DataTable dataTabl1 = dataView1.ToTable();
            DataSet ds = new DataSet(); ds.Tables.Add(dataTabl1);
            Cache["ProduseCache"] = ds;
            Response.Redirect("GraphWebForm.aspx?tip=" + this.DropDownListGraph.SelectedItem.Text);

        }

        protected void btnProc_Click(object sender, EventArgs e)
        {
            Response.Redirect("raportwebform.aspx");
        }

        protected void btnAfisareValoare_Click(object sender, EventArgs e)
        {
            SqlConnection myCon = new SqlConnection(@"Data Source=########;Initial Catalog=MyeDB;Integrated Security=True;");
            string strApel = "ValoareComanda";
            SqlCommand myCom = new SqlCommand(strApel, myCon);
            myCom.CommandType = System.Data.CommandType.StoredProcedure;
            SqlParameter idComanda = new SqlParameter("@idcomanda", System.Data.SqlDbType.Int);
            idComanda.Value = int.Parse(tbIdComanda.Text);
            SqlParameter valoare = new SqlParameter("@valoarecomanda", System.Data.SqlDbType.Float);
            valoare.Direction = System.Data.ParameterDirection.Output;
            myCom.Parameters.Add(idComanda);
            myCom.Parameters.Add(valoare);
            SqlDataReader dr = null;
            try
            {
                myCon.Open();
                dr = myCom.ExecuteReader();
                while (dr.Read())
                {
                    tbValoareComanda.Text = "";
                }
            }
            catch (Exception ex)
            {
                tbMess.Text += "\r\n" + ex.Message;
            }
            finally { dr.Close();
                myCon.Close(); }
            tbValoareComanda.Text = valoare.Value.ToString();
        }
    }
}
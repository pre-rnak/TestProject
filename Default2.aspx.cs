using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    string data;
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    [WebMethod]
    public static List<GraphModel> GetChartData()
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=ShoppingDB;User ID=sa;Password=pass123!@#"))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select Name,total=value from CountryDetails order by total desc", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();
        }
        List<countrydetails> dataList = new List<countrydetails>();

        List<GraphModel> gmL = new List<GraphModel>();

        foreach (DataRow dtrow in dt.Rows)
        {
            GraphModel gm = new GraphModel();

            gm.label = dtrow[0].ToString();
            gm.value= Convert.ToInt32(dtrow[1]);
            gmL.Add(gm);
        }
        

        return gmL;
    }
    public class countrydetails
    {
        public string Countryname { get; set; }
        public int Total { get; set; }
    }

    public class GraphModel 
    {
        public string label { get; set; }
        public int value { get; set; }
    }
}
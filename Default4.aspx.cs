using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static List<countrydetails> GetChartData()
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=ShoppingDB;User ID=sa;Password=pass123!@#"))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select Name,count,rates,total=value from CountryDetails order by total desc", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();
        }
        List<countrydetails> dataList = new List<countrydetails>();


        foreach (DataRow dtrow in dt.Rows)
        {
            countrydetails details = new countrydetails();
            details.Countryname = dtrow[0].ToString();
            details.Total = Convert.ToInt32(dtrow[1]);
            details.count = Convert.ToInt32(dtrow[2]);
            details.rates = Convert.ToInt32(dtrow[3]);

            dataList.Add(details);
        }
        return dataList;
    }
    public class countrydetails
    {
        public string Countryname { get; set; }
        public int Total { get; set; }
        public int count { get; set; }
        public int rates { get; set; }

    }
}
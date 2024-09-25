using MySql.Data.MySqlClient;
using SMartMonitoringTool.Constants;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Expressions;

namespace EMalkhana
{
    public partial class SearchMuds : System.Web.UI.Page
    {
        class Data
        {
            public string id { get; set; }
            public string mudNo { get; set; }
            public string firNo { get; set; }
            public string receiptNo { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] mudNos = Request.Params["mudNo"].Split(',');
            string mudsIds = "";
            foreach(string mudNo in mudNos)
            {
                mudsIds += $"'{mudNo}',";
            }
            mudsIds = mudsIds.Remove(mudsIds.Length - 1);
            if(lstView.Items.Count == 0)
            {
                MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
                MySqlCommand cmd = new MySqlCommand();
                con.Open();
                cmd.Connection = con;

                cmd.CommandType = CommandType.Text;
                cmd.CommandText = $"select mudNo, firNo, mud.id as id,receiptNo from mud left outer join fir on mud.firId = fir.id left outer join firtype on firtype.id = fir.firTypeID left outer join department on department.id = fir.departmentId where mudNo in ({mudsIds}) and mud.isactive = 1;";
                var reader = cmd.ExecuteReader();
                var list = new List<Data>();
                while (reader.Read())
                {
                    list.Add(new Data
                    {
                        id = reader["id"].ToString(),
                        mudNo = reader["mudNo"].ToString(),
                        firNo = reader["firNo"].ToString(),
                        receiptNo = reader["receiptNo"].ToString(),
                    });
                }
                cmd.Dispose();
                con.Close();
                lstView.DataSource = list;
                lstView.DataBind();
            }
        }

        protected void lstVwAdmin_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "VIEWRECORD")
            {
                Response.Redirect($"SearchMud.aspx?MudNo={e.CommandArgument}");
            }
            else if (e.CommandName == "EDITRECORD")
            {
                Response.Redirect($"Mud.aspx?MudNo={e.CommandArgument}");
            }
        }
    }
}
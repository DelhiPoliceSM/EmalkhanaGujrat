using Google.Protobuf.WellKnownTypes;
using MySql.Data.MySqlClient;
using OpenQA.Selenium.DevTools.V102.Page;
using SMartMonitoringTool.Constants;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMalkhana
{
    public partial class TransferAck : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void firSelectedIndecChanged(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            List<String> mud = new List<string>();
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = $"select distinct mudNo from mud where firid = {firNumber.SelectedValue} and isActive = 1";
            MySqlDataReader r1 = cmd.ExecuteReader();
            mudSelection.Items.Clear();
            while (r1.Read())
            {
                mudSelection.Items.Add(r1["mudNo"].ToString());
            }
            mudSelection.DataBind();
            r1.Close();
            cmd.Dispose();
            con.Close();
        }

        protected void transferMud(object sender, EventArgs e)
        {
            HashSet<String> selectedMudNo = new HashSet<String>();
            string mudNumbers = "";
            foreach (ListItem item in mudSelection.Items)
            {
                if (item.Selected)
                {
                    selectedMudNo.Add(item.Value);
                    mudNumbers += $"'{item.Value}',";
                }
            }
            if (string.IsNullOrEmpty(mudNumbers))
            {
                Response.Write($"<script>alert('Please select at least 1 mud.')</script>");
                return;
            }
            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            con.Open();
            mudNumbers = mudNumbers.Remove(mudNumbers.Length - 1);
            cmd = new MySqlCommand();
            cmd.Connection = con;
            cmd.CommandText = $"update mudmovement set ackNumber = '{ackNumber.Text}', ackDate = '{ackDate.Text}' where isReceived = 0 and mudNo IN ({mudNumbers}) and isActive = 1 and ackNumber is null";
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            Response.Write($"<script>alert('Successfuly acknowledged Muds.')</script>");
            ackDate.Text = "";
            ackNumber.Text = "";
            foreach (ListItem item in mudSelection.Items)
            {
                item.Selected = false;
            }
            firNumber.SelectedIndex = 0;
        }
    }
}
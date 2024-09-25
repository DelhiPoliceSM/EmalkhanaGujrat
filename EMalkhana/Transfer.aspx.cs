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
    public partial class Transfer : System.Web.UI.Page
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
            string firNos = "";
            for(int i = 0; i < firNumber.Items.Count; i++)
            {
                if (firNumber.Items[i].Selected)
                {
                    firNos += $"{firNumber.Items[i].Value},";
                }
            }
            firNos = firNos.Remove(firNos.Length - 1);
            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            List<String> mud = new List<string>();
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = $"select distinct mudNo from mud where firid IN ({firNos}) and isActive = 1";
            MySqlDataReader r1 = cmd.ExecuteReader();
            while (r1.Read())
            {
                mud.Add(r1["mudNo"].ToString());
            }
            r1.Close();
            if (mud.Count == 0)
            {
                Response.Write($"<script>alert('Please select at least 1 mud.')</script>");
                return;
            }
            string idPath = string.Empty;
            if (id.HasFile)
            {
                string time = DateTime.Now.ToString("yyyyMMddHHmmss");
                string extension = Path.GetExtension(id.FileName);
                string folder = Request.PhysicalApplicationPath + "idPhoto" + "\\";
                var path = Path.Combine(folder, time + extension);
                id.SaveAs(path);
                idPath = "idPhoto/" + time + extension;
            }
            string goingAt;
            switch (isPresentedInCourt.SelectedValue)
            {
                case "0": goingAt = ddlPoliceStation.SelectedValue; break;
                case "1": goingAt = ddlCourtName.SelectedValue; break;
                default: goingAt = ddlFSL.SelectedValue; break;
            }
            foreach (string mudNumber in mud)
            {
                cmd = new MySqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "sp_mudmovement_add";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@requestedBy", Session["numUserId"].ToString());
                cmd.Parameters.AddWithValue("@mudNumber", mudNumber);
                cmd.Parameters.AddWithValue("@goingAt", goingAt);
                cmd.Parameters.AddWithValue("@bIsCourt", isPresentedInCourt.SelectedValue);
                cmd.Parameters.AddWithValue("@strSendingVia", sendingVia.Text.Trim());
                cmd.Parameters.AddWithValue("@strTRansfereeIdPath", idPath);
                cmd.Parameters.AddWithValue("@dSentOn", sentOn.Text);
                cmd.Parameters.AddWithValue("@numDesignationId", ddldesignation.SelectedValue);
                cmd.Parameters.AddWithValue("@txtbuckleNumber", buckleNumber.Text);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
            }
            con.Close();
            Response.Write($"<script>alert('Mud Successfully transfered.')</script>");
            isPresentedInCourt.SelectedIndex = 1;
            firNumber.SelectedIndex = 0;
            sendingVia.Text = "";
            ddldesignation.SelectedIndex = 0;
            buckleNumber.Text = "";
            id.Dispose();
        }
        protected void isPresentedInCourt_CheckedChanged(object sender, EventArgs e)
        {
            DropDownList isPresentedInCourt = sender as DropDownList;
            if (isPresentedInCourt.SelectedValue == "1")
            {
                lblPoliceStation.Text = "કોર્ટનું નામ";
                ddlPoliceStation.Visible = false;
                ddlCourtName.Visible = true;
                ddlFSL.Visible = false;
            }
            else if (isPresentedInCourt.SelectedValue == "2")
            {
                lblPoliceStation.Text = "FSL નામ";
                ddlFSL.Visible = true;
                ddlPoliceStation.Visible = false;
                ddlCourtName.Visible = false;
            }
            else
            {
                lblPoliceStation.Text = "પોલીસ સ્ટેશન";
                ddlFSL.Visible = false;
                ddlPoliceStation.Visible = true;
                ddlCourtName.Visible = false;
            }
        }
    }
}
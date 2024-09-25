using MySql.Data.MySqlClient;
using SMartMonitoringTool.Constants;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMalkhana
{
    public partial class MudMovement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            numUniqueID.Text = "0";
            frmVwAdmin.ChangeMode(FormViewMode.Insert);
            pnlAdmin.Visible = true;
            lblMessage.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (frmVwAdmin.CurrentMode == FormViewMode.Insert)
            {
                frmVwAdmin.InsertItem(false);
            }
            else if (frmVwAdmin.CurrentMode == FormViewMode.Edit)
            {
                frmVwAdmin.UpdateItem(false);
            }
            frmVwAdmin.ChangeMode(FormViewMode.ReadOnly);
            pnlAdmin.Visible = false;
            Response.Redirect("Role.aspx");
        }

        protected void frmVwAdmin_DataBound(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            frmVwAdmin.ChangeMode(FormViewMode.ReadOnly);
            pnlAdmin.Visible = false;
        }
        protected void ddlPoliceStation_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlPoliceStation = sender as DropDownList;
            RequiredFieldValidator ddlPoliceStationExtender = (RequiredFieldValidator)frmVwAdmin.FindControl("ddlPoliceStationExtender");
            if (ddlPoliceStation.SelectedValue == "0")
            {
            }
        }

        protected void lstVwAdmin_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "ACCEPTRECORD")
            {
                MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
                MySqlCommand cmd = new MySqlCommand();
                con.Open();
                cmd.Connection = con;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_accept_mudmovement";
                cmd.Parameters.AddWithValue("@userId", Session["numuserId"]);
                cmd.Parameters.AddWithValue("@moveId", e.CommandArgument.ToString());
                cmd.ExecuteNonQuery();


                cmd.Dispose();
                con.Close();
                Response.Redirect("MudMovement.aspx");
            }
            else if (e.CommandName == "REJECTRECORD")
            {
                MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
                MySqlCommand cmd = new MySqlCommand();
                con.Open();
                cmd.Connection = con;

                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "update mudmovement set isActive = 0 WHERE id = " + e.CommandArgument.ToString();
                cmd.ExecuteNonQuery();

                lblMessage.Text = "Record removed.";

                cmd.Dispose();
                con.Close();
                Response.Redirect("MudMovement.aspx");
            }
        }
    }

}
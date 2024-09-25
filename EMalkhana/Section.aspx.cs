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
    public partial class Section : System.Web.UI.Page
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
            Response.Redirect("Section.aspx");
        }

        protected void frmVwAdmin_DataBound(object sender, EventArgs e)
        {
            DropDownList actId = (DropDownList)frmVwAdmin.FindControl("actId");
            if (frmVwAdmin.CurrentMode == FormViewMode.Edit)
            {
                ListBox sections = (ListBox)frmVwAdmin.FindControl("sections");
                MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
                MySqlCommand cmd = new MySqlCommand();
                con.Open();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = $"select asec.name as name, asec.id as secId, case when am.isactive is null or am.isactive = 0 then false else 1 end as Selected  from act_section asec left outer join act_mapping am on asec.id = am.actsectionId where asec.isactive = 1 and (am.isactive is null or am.isactive = 1) and (actid = {actId.SelectedValue} or actId is null)";
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    sections.Items.Add(new ListItem(reader["name"].ToString(), reader["secId"].ToString()));
                    sections.Items[sections.Items.Count - 1].Selected = reader["Selected"].ToString() == "1" ? true : false;
                }
                sections.DataBind();
                cmd.Dispose();
                con.Close();
            }
        }

        protected void frmVwAdmin_PreRender(object sender, EventArgs e)
        {            
        }
        protected void frmVwAdmin_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            DropDownList actId = (DropDownList)frmVwAdmin.FindControl("actId");

            ListBox sections = (ListBox)frmVwAdmin.FindControl("sections");
            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            con.Open();
            cmd.Connection = con;

            string sectionIds = "";
            foreach (ListItem item in sections.Items)
            {
                if (item.Selected)
                {
                    sectionIds += $"{item.Value},";
                }
            }
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_act_mapping_Add";
            cmd.Parameters.AddWithValue("@numActId", actId.SelectedValue);
            cmd.Parameters.AddWithValue("@sectionIDs", sectionIds);

            cmd.ExecuteNonQuery();

            lblMessage.Text = "Record Updated.";

            cmd.Dispose();
            con.Close();
            e.Cancel = true;
        }

        protected void frmVwAdmin_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            DropDownList actId = (DropDownList)frmVwAdmin.FindControl("actId");
            ListBox sections = (ListBox)frmVwAdmin.FindControl("sections");

            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            con.Open();
            cmd.Connection = con;

            string sectionIds = "";
            foreach (ListItem item in sections.Items)
            {
                if (item.Selected)
                {
                    sectionIds += $"{item.Value},";
                }
            }
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_act_mapping_Add";
            cmd.Parameters.AddWithValue("@numActId", actId.SelectedValue);
            cmd.Parameters.AddWithValue("@sectionIDs", sectionIds);

            cmd.ExecuteNonQuery();

            lblMessage.Text = "Record Updated.";

            cmd.Dispose();
            con.Close();
            e.Cancel = true;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            frmVwAdmin.ChangeMode(FormViewMode.ReadOnly);
            pnlAdmin.Visible = false;
        }

        protected void lstVwAdmin_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "EDITRECORD")
            {
                numUniqueID.Text = e.CommandArgument.ToString();
                frmVwAdmin.DataBind();
                frmVwAdmin.ChangeMode(FormViewMode.Edit);
                pnlAdmin.Visible = true;
            }
            else if (e.CommandName == "DELETERECORD")
            {
                MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
                MySqlCommand cmd = new MySqlCommand();
                con.Open();
                cmd.Connection = con;

                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "update act_mapping set isActive = 0 WHERE actId = " + e.CommandArgument.ToString();
                cmd.ExecuteNonQuery();

                lblMessage.Text = "Record removed.";

                cmd.Dispose();
                con.Close();

                Response.Redirect("Section.aspx");
            }
        }
    }

}
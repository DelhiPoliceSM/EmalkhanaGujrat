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
    public partial class RolePermission : System.Web.UI.Page
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
            Response.Redirect("RolePermission.aspx");
        }

        protected void frmVwAdmin_DataBound(object sender, EventArgs e)
        {

        }

        protected void frmVwAdmin_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            bool boolDoAction = true;
            TextBox numUniqueId = (TextBox)frmVwAdmin.FindControl("numUniqueId");

            if (boolDoAction == true)
            {
                CheckBoxList permissions = (CheckBoxList)frmVwAdmin.FindControl("permissions");
                string permissionIds = "";
                foreach (ListItem item in permissions.Items)
                {
                    if (item.Selected)
                    {
                        permissionIds += $"{item.Value},";
                    }
                }

                MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
                MySqlCommand cmd = new MySqlCommand();
                con.Open();
                cmd.Connection = con;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_roleperm_add";
                cmd.Parameters.AddWithValue("@numUniqueId", numUniqueId.Text.Trim());
                cmd.Parameters.AddWithValue("@permissionIds", permissionIds);

                cmd.ExecuteNonQuery();

                lblMessage.Text = "Record Updated.";

                cmd.Dispose();
                con.Close();
            }
            e.Cancel = true;
        }

        protected void frmVwAdmin_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            bool boolDoAction = true;
            TextBox numUniqueId = (TextBox)frmVwAdmin.FindControl("numUniqueId");

            if (boolDoAction == true)
            {
                CheckBoxList permissions = (CheckBoxList)frmVwAdmin.FindControl("permissions");
                string permissionIds = "";
                foreach (ListItem item in permissions.Items)
                {
                    if (item.Selected)
                    {
                        permissionIds += $"{item.Value},";
                    }
                }
                MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
                MySqlCommand cmd = new MySqlCommand();
                con.Open();
                cmd.Connection = con;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_roleperm_add";
                cmd.Parameters.AddWithValue("@numRoleId", numUniqueId.Text.Trim());
                cmd.Parameters.AddWithValue("@permissionIds", permissionIds);

                cmd.ExecuteNonQuery();

                lblMessage.Text = "Record Updated.";

                cmd.Dispose();
                con.Close();
            }
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
                cmd.CommandText = "update role set isActive = 0 WHERE id = " + e.CommandArgument.ToString();
                cmd.ExecuteNonQuery();

                lblMessage.Text = "Record removed.";

                cmd.Dispose();
                con.Close();

                Response.Redirect("RolePermission.aspx");
            }
        }
        protected void frmVwAdmin_PreRender(object sender, EventArgs e)
        {
            if (frmVwAdmin.CurrentMode == FormViewMode.Edit)
            {
                CheckBoxList ddlPermissions = (CheckBoxList)frmVwAdmin.FindControl("permissions");
                if (!string.IsNullOrEmpty(numUniqueID.Text.ToString()))
                {
                    MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
                    MySqlCommand cmd = new MySqlCommand();
                    con.Open();
                    cmd.Connection = con;

                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "select * from role_permission_mapping where roleId = " + numUniqueID.Text;
                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            string departmentId = dr["permissionId"].ToString();
                            ddlPermissions.Items.FindByValue(departmentId).Selected = true;
                        }
                    }
                    cmd.Dispose();
                    con.Close();

                }
            }
        }

    }

}
using MySql.Data.MySqlClient;
using SMartMonitoringTool.Constants;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SMartMonitoringTool
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Abandon();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            con.Open();
            cmd.Connection = con;

            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select users.id,users.name,role.canEditRecords as canEditRecords from users left outer join role on role.id = users.roleId where username = '" + tbEmail.Text + "' and password = '" + textPassword.Text + "'";
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                Session.Add("numUserId", dr["id"].ToString());
                Session.Add("canEditRecords", dr["canEditRecords"].ToString());
                Session.Add("txtName", dr["name"].ToString());
                if (Request.QueryString["nextUrl"] != null)
                {
                    Response.Redirect(Request.QueryString["nextUrl"].ToString());
                }
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                lblErrorMessage.Visible = true;
            }
        }
    }
}
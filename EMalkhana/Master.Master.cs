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
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (null != Session["numUserId"] && null != Session["numUserId"].ToString())
            {
                //Check Role Permission
                //lblUserName.Text = Session["txtName"].ToString();
                MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
                MySqlCommand cmd = new MySqlCommand();
                con.Open();
                cmd.Connection = con;

                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select p.name as pname,users.name as name from users join role on role.id = users.roleId Join role_permission_mapping rpm on rpm.roleId = role.id JOIN permission p on p.id = rpm.permissionId where users.Id = " + Session["numUserId"].ToString();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lblUserName.Text = dr["name"].ToString();
                        Control control = FindControl(dr["pname"].ToString());
                        if (control != null)
                        {
                            control.Visible = true;
                        }
                    }
                }
                cmd.Dispose();
                con.Close();

            }
            else
            {
                if (Request.Url.AbsoluteUri.Contains("SearchMud.aspx") || Request.Url.AbsoluteUri.Contains("SearchMuds.aspx"))
                {
                    Response.Redirect("Login.aspx?nextUrl=" + Request.Url.AbsoluteUri);
                }
                Response.Redirect("Login.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            string path = HttpContext.Current.Request.Url.AbsolutePath;
            
            cmd.CommandText = "select * from users join role on role.id = users.roleId Join role_permission_mapping rpm on rpm.roleId = role.id JOIN permission p on p.id = rpm.permissionId where users.Id = " + Session["numUserId"].ToString() + " and p.url = '" + path + "'";
            MySqlDataReader dr = cmd.ExecuteReader();

            if (!dr.HasRows && !path.Contains("Dashboard"))
            {
                Response.Redirect("Dashboard.aspx");
            }
            cmd.Dispose();
            con.Close();
        }
    }
}
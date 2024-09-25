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
    public partial class StatusWise : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void frmVwAdmin_DataBound(object sender, EventArgs e)
        {

        }


        protected void lstVwAdmin_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lstView.DataBind();
        }
    }

}
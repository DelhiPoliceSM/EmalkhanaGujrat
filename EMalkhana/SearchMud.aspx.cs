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
    public partial class SearchMud : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string MudNumber = string.Empty;
            if (!string.IsNullOrEmpty(Request.QueryString["MudNo"]))
            {
                MudNumber = Request.QueryString["MudNo"];
            }
            else
            {
                MudNumber = mudNo.Text.Trim();
            }
            if (string.IsNullOrEmpty(MudNumber))
            {
                return;
            }
            int mudId = 0;
            using (MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString))
            {
                using(MySqlCommand cmd = new MySqlCommand())
                {
                    con.Open();
                    using (MySqlDataAdapter adp = new("select *, date(seizeDate) as sDate, department.name as departmentName, disposal.name as disposalName, receiptNo, status.name as statusName, courtname.name as courtName, users.name as updator from mud left outer join fir on fir.id = mud.firid left outer join users on users.id = mud.updatedBy left outer join department on department.id = fir.departmentId left outer join disposal on disposal.id = mud.disposalId left outer join courtname on courtname.id = fir.courtId left outer join status on status.id = fir.statusId where mud.mudNo = '" + MudNumber + "'", con))
                    {
                        DataTable dt = new("mud");
                        adp.Fill(dt);
                        con.Close();
                        lstView.DataSource = dt;
                        lstView.DataBind();
                        foreach (DataRow row in dt.Rows)
                        {
                            if (row.Field<UInt64>("isActive") == 1)
                            {
                                mudId = row.Field<object>("id") == null ? 0 : row.Field<Int32>("id");
                                txtMudNumber.Text = row.Field<object>("mudNo") == null ? "" : row.Field<string>("mudNo");
                                txtMudYear.Text = row.Field<object>("year") == null ? "" : row.Field<Int32>("year").ToString();
                                txtFIRNo.Text = row.Field<object>("firNo") == null ? "" : row.Field<string>("firNo");
                                policeStation.Text = row.Field<object>("departmentName") == null ? "" : row.Field<string>("departmentName");//Text = Convert.IsDBNull(row.Field<string>("mudNo");
                                txtIOName.Text = row.Field<object>("ioName") == null ? "" : row.Field<string>("ioName");
                                courtName.Text = row.Field<object>("courtName") == null ? "" : row.Field<string>("courtName");
                                status.Text = row.Field<object>("statusName") == null ? "" : row.Field<string>("statusName");
                                disposalName.Text = row.Field<object>("disposalName") == null ? "" : row.Field<string>("disposalName");
                                txtSeizureDate.Text = row.Field<object>("seizeDate") == null ? "" : row.Field<DateTime>("seizeDate").ToString("dd-MM-yyyy");
                                txtLocationOfMud.Text = row.Field<object>("location") == null ? "" : row.Field<string>("location");
                                receiptNo.Text = row.Field<object>("receiptNo") == null ? "" : row.Field<string>("receiptNo");
                                txtDescription.Text = row.Field<object>("description") == null ? "" : row.Field<string>("description");
                                //                            sectionList.Text = Convert.IsDBNull(row.Field<string>("mudNo"))?"": row.Field<string>("mudNo");
                                dateDestory.Text = row.Field<object>("dateDestroy") == null ? "" : row.Field<DateTime>("dateDestroy").ToString("dd-MM-yyyy");
                                destroyOrderDate.Text = row.Field<object>("dateOrderDestroy") == null ? "" : row.Field<DateTime>("dateOrderDestroy").ToString("dd-MM-yyyy");
                                decisionDate.Text = row.Field<object>("dateDecision") == null ? "" : row.Field<DateTime>("dateDecision").ToString("dd-MM-yyyy");
                                caseDecided.Checked = (1 == row.Field<UInt64>("caseDecided")) ? true : false;
                                image_upload_preview.ImageUrl = row.Field<object>("photoId") == null ? "" : row.Field<string>("photoId");
                            }
                        }

                    }
                    using (MySqlDataAdapter adp = new("select *, designation.name as designationName, case when iscourt = 1 then 'Court' else 'FSL' end as type,case when iscourt = 1 then courtname.name else fsl.name end as cname, users.name as rname from mudmovement left outer join courtname on courtname.id = mudmovement.goingAt left outer join designation on designation.id = mudmovement.designationid left outer join fsl on fsl.id = mudmovement.goingAt left outer join users on users.id = mudmovement.requestedBy where isCourt > 0 and mudNo = '" + MudNumber + "'", con))
                    {
                        DataTable dt = new("mud");
                        adp.Fill(dt);
                        con.Close();
                        courtDetails.DataSource = dt;
                        courtDetails.DataBind();
                    }
                }
            }
            using (MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    con.Open();
                    cmd.Connection = con;

                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = $"select * from firsection where mudId = {mudId}";
                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            string section = dr["sectionId"].ToString();
                            if(sectionList.Items.FindByValue(section) != null)  
                                sectionList.Items.FindByValue(section).Selected = true;
                        }
                    }
                    cmd.Dispose();
                    con.Close();
                }
            }
            this.sectionList.Attributes.Add("disabled", "");
        }

        protected void frmVwAdmin_DataBound(object sender, EventArgs e)
        {

        }

        protected void transfer_clicked(object sender, EventArgs e)
        {
            Console.WriteLine(e);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }

}
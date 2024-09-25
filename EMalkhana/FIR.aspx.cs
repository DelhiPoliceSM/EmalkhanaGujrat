using MySql.Data.MySqlClient;
using QRCoder;
using SMartMonitoringTool.Constants;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMalkhana
{
    public partial class FIR : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            bool present = false;
            foreach (var key in ViewState.Keys)
            {
                if (string.Equals(key, "first"))
                {
                    present = true;
                }
            }
            if (!present)
                ViewState["first"] = 1;
        }
        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            numUniqueID.Text = "0";
            frmVwAdmin.ChangeMode(FormViewMode.Insert);
            pnlAdmin.Visible = true;
            lblMessage.Text = "";
        }
        int valueReturned = 0;
        private void FeedData(string id)
        {
            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            con.Open();
            cmd.Connection = con;

            cmd.CommandType = CommandType.Text;
            cmd.CommandText = $"select am.actId as actId, fs.sectionId as secId from firsection fs left outer join act_mapping am on fs.sectionId = am.id where mudId = {id};";
            var reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                valueReturned = 1;
                DataTable dt = new DataTable();

                dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
                dt.Columns.Add(new DataColumn("Column1", typeof(string)));//for TextBox value   
                dt.Columns.Add(new DataColumn("Column2", typeof(string)));//for TextBox value   
                int index = 1;
                while (reader.Read())
                {
                    DataRow dr = dt.NewRow();
                    dr["RowNumber"] = index;
                    index++;
                    dr["Column1"] = reader["actId"].ToString();
                    dr["Column2"] = reader["secId"].ToString();
                    dt.Rows.Add(dr);
                }
                //Store the DataTable in ViewState for future reference   
                if (frmVwAdmin.FindControl("Gridview1") != null)
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (i == 0)
                        {
                            SetInitialRow();
                        }
                        else
                        {
                            AddNewRowToGrid();
                        }
                        if (frmVwAdmin.FindControl("Gridview1") != null)
                        {
                            DropDownList box1 = (DropDownList)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[1].FindControl("act");
                            ListBox box2 = (ListBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[2].FindControl("sectionList");
                            box1.SelectedValue = dt.Rows[i][1].ToString();
                            updateSection(ref box2, box1.SelectedValue);
                            box2.SelectedValue = dt.Rows[i][2].ToString();
                        }
                    }
                ViewState["CurrentTable"] = dt;

            }


            cmd.Dispose();

        }

        protected void frmVwAdmin_PreRender(object sender, EventArgs e)
        {
            if (frmVwAdmin.CurrentMode == FormViewMode.Insert)
            {
                if (int.Parse(ViewState["first"].ToString()) == 1)
                {
                    ViewState["first"] = 0;
                }
                else
                {
                    SetPreviousData();
                    //AddNewRowToGrid();
                }
            }
            else if (frmVwAdmin.CurrentMode == FormViewMode.Edit)
            {
                if (int.Parse(ViewState["first"].ToString()) == 1)
                {
                    FeedData(numUniqueID.Text);
                    if (ViewState["CurrentTable"] == null || valueReturned == 0)
                    {
                        SetInitialRow();
                    }
                    ViewState["first"] = 0;
                }

            }

        }
        private void SetInitialRow()
        {

            DataTable dt = new DataTable();
            DataRow dr = null;

            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("Column1", typeof(string)));//for TextBox value   
            dt.Columns.Add(new DataColumn("Column2", typeof(string)));//for TextBox value   
            dr = dt.NewRow();
            dr["RowNumber"] = 1;
            dr["Column1"] = string.Empty;
            dr["Column2"] = string.Empty;
            dt.Rows.Add(dr);

            //Store the DataTable in ViewState for future reference   
            ViewState["CurrentTable"] = dt;

            //Bind the Gridview   
            if (frmVwAdmin.FindControl("Gridview1") != null)
            {
                ((GridView)frmVwAdmin.FindControl("Gridview1")).DataSource = dt;
                ((GridView)frmVwAdmin.FindControl("Gridview1")).DataBind();
                DropDownList box1 = (DropDownList)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[0].Cells[1].FindControl("act");
                ListBox box2 = (ListBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[0].Cells[2].FindControl("sectionList");
                updateSection(ref box2, box1.SelectedValue);
            }

        }
        protected void Gridview1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];
                LinkButton lb = (LinkButton)e.Row.FindControl("LinkButton1");
                if (lb != null)
                {
                    if (dt.Rows.Count > 1)
                    {
                        if (e.Row.RowIndex == dt.Rows.Count - 1)
                        {
                            lb.Visible = false;
                        }
                    }
                    else
                    {
                        lb.Visible = false;
                    }
                }
            }
        }
        private void AddNewRowToGrid()
        {
            if (ViewState["CurrentTable"] != null)
            {

                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                DataRow drCurrentRow = null;

                if (dtCurrentTable.Rows.Count > 0)
                {
                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumber"] = dtCurrentTable.Rows.Count + 1;
                    drCurrentRow["Column1"] = string.Empty;
                    drCurrentRow["Column2"] = string.Empty;
                    dtCurrentTable.Rows.Add(drCurrentRow);
                    //Store the current data to ViewState for future reference   
                    for (int i = 0; i < dtCurrentTable.Rows.Count - 1; i++)
                    {
                        DropDownList box1 = (DropDownList)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[1].FindControl("act");
                        ListBox box2 = (ListBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[2].FindControl("sectionList");
                        dtCurrentTable.Rows[i]["Column1"] = box1.SelectedValue;
                        dtCurrentTable.Rows[i]["Column2"] = box2.SelectedValue;
                    }
                    ViewState["CurrentTable"] = dtCurrentTable;
                    //Rebind the Grid with the current data to reflect changes   
                    ((GridView)frmVwAdmin.FindControl("Gridview1")).DataSource = dtCurrentTable;
                    ((GridView)frmVwAdmin.FindControl("Gridview1")).DataBind();

                    DropDownList box11 = (DropDownList)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[dtCurrentTable.Rows.Count - 1].Cells[1].FindControl("act");
                    ListBox box12 = (ListBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[dtCurrentTable.Rows.Count - 1].Cells[2].FindControl("sectionList");
                    updateSection(ref box12, box11.SelectedValue);
                }
            }
            else
            {
                SetInitialRow();
                Response.Write("ViewState is null");

            }
            //Set Previous Data on Postbacks   
            SetPreviousData();
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
            Response.Redirect("FIR.aspx");
        }
        protected void btnSubmit_Click_ps(object sender, EventArgs e)
        {
            pnlAdmin.Visible = false;
            Response.Redirect("FIR.aspx");
        }


        protected void frmVwAdmin_DataBound(object sender, EventArgs e)
        {

        }

        protected void frmVwAdmin_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            TextBox txtMudYear = (TextBox)frmVwAdmin.FindControl("txtMudYear");
            TextBox txtFIRNo = (TextBox)frmVwAdmin.FindControl("txtFIRNo");
            DropDownList ddlPoliceStation = (DropDownList)frmVwAdmin.FindControl("ddlPoliceStation");
            DropDownList ddlFirType = (DropDownList)frmVwAdmin.FindControl("ddlFirType");
            DropDownList ddlCourt = (DropDownList)frmVwAdmin.FindControl("ddlCourtName");
            DropDownList ddlStatus = (DropDownList)frmVwAdmin.FindControl("ddlStatus");
            TextBox dateDecision = (TextBox)frmVwAdmin.FindControl("decisionDate");
            CheckBox caseDecided = (CheckBox)frmVwAdmin.FindControl("caseDecided");
            TextBox txtIOName = (TextBox)frmVwAdmin.FindControl("txtIOName");
            TextBox firDate = (TextBox)frmVwAdmin.FindControl("firDate");
            GridView gridView = (GridView)frmVwAdmin.FindControl("Gridview1");
            DropDownList ddlProsecutingAgency = (DropDownList)frmVwAdmin.FindControl("ddlProsecutingAgency");
            TextBox fromWhom = (TextBox)frmVwAdmin.FindControl("fromWhom");
            TextBox fromWhere = (TextBox)frmVwAdmin.FindControl("fromWhere");
            string sectionIds = "";
            for (int i = 0; i < gridView.Rows.Count; i++)
            {
                ListBox box2 = (ListBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[2].FindControl("sectionList");
                sectionIds += $"{box2.SelectedValue},";
            }
            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            con.Open();
            cmd.Connection = con;
            // (IN id int, IN mudNo varchar(45), IN year int, IN departmentId int, IN headId int, IN photoId int , IN seizeDate DATE,
            // IN ioName varchar(45), IN description varchar(500), IN statusId int, IN location varchar(500), IN caseDecided bit,
            // IN dateDecision DATE, IN courtId int, IN dateOrderDestroy DATE, IN dateDestroy DATE, IN disposalId int,
            // IN qrCodeId int, IN updatedBy INT, IN isActive int )
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_fir_add";
            cmd.Parameters.AddWithValue("@numId", 0);
            cmd.Parameters.AddWithValue("@year", txtMudYear.Text.Trim());
            cmd.Parameters.AddWithValue("@departmentId", ddlPoliceStation.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@numFirTypeId", ddlFirType.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@ioName", txtIOName.Text.Trim());
            cmd.Parameters.AddWithValue("@bCaseDecided", caseDecided.Checked);
            cmd.Parameters.AddWithValue("@dtDateDecided", string.IsNullOrEmpty(dateDecision.Text.Trim()) ? DBNull.Value : dateDecision.Text.Trim());
            cmd.Parameters.AddWithValue("@numcourtid", ddlCourt.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@numstatusid", ddlStatus.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@numProsecutionAgencyid", ddlProsecutingAgency.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@txtFromWhom", fromWhere.Text.Trim());
            cmd.Parameters.AddWithValue("@txtfromWhere", fromWhom.Text.Trim());
            cmd.Parameters.AddWithValue("@isActive", 1);
            cmd.Parameters.AddWithValue("@txtfirNo", txtFIRNo.Text.Trim());
            cmd.Parameters.AddWithValue("@dtfirDate", firDate.Text.Trim());
            cmd.Parameters.AddWithValue("@updatedBy", Session["numUserId"].ToString());
            cmd.Parameters.AddWithValue("@sectionIds", sectionIds);

            cmd.ExecuteNonQuery();

            lblMessage.Text = "Record Updated.";

            cmd.Dispose();
            con.Close();
            e.Cancel = true;
            ViewState["CurrentTable"] = null;
        }

        protected void frmVwAdmin_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            TextBox txtMudYear = (TextBox)frmVwAdmin.FindControl("txtMudYear");
            DropDownList ddlProsecutingAgency = (DropDownList)frmVwAdmin.FindControl("ddlProsecutingAgency");
            TextBox fromWhom = (TextBox)frmVwAdmin.FindControl("fromWhom");
            TextBox fromWhere = (TextBox)frmVwAdmin.FindControl("fromWhere");
            TextBox txtFIRNo = (TextBox)frmVwAdmin.FindControl("txtFIRNo");
            DropDownList ddlFirType = (DropDownList)frmVwAdmin.FindControl("ddlFirType");
            DropDownList ddlPoliceStation = (DropDownList)frmVwAdmin.FindControl("ddlPoliceStation");
            TextBox txtIOName = (TextBox)frmVwAdmin.FindControl("txtIOName");
            DropDownList ddlCourt = (DropDownList)frmVwAdmin.FindControl("ddlCourtName");
            DropDownList ddlStatus = (DropDownList)frmVwAdmin.FindControl("ddlStatus");
            TextBox dateDecision = (TextBox)frmVwAdmin.FindControl("decisionDate");
            CheckBox caseDecided = (CheckBox)frmVwAdmin.FindControl("caseDecided");
            TextBox firDate = (TextBox)frmVwAdmin.FindControl("firDate");
            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            con.Open();
            cmd.Connection = con;
            // (IN id int, IN mudNo varchar(45), IN year int, IN departmentId int, IN headId int, IN photoId int , IN seizeDate DATE,
            // IN ioName varchar(45), IN description varchar(500), IN statusId int, IN location varchar(500), IN caseDecided bit,
            // IN dateDecision DATE, IN courtId int, IN dateOrderDestroy DATE, IN dateDestroy DATE, IN disposalId int,
            // IN qrCodeId int, IN updatedBy INT, IN isActive int )
            GridView gridView = (GridView)frmVwAdmin.FindControl("Gridview1");
            string sectionIds = "";
            for (int i = 0; i < gridView.Rows.Count; i++)
            {
                ListBox box2 = (ListBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[2].FindControl("sectionList");
                sectionIds += $"{box2.SelectedValue},";
            }
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_fir_update";
            cmd.Parameters.AddWithValue("@bCaseDecided", caseDecided.Checked);
            cmd.Parameters.AddWithValue("@dtDateDecided", string.IsNullOrEmpty(dateDecision.Text.Trim()) ? DBNull.Value : dateDecision.Text.Trim());
            cmd.Parameters.AddWithValue("@numCourtId", ddlCourt.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@numstatusId", ddlStatus.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@numId", numUniqueID.Text.ToString());
            cmd.Parameters.AddWithValue("@numyear", txtMudYear.Text.Trim());
            cmd.Parameters.AddWithValue("@numdepartmentId", ddlPoliceStation.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@numFirTypeId", ddlFirType.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@txtioName", txtIOName.Text.Trim());
            cmd.Parameters.AddWithValue("@dtfirDate", firDate.Text.Trim());
            cmd.Parameters.AddWithValue("@isActive", 1);
            cmd.Parameters.AddWithValue("@numProsecutionAgencyid", ddlProsecutingAgency.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@txtFromWhom", fromWhere.Text.Trim());
            cmd.Parameters.AddWithValue("@txtfromWhere", fromWhom.Text.Trim());
            cmd.Parameters.AddWithValue("@txtfirNo", txtFIRNo.Text.Trim());
            cmd.Parameters.AddWithValue("@numupdatedBy", Session["numUserId"].ToString());
            cmd.Parameters.AddWithValue("@sectionIds", sectionIds);

            cmd.ExecuteNonQuery();

            lblMessage.Text = "Record Updated.";

            cmd.Dispose();
            con.Close();
            e.Cancel = true;
            ViewState["CurrentTable"] = null;
        }
        //
        protected void frmVwAdmin_transfer(object sender, FormViewUpdateEventArgs e)
        {
        }
        //transfer_submit
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            frmVwAdmin.ChangeMode(FormViewMode.ReadOnly);
            pnlAdmin.Visible = false;
            ViewState["CurrentTable"] = null;
            ViewState["first"] = 1;
        }
        protected void btnCancel_Click_ps(object sender, EventArgs e)
        {
            frmVwAdmin.ChangeMode(FormViewMode.ReadOnly);
        }
        protected void btnCancel_Click_qr(object sender, EventArgs e)
        {
            frmVwAdmin.ChangeMode(FormViewMode.ReadOnly);
        }
        protected void lstVwAdmin_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "EDITRECORD")
            {
                ViewState["first"] = 1;
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
                cmd.CommandText = "update fir set isActive = 0 WHERE id = " + e.CommandArgument.ToString();
                cmd.ExecuteNonQuery();

                lblMessage.Text = "Record removed.";

                cmd.Dispose();
                con.Close();

                Response.Redirect("FIR.aspx");
            }
        }
        protected void ddlDisposal_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlPoliceStation = sender as DropDownList;
            RequiredFieldValidator ddlPoliceStationExtender = (RequiredFieldValidator)frmVwAdmin.FindControl("ddlPoliceStationExtender");
            if (ddlPoliceStation.SelectedValue == "0")
            {
            }
        }
        protected void ddlPoliceStation_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        protected void ddlFSL_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        string mudId;
        [WebMethod]
        public void transfer(string id)
        {
            mudId = id.ToString();
        }
        protected void transfer_clicked(object sender, EventArgs e)
        {
            Console.WriteLine(e);
        }

        protected void ddlHead_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlHeadStation = sender as DropDownList;
            RequiredFieldValidator ddlHeadExtender = (RequiredFieldValidator)frmVwAdmin.FindControl("ddlHeadExtender");
            if (ddlHeadStation.SelectedValue == "0")
            {
            }
        }

        protected void ddlCourtName_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlCourtName = sender as DropDownList;
            RequiredFieldValidator ddlCourtNameExtender = (RequiredFieldValidator)frmVwAdmin.FindControl("ddlCourtNameExtender");
            if (ddlCourtName.SelectedValue == "0")
            {
            }
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlStatus = sender as DropDownList;
            RequiredFieldValidator ddlStatusExtender = (RequiredFieldValidator)frmVwAdmin.FindControl("ddlStatusExtender");
            if (ddlStatus.SelectedValue == "0")
            {
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            GridViewRow gvRow = (GridViewRow)lb.NamingContainer;
            int rowID = gvRow.RowIndex;
            if (ViewState["CurrentTable"] != null)
            {

                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 1)
                {
                    if (gvRow.RowIndex < dt.Rows.Count - 1)
                    {
                        //Remove the Selected Row data and reset row number  
                        dt.Rows.Remove(dt.Rows[rowID]);
                        ResetRowID(dt);
                    }
                }

                //Store the current data in ViewState for future reference  
                ViewState["CurrentTable"] = dt;

                //Re bind the GridView for the updated data  
                ((GridView)frmVwAdmin.FindControl("Gridview1")).DataSource = dt;
                ((GridView)frmVwAdmin.FindControl("Gridview1")).DataBind();
            }

            //Set Previous Data on Postbacks  
            SetPreviousData();
        }
        private void ResetRowID(DataTable dt)
        {
            int rowNumber = 1;
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    row[0] = rowNumber;
                    rowNumber++;
                }
            }
        }
        private void SetPreviousData()
        {

            int rowIndex = 0;
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        DropDownList box1 = (DropDownList)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[1].FindControl("act");
                        ListBox box2 = (ListBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[2].FindControl("sectionList");
                        if (dt.Rows[i]["Column1"].ToString() != string.Empty)
                        {
                            box1.SelectedValue = dt.Rows[i]["Column1"].ToString();
                            updateSection(ref box2, box1.SelectedValue);
                        }
                        if (dt.Rows[i]["Column2"].ToString() != string.Empty)
                            box2.SelectedValue = dt.Rows[i]["Column2"].ToString();
                        rowIndex++;
                    }
                }
            }
        }
        /*        protected void frmVwAdmin_PreRender(object sender, EventArgs e)
                {
                    if (frmVwAdmin.CurrentMode == FormViewMode.Edit)
                    {
                        ListBox sectionList = (ListBox)frmVwAdmin.FindControl("sectionList");
                        if (!string.IsNullOrEmpty(numUniqueID.Text.ToString()))
                        {
                            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
                            MySqlCommand cmd = new MySqlCommand();
                            con.Open();
                            cmd.Connection = con;

                            cmd.CommandType = CommandType.Text;
                            cmd.CommandText = "select * from firsection where mudId = " + numUniqueID.Text;
                            MySqlDataReader dr = cmd.ExecuteReader();
                            if (dr.HasRows)
                            {
                                while (dr.Read())
                                {
                                    string section = dr["sectionId"].ToString();
                                    sectionList.Items.FindByValue(section).Selected = true;
                                }
                            }
                            cmd.Dispose();
                            con.Close();

                        }
                    }
                }*/
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            AddNewRowToGrid();
        }

        protected void act_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList act = ((DropDownList)sender);
            ListBox section = (ListBox)act.Parent.FindControl("sectionList");
            updateSection(ref section, act.SelectedValue);
        }
        private void updateSection(ref ListBox section, string actValue)
        {
            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            con.Open();
            cmd.Connection = con;
            section.Items.Clear();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = $"select am.id as secId, asec.name as asecName from act_mapping am left outer join act_section asec on am.actsectionid = asec.id where am.Isactive = 1 and actId = {actValue}";
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    section.Items.Add(new ListItem(dr["asecName"].ToString(), dr["secId"].ToString()));
                }
            }
            section.DataBind();
            cmd.Dispose();
            con.Close();
        }
        protected void isPresentedInCourt_CheckedChanged(object sender, EventArgs e)
        {
        }

        protected void textSubmit_Click(object sender, EventArgs e)
        {
            if (txtMudhNo.Text.Length == 0)
            {
                // do nothing;
                Response.Write("alert(\"Please enter mudh no to search\")");
                return;
            }
            lstView.DataBind();
        }
    }

}
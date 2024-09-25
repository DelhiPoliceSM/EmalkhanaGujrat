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
    public partial class Receipt : System.Web.UI.Page
    {
        private Bitmap qrCodeImage;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !string.IsNullOrEmpty(Request.QueryString["MudNo"]))
            {
                txtMudhNo.Text = Request.QueryString["MudNo"];
                lstView.DataBind();
            }
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
            Response.Redirect("Receipt.aspx");
        }
        protected void btnSubmit_Click_ps(object sender, EventArgs e)
        {
        }


        protected void frmVwAdmin_DataBound(object sender, EventArgs e)
        {

        }

        protected void frmVwAdmin_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            bool boolDoAction = true;
            TextBox txtSeizureDate = (TextBox)frmVwAdmin.FindControl("txtSeizureDate");
            TextBox receiptNo = (TextBox)frmVwAdmin.FindControl("receiptNo");
            ListBox txtFIRNo = (ListBox)frmVwAdmin.FindControl("firNumber");
            GridView gridView1 = (GridView)frmVwAdmin.FindControl("Gridview1");
            GridView gridView2 = (GridView)frmVwAdmin.FindControl("Gridview2");
            string firId = "";
            foreach (ListItem item in txtFIRNo.Items)
            {
                if (item.Selected)
                {

                    firId = item.Value; break;
                }
            }

            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            con.Open();
            for (int i = 0; i < gridView1.Rows.Count; i++)
            {
                /*                string ddlDisposal = ((DropDownList)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[4].FindControl("ddlDisposal")).SelectedValue;
                                string dateDestory = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[6].FindControl("TextBox6")).Text;
                                string destroyOrderDate = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[5].FindControl("destroyOrderDate")).Text;
                */
                string mudNumber = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[1].FindControl("TextBox1")).Text;
                string mudDescription = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[2].FindControl("TextBox2")).Text;
                string mudLocation = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[3].FindControl("TextBox3")).Text;
                string price = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[4].FindControl("TextBox4")).Text;
                //              FileUpload fileUpload = ((FileUpload)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[7].FindControl("fileUpload"));
                string photoId = string.Empty;
                //            string disposalOrderNumber = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[7].FindControl("TextBox7")).Text;

                /*                if (fileUpload.HasFile)
                                {
                                    string time = DateTime.Now.ToString("yyyyMMddHHmmss");
                                    string extension = Path.GetExtension(fileUpload.FileName);
                                    string folder = Request.PhysicalApplicationPath + "photo" + "\\";
                                    var path = Path.Combine(folder, time + extension);
                                    fileUpload.SaveAs(path);
                                    photoId = "photo/" + time + extension;
                                }
                */
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_mud_add";
                cmd.Parameters.AddWithValue("@numId", 0);
                cmd.Parameters.AddWithValue("@txtmudNo", mudNumber.Trim());
                cmd.Parameters.AddWithValue("@description", mudDescription.Trim());
                cmd.Parameters.AddWithValue("@location", mudLocation.Trim());
                cmd.Parameters.AddWithValue("@receiptNo", receiptNo.Text.Trim());
                cmd.Parameters.AddWithValue("@seizeDate", string.IsNullOrEmpty(txtSeizureDate.Text.Trim()) ? DBNull.Value : txtSeizureDate.Text.Trim());
                cmd.Parameters.AddWithValue("@txtDisposalOrderNumber", "");
                cmd.Parameters.AddWithValue("@dateOrderDestroy", DBNull.Value);
                cmd.Parameters.AddWithValue("@dateDestroy", DBNull.Value);
                cmd.Parameters.AddWithValue("@disposalId", "3");
                cmd.Parameters.AddWithValue("@isActive", 1);
                cmd.Parameters.AddWithValue("@firId", txtFIRNo.SelectedValue);
                cmd.Parameters.AddWithValue("@updatedBy", Session["numUserId"].ToString());
                cmd.Parameters.AddWithValue("@photoId", photoId);



                cmd.Parameters.AddWithValue("@txtPrice", price.Trim());

                cmd.ExecuteNonQuery();

                lblMessage.Text = "Record Updated.";

                cmd.Dispose();

            }

            for (int i = 0; i < gridView2.Rows.Count; i++)
            {
                /*                string ddlDisposal = ((DropDownList)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[4].FindControl("ddlDisposal")).SelectedValue;
                                string dateDestory = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[6].FindControl("TextBox6")).Text;
                                string destroyOrderDate = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[5].FindControl("destroyOrderDate")).Text;
                */
                string mudNumber = ((TextBox)gridView2.Rows[i].Cells[1].FindControl("TextBox1")).Text;
                string mudDescription = ((TextBox)gridView2.Rows[i].Cells[2].FindControl("TextBox2")).Text;
                string mudLocation = ((TextBox)gridView2.Rows[i].Cells[3].FindControl("TextBox3")).Text;
                string price = ((TextBox)gridView2.Rows[i].Cells[4].FindControl("TextBox4")).Text;
                //              FileUpload fileUpload = ((FileUpload)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[7].FindControl("fileUpload"));
                string photoId = string.Empty;
                //            string disposalOrderNumber = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[7].FindControl("TextBox7")).Text;

                /*                if (fileUpload.HasFile)
                                {
                                    string time = DateTime.Now.ToString("yyyyMMddHHmmss");
                                    string extension = Path.GetExtension(fileUpload.FileName);
                                    string folder = Request.PhysicalApplicationPath + "photo" + "\\";
                                    var path = Path.Combine(folder, time + extension);
                                    fileUpload.SaveAs(path);
                                    photoId = "photo/" + time + extension;
                                }
                */
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_mud_add";
                cmd.Parameters.AddWithValue("@numId", 0);
                cmd.Parameters.AddWithValue("@txtmudNo", mudNumber.Trim());
                cmd.Parameters.AddWithValue("@description", mudDescription.Trim());
                cmd.Parameters.AddWithValue("@location", mudLocation.Trim());
                cmd.Parameters.AddWithValue("@receiptNo", receiptNo.Text.Trim());
                cmd.Parameters.AddWithValue("@seizeDate", string.IsNullOrEmpty(txtSeizureDate.Text.Trim()) ? DBNull.Value : txtSeizureDate.Text.Trim());
                cmd.Parameters.AddWithValue("@txtDisposalOrderNumber", "");
                cmd.Parameters.AddWithValue("@dateOrderDestroy", DBNull.Value);
                cmd.Parameters.AddWithValue("@dateDestroy", DBNull.Value);
                cmd.Parameters.AddWithValue("@disposalId", "3");
                cmd.Parameters.AddWithValue("@isActive", 1);
                cmd.Parameters.AddWithValue("@firId", txtFIRNo.SelectedValue);
                cmd.Parameters.AddWithValue("@updatedBy", Session["numUserId"].ToString());
                cmd.Parameters.AddWithValue("@photoId", photoId);



                cmd.Parameters.AddWithValue("@txtPrice", price.Trim());

                cmd.ExecuteNonQuery();

                lblMessage.Text = "Record Updated.";

                cmd.Dispose();

            }
            con.Close();

            //          FileUpload upload = (FileUpload)frmVwAdmin.FindControl("inputFile");
            /*
                          string photoId = "";
            if (upload.HasFile)
                        {
                            string time = DateTime.Now.ToString("yyyyMMddHHmmss");
                            string extension = Path.GetExtension(upload.FileName);
                            string folder = Request.PhysicalApplicationPath + "photo" + "\\";
                            var path = Path.Combine(folder, time + extension);
                            upload.SaveAs(path);
                            photoId = "photo/" + time + extension;
                        }
            */
            e.Cancel = true;
            ViewState["Gridview1"] = null;
        }

        protected void frmVwAdmin_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            TextBox txtSeizureDate = (TextBox)frmVwAdmin.FindControl("txtSeizureDate");
            TextBox receiptNo = (TextBox)frmVwAdmin.FindControl("receiptNo");
            DropDownList txtFIRNo = (DropDownList)frmVwAdmin.FindControl("firNumber");
            GridView gridView1 = (GridView)frmVwAdmin.FindControl("Gridview1");
            string firId = "";
            foreach (ListItem item in txtFIRNo.Items)
            {
                if (item.Selected)
                {
                    firId = item.Value; break;
                }
            }

            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            con.Open();
            for (int i = 0; i < gridView1.Rows.Count; i++)
            {
                /*                string ddlDisposal = ((DropDownList)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[4].FindControl("ddlDisposal")).SelectedValue;
                                string dateDestory = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[6].FindControl("TextBox6")).Text;
                                string destroyOrderDate = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[5].FindControl("destroyOrderDate")).Text;
                                FileUpload fileUpload = ((FileUpload)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[7].FindControl("fileUpload"));
                                string disposalOrderNumber = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[7].FindControl("TextBox7")).Text;
                */
                string mudNumber = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[1].FindControl("TextBox1")).Text;
                string mudDescription = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[2].FindControl("TextBox2")).Text;
                string mudLocation = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[3].FindControl("TextBox3")).Text;
                string price = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[4].FindControl("TextBox4")).Text;
                string photoId = string.Empty;

                /*                if (fileUpload.HasFile)
                                {
                                    string time = DateTime.Now.ToString("yyyyMMddHHmmss");
                                    string extension = Path.GetExtension(fileUpload.FileName);
                                    string folder = Request.PhysicalApplicationPath + "photo" + "\\";
                                    var path = Path.Combine(folder, time + extension);
                                    fileUpload.SaveAs(path);
                                    photoId = "photo/" + time + extension;
                                }
                */
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_mud_add";
                cmd.Parameters.AddWithValue("@numId", 0);
                cmd.Parameters.AddWithValue("@txtmudNo", mudNumber.Trim());
                cmd.Parameters.AddWithValue("@description", mudDescription.Trim());
                cmd.Parameters.AddWithValue("@location", mudLocation.Trim());
                cmd.Parameters.AddWithValue("@receiptNo", receiptNo.Text.Trim());
                cmd.Parameters.AddWithValue("@seizeDate", string.IsNullOrEmpty(txtSeizureDate.Text.Trim()) ? DBNull.Value : txtSeizureDate.Text.Trim());
                cmd.Parameters.AddWithValue("@txtDisposalOrderNumber", "");
                cmd.Parameters.AddWithValue("@dateOrderDestroy", DBNull.Value);
                cmd.Parameters.AddWithValue("@dateDestroy", DBNull.Value);
                cmd.Parameters.AddWithValue("@disposalId", "3");
                cmd.Parameters.AddWithValue("@isActive", 1);
                cmd.Parameters.AddWithValue("@firId", txtFIRNo.SelectedValue);
                cmd.Parameters.AddWithValue("@updatedBy", Session["numUserId"].ToString());
                cmd.Parameters.AddWithValue("@photoId", string.Empty);


                cmd.Parameters.AddWithValue("@txtPrice", price.Trim());

                cmd.ExecuteNonQuery();

                lblMessage.Text = "Record Updated.";
                cmd.Dispose();
            }
            con.Close();
            e.Cancel = true;
            ViewState["Gridview1"] = null;
        }
        //
        protected void btnCancel_Print_qr(object sender, EventArgs e)
        {
            PrintDocument pd = new PrintDocument();
            pd.PrintPage += PrintPage;
            pd.Print();
        }
        private void PrintPage(object o, PrintPageEventArgs e)
        {
            System.Drawing.Image img = qrCodeImage;
            Point loc = new Point(100, 100);
            e.Graphics.DrawImage(img, loc);
        }
        //transfer_submit
        protected void lstVwAdmin_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "EDITRECORD")
            {
                ViewState["first"] = 1;
                numUniqueID1.Text = e.CommandArgument.ToString();
                numUniqueID.Text = e.CommandArgument.ToString().Split(new string[] { " ;; " }, StringSplitOptions.None)[0];
                frmVwAdmin.ChangeMode(FormViewMode.Edit);
                pnlAdmin.Visible = true;
                lblMessage.Text = "";
            }
            else if (e.CommandName == "DELETERECORD")
            {
                MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
                MySqlCommand cmd = new MySqlCommand();
                con.Open();
                cmd.Connection = con;

                cmd.CommandType = CommandType.Text;
                string[] split = e.CommandArgument.ToString().Split(new string[] { " ;; " }, StringSplitOptions.None);
                cmd.CommandText = "update mud set isActive = 0 WHERE receiptNo = '" + split[0] + "' and year(seizeDate) = " + split[1];
                cmd.ExecuteNonQuery();

                lblMessage.Text = "Record removed.";

                cmd.Dispose();
                con.Close();

                Response.Redirect("Receipt.aspx");
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
        int valueReturned = 0;
        private void FeedData(string id)
        {
            string[] split = id.Split(new string[] { " ;; " }, StringSplitOptions.None);
            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            con.Open();
            cmd.Connection = con;

            cmd.CommandType = CommandType.Text;
            cmd.CommandText = $"select * from mud where isActive = 1 and receiptNo = {split[0]} and year(seizeDate) = {split[1]}";
            var canEditRecords = Session["canEditRecords"].ToString() == "1";
            var reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                valueReturned = 1;
                DataTable dt = new DataTable();

                dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
                dt.Columns.Add(new DataColumn("Column1", typeof(string)));//for TextBox value   
                dt.Columns.Add(new DataColumn("Column2", typeof(string)));//for TextBox value   
                dt.Columns.Add(new DataColumn("Column3", typeof(string)));//for DropDownList selected item   
                dt.Columns.Add(new DataColumn("Column4", typeof(string)));//for DropDownList selected item   
                /*                dt.Columns.Add(new DataColumn("Column4", typeof(string)));//for DropDownList selected item   
                                dt.Columns.Add(new DataColumn("Column5", typeof(string)));
                                dt.Columns.Add(new DataColumn("Column6", typeof(string)));
                                dt.Columns.Add(new DataColumn("Column7", typeof(string)));
                */
                int index = 1;
                while (reader.Read())
                {
                    DataRow dr = dt.NewRow();
                    dr["RowNumber"] = index;
                    index++;
                    dr["Column1"] = reader["mudNo"].ToString();
                    dr["Column2"] = reader["description"].ToString();
                    dr["Column3"] = reader["location"].ToString();
                    dr["Column4"] = reader["price"].ToString();
                    /*                    dr["Column4"] = reader["disposalid"].ToString();
                                        dr["Column5"] = reader["dateOrderDestroy"].ToString();
                                        dr["Column6"] = reader["dateDestroy"].ToString();
                                        dr["Column7"] = reader["txtdisposalOrderNumber"].ToString();
                    */
                    dt.Rows.Add(dr);
                }
                notEnabledRowCount.Text = dt.Rows.Count.ToString();
                //Store the DataTable in ViewState for future reference   
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
                        TextBox box1 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[1].FindControl("TextBox1");
                        TextBox box2 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[2].FindControl("TextBox2");
                        TextBox box3 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[3].FindControl("TextBox3");
                        TextBox box4 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[4].FindControl("TextBox4");
                        /*                        DropDownList ddlDisposal = (DropDownList)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[4].FindControl("ddlDisposal");
                                                TextBox box5 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[5].FindControl("destroyOrderDate");
                                                TextBox box6 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[6].FindControl("TextBox6");
                                                TextBox box7 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[7].FindControl("TextBox7");
                        */
                        box1.Text = dt.Rows[i][1].ToString();
                        box2.Text = dt.Rows[i][2].ToString();
                        box3.Text = dt.Rows[i][3].ToString();
                        box4.Text = dt.Rows[i][4].ToString();
                        //                        ddlDisposal.SelectedValue = dt.Rows[i][4].ToString();
                        /*
                         *                         string date1 = dt.Rows[i][5].ToString();
                                              string date2 = dt.Rows[i][6].ToString();
                      box5.Text = !string.IsNullOrEmpty(date1) ? DateTime.ParseExact(date1, "dd-MM-yyyy HH:mm:ss",
                                                             System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";
                                              box6.Text = !string.IsNullOrEmpty(date2) ? DateTime.ParseExact(date2, "dd-MM-yyyy HH:mm:ss",
                                                             System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";
                                              box7.Text = dt.Rows[i][7].ToString();
                        */
                    }
                }
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    TextBox box1 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[1].FindControl("TextBox1");
                    TextBox box2 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[2].FindControl("TextBox2");
                    TextBox box3 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[3].FindControl("TextBox3");
                    TextBox box4 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[4].FindControl("TextBox4");
                    /*                    DropDownList ddlDisposal = (DropDownList)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[4].FindControl("ddlDisposal");
                                        TextBox box5 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[5].FindControl("destroyOrderDate");
                                        TextBox box6 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[6].FindControl("TextBox6");
                                        TextBox box7 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[7].FindControl("TextBox7");
                    */
                    LinkButton button = (LinkButton)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[6].FindControl("LinkButton1");

                    if (!canEditRecords)
                    {
                        box2.Enabled = false;
                        box3.Enabled = false;
                        box4.Enabled = false;
                        /*                        box5.Enabled = false;
                                                box6.Enabled = false;
                                                box7.Enabled = false;
                                                ddlDisposal.Enabled = false;
                        */
                        button.Enabled = false;
                    }
                }
                ViewState["Gridview1"] = dt;

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
                    FeedData(numUniqueID1.Text);
                    if (ViewState["Gridview1"] == null || valueReturned == 0)
                    {
                        SetInitialRow();
                    }
                    ViewState["first"] = 0;
                }

            }

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

        protected void Gridview2_RowCreated(object sender, GridViewRowEventArgs e) 
        {
        }
        
        protected void Gridview3_RowCreated(object sender, GridViewRowEventArgs e) 
        { 
        }
        
        protected void Gridview1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataTable dt = (DataTable)ViewState["Gridview1"];
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
            if (ViewState["Gridview1"] != null)
            {

                DataTable dtCurrentTable = (DataTable)ViewState["Gridview1"];
                DataRow drCurrentRow = null;

                if (dtCurrentTable.Rows.Count > 0)
                {
                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumber"] = dtCurrentTable.Rows.Count + 1;
                    TextBox txtSeizureDate = (TextBox)frmVwAdmin.FindControl("txtSeizureDate");
                    TextBox receiptNo = (TextBox)frmVwAdmin.FindControl("receiptNo");
                    drCurrentRow["Column1"] = $"{DateTime.Parse(txtSeizureDate.Text).ToString("yyyy")}/{receiptNo.Text}/{dtCurrentTable.Rows.Count + 1}";
                    //add new row to DataTable   
                    dtCurrentTable.Rows.Add(drCurrentRow);
                    //Store the current data to ViewState for future reference   
                    var canEditRecords = Session["canEditRecords"].ToString() == "1";
                    var notEnabled = !string.IsNullOrEmpty(notEnabledRowCount.Text) ? int.Parse(notEnabledRowCount.Text) : 0;
                    for (int i = 0; i < dtCurrentTable.Rows.Count - 1; i++)
                    {

                        //extract the TextBox values   

                        TextBox box1 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[1].FindControl("TextBox1");
                        TextBox box2 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[2].FindControl("TextBox2");
                        TextBox box3 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[3].FindControl("TextBox3");
                        TextBox box4 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[4].FindControl("TextBox4");
                        /*                        DropDownList ddlDisposal = ((DropDownList)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[4].FindControl("ddlDisposal"));
                                                TextBox dateDestory = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[6].FindControl("TextBox6"));
                                                TextBox destroyOrderDate = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[5].FindControl("destroyOrderDate"));
                                                TextBox disposalOrderNumber = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[7].FindControl("TextBox7"));
                        */
                        dtCurrentTable.Rows[i]["Column1"] = box1.Text;
                        dtCurrentTable.Rows[i]["Column2"] = box2.Text;
                        dtCurrentTable.Rows[i]["Column3"] = box3.Text;
                        dtCurrentTable.Rows[i]["Column4"] = box4.Text;
                        /*                      dtCurrentTable.Rows[i]["Column4"] = ddlDisposal.SelectedValue;
                                              dtCurrentTable.Rows[i]["Column5"] = dateDestory.Text;
                                              dtCurrentTable.Rows[i]["Column6"] = destroyOrderDate.Text;
                                              dtCurrentTable.Rows[i]["Column7"] = disposalOrderNumber.Text;
                        */
                    }
                    ViewState["Gridview1"] = dtCurrentTable;
                    //Rebind the Grid with the current data to reflect changes   
                    ((GridView)frmVwAdmin.FindControl("Gridview1")).DataSource = dtCurrentTable;
                    ((GridView)frmVwAdmin.FindControl("Gridview1")).DataBind();
                    for (int i = 0; !canEditRecords && i < notEnabled; i++)
                    {
                        TextBox box2 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[2].FindControl("TextBox2");
                        TextBox box3 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[3].FindControl("TextBox3");
                        TextBox box4 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[4].FindControl("TextBox4");
                        /*                        DropDownList ddlDisposal = ((DropDownList)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[4].FindControl("ddlDisposal"));
                                                TextBox dateDestory = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[6].FindControl("TextBox6"));
                                                TextBox disposalOrderDate = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[7].FindControl("TextBox7"));
                                                TextBox destroyOrderDate = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[5].FindControl("destroyOrderDate"));
                        */
                        LinkButton button = (LinkButton)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[6].FindControl("LinkButton1");
                        box2.Enabled = false;
                        box3.Enabled = false;
                        box4.Enabled = false;
                        button.Enabled = false;
                        /*                        dateDestory.Enabled = false;
                                                destroyOrderDate.Enabled = false;
                                                ddlDisposal.Enabled = false;
                                                disposalOrderDate.Enabled = false;
                        */
                    }
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
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            frmVwAdmin.ChangeMode(FormViewMode.ReadOnly);
            ViewState["first"] = 1;
            ViewState["Gridview1"] = null;
            notEnabledRowCount.Text = "0";
            pnlAdmin.Visible = false;
        }
        private void SetInitialRow()
        {

            DataTable dt = new DataTable();
            DataRow dr = null;

            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("Column1", typeof(string)));//for TextBox value   
            dt.Columns.Add(new DataColumn("Column2", typeof(string)));//for TextBox value   
            dt.Columns.Add(new DataColumn("Column3", typeof(string)));//for DropDownList selected item   
            dt.Columns.Add(new DataColumn("Column4", typeof(string)));//for DropDownList selected item   
            /*            dt.Columns.Add(new DataColumn("Column4", typeof(string)));//for DropDownList selected item
                        dt.Columns.Add(new DataColumn("Column5", typeof(string)));//for DropDownList selected item
                        dt.Columns.Add(new DataColumn("Column6", typeof(string)));//for DropDownList selected item
                        dt.Columns.Add(new DataColumn("Column7", typeof(string)));//for DropDownList selected item
            */
            dr = dt.NewRow();
            dr["RowNumber"] = 1;
            TextBox txtSeizureDate = (TextBox)frmVwAdmin.FindControl("txtSeizureDate");
            TextBox receiptNo = (TextBox)frmVwAdmin.FindControl("receiptNo");
            if (txtSeizureDate != null)
                dr["Column1"] = $"{DateTime.Parse(txtSeizureDate.Text).ToString("yyyy")}/{receiptNo.Text}/1";
            else
                dr["Column1"] = string.Empty;
            dr["Column2"] = string.Empty;
            dr["Column3"] = string.Empty;
            dr["Column4"] = string.Empty;
            /*            dr["Column4"] = "0";
                        dr["Column5"] = string.Empty;
                        dr["Column6"] = string.Empty;
                        dr["Column7"] = string.Empty;
            */
            dt.Rows.Add(dr);

            //Store the DataTable in ViewState for future reference   
            ViewState["Gridview1"] = dt;

            //Bind the Gridview   
            if (frmVwAdmin.FindControl("Gridview1") != null)
            {
                ((GridView)frmVwAdmin.FindControl("Gridview1")).DataSource = dt;
                ((GridView)frmVwAdmin.FindControl("Gridview1")).DataBind();
            }

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            GridViewRow gvRow = (GridViewRow)lb.NamingContainer;
            int rowID = gvRow.RowIndex;
            if (ViewState["Gridview1"] != null)
            {

                DataTable dt = (DataTable)ViewState["Gridview1"];
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
                ViewState["Gridview1"] = dt;

                //Re bind the GridView for the updated data  
                ((GridView)frmVwAdmin.FindControl("Gridview1")).DataSource = dt;
                ((GridView)frmVwAdmin.FindControl("Gridview1")).DataBind();
            }

            //Set Previous Data on Postbacks  
            SetPreviousData();
        }
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            AddNewRowToGrid();
        }
        protected void ButtonAdd3_Click(object sender, EventArgs e)
        {
            AddNewRowToGrid();
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
            if (ViewState["Gridview1"] != null)
            {
                DataTable dt = (DataTable)ViewState["Gridview1"];
                if (dt.Rows.Count > 0)
                {
                    TextBox txtSeizureDate = (TextBox)frmVwAdmin.FindControl("txtSeizureDate");
                    TextBox receiptNo = (TextBox)frmVwAdmin.FindControl("receiptNo");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        TextBox box1 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[1].FindControl("TextBox1");
                        TextBox box2 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[2].FindControl("TextBox2");
                        TextBox box3 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[3].FindControl("TextBox3");
                        TextBox box4 = (TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[4].FindControl("TextBox4");
                        /*                        DropDownList ddlDisposal = ((DropDownList)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[4].FindControl("ddlDisposal"));
                                                TextBox dateDestory = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[6].FindControl("TextBox6"));
                                                TextBox disposalOrderNumber = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[7].FindControl("TextBox7"));
                                                TextBox destroyOrderDate = ((TextBox)((GridView)frmVwAdmin.FindControl("Gridview1")).Rows[i].Cells[5].FindControl("destroyOrderDate"));
                        */
                        box1.Text = $"{DateTime.Parse(txtSeizureDate.Text).ToString("yyyy")}/{receiptNo.Text}/{i + 1}";
                        if (i < dt.Rows.Count - 1)
                        {
                            //Assign the value from DataTable to the TextBox   
                            box2.Text = dt.Rows[i]["Column2"].ToString();
                            box3.Text = dt.Rows[i]["Column3"].ToString();
                            box4.Text = dt.Rows[i]["Column4"].ToString();
                            /*                          ddlDisposal.SelectedValue = dt.Rows[i]["Column4"].ToString();
                                                      dateDestory.Text = dt.Rows[i]["Column5"].ToString();
                                                      destroyOrderDate.Text = dt.Rows[i]["Column6"].ToString();
                                                      disposalOrderNumber.Text = dt.Rows[i]["Column7"].ToString();
                            */
                        }

                        rowIndex++;
                    }
                }
            }
        }

        protected void uplodFiles_Click(object sender, EventArgs e)
        {
            GridView gridView1 = (GridView)frmVwAdmin.FindControl("GridView1");
            foreach (GridViewRow row in gridView1.Rows)
            {
                FileUpload fileUpload = (FileUpload)row.Cells[7].FindControl("fileUpload");
                fileUpload.Enabled = true;
            }
        }
    }

}
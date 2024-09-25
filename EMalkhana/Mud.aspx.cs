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
    public partial class Mud : System.Web.UI.Page
    {
        private Bitmap qrCodeImage;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !string.IsNullOrEmpty(Request.QueryString["MudNo"]))
            {
                txtMudhNo.Text = Request.QueryString["MudNo"];
                lstView.DataBind();
            }
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
            Response.Redirect("Mud.aspx");
        }
        protected void btnSubmit_Click_ps(object sender, EventArgs e)
        {
            if (FormView1.CurrentMode == FormViewMode.Insert)
            {
                FormView1.InsertItem(false);
            }
            else if (FormView1.CurrentMode == FormViewMode.Edit)
            {
                FormView1.UpdateItem(false);
            }
            FormView1.ChangeMode(FormViewMode.ReadOnly);
            pnlAdmin.Visible = false;
            Response.Redirect("Mud.aspx");
        }


        protected void frmVwAdmin_DataBound(object sender, EventArgs e)
        {

        }

        protected void frmVwAdmin_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            bool boolDoAction = true;
            TextBox txtMudNumber = (TextBox)frmVwAdmin.FindControl("txtMudNumber");
            TextBox txtFIRNo = (TextBox)frmVwAdmin.FindControl("txtFIRNo");
            DropDownList ddlCourtName = (DropDownList)frmVwAdmin.FindControl("ddlCourtName");
            DropDownList ddlStatus = (DropDownList)frmVwAdmin.FindControl("ddlStatus");
            DropDownList ddlDisposal = (DropDownList)frmVwAdmin.FindControl("ddlDisposal");
            TextBox txtSeizureDate = (TextBox)frmVwAdmin.FindControl("txtSeizureDate");
            TextBox txtLocationOfMud = (TextBox)frmVwAdmin.FindControl("txtLocationOfMud");
            TextBox receiptNo = (TextBox)frmVwAdmin.FindControl("receiptNo");
            TextBox txtDescription = (TextBox)frmVwAdmin.FindControl("txtDescription");
            TextBox dateDestory = (TextBox)frmVwAdmin.FindControl("dateDestory");
            TextBox destroyOrderDate = (TextBox)frmVwAdmin.FindControl("destroyOrderDate");
            TextBox decisionDate = (TextBox)frmVwAdmin.FindControl("decisionDate");
            CheckBox caseDecided = (CheckBox)frmVwAdmin.FindControl("caseDecided");

            FileUpload upload = (FileUpload)frmVwAdmin.FindControl("inputFile");
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

            if (boolDoAction == true)
            {
                MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
                MySqlCommand cmd = new MySqlCommand();
                con.Open();
                cmd.Connection = con;
                // (IN id int, IN mudNo varchar(45), IN year int, IN departmentId int, IN headId int, IN photoId int , IN seizeDate DATE,
                // IN ioName varchar(45), IN description varchar(500), IN statusId int, IN location varchar(500), IN caseDecided bit,
                // IN dateDecision DATE, IN courtId int, IN dateOrderDestroy DATE, IN dateDestroy DATE, IN disposalId int,
                // IN qrCodeId int, IN updatedBy INT, IN isActive int )
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_mud_add";
                cmd.Parameters.AddWithValue("@numId", 0);
                cmd.Parameters.AddWithValue("@txtmudNo", txtMudNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@description", txtDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@statusId", ddlStatus.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@location", txtLocationOfMud.Text.Trim());
                cmd.Parameters.AddWithValue("@receiptNo", receiptNo.Text.Trim());
                cmd.Parameters.AddWithValue("@caseDecided", caseDecided.Enabled ? 1 : 0);
                cmd.Parameters.AddWithValue("@courtId", ddlCourtName.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@dateDecision", string.IsNullOrEmpty(decisionDate.Text.Trim()) ? DBNull.Value : decisionDate.Text.Trim());
                cmd.Parameters.AddWithValue("@seizeDate", string.IsNullOrEmpty(txtSeizureDate.Text.Trim()) ? DBNull.Value : txtSeizureDate.Text.Trim());
                cmd.Parameters.AddWithValue("@dateOrderDestroy", string.IsNullOrEmpty(destroyOrderDate.Text.Trim()) ? DBNull.Value : destroyOrderDate.Text.Trim());
                cmd.Parameters.AddWithValue("@dateDestroy", string.IsNullOrEmpty(dateDestory.Text.Trim()) ? DBNull.Value : dateDestory.Text.Trim());
                cmd.Parameters.AddWithValue("@disposalId", ddlDisposal.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@isActive", 1);
                cmd.Parameters.AddWithValue("@firNo", txtFIRNo.Text.Trim());
                cmd.Parameters.AddWithValue("@updatedBy", Session["numUserId"].ToString());
                cmd.Parameters.AddWithValue("@photoId", photoId);

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
            TextBox txtMudNumber = (TextBox)frmVwAdmin.FindControl("txtMudNumber");
            TextBox txtFIRNo = (TextBox)frmVwAdmin.FindControl("mudFirId");
            DropDownList ddlCourtName = (DropDownList)frmVwAdmin.FindControl("ddlCourtName");
            DropDownList ddlStatus = (DropDownList)frmVwAdmin.FindControl("ddlStatus");
            DropDownList ddlDisposal = (DropDownList)frmVwAdmin.FindControl("ddlDisposal");
            TextBox txtSeizureDate = (TextBox)frmVwAdmin.FindControl("txtSeizureDate");
            TextBox receiptNo = (TextBox)frmVwAdmin.FindControl("receiptNo");
            TextBox txtLocationOfMud = (TextBox)frmVwAdmin.FindControl("txtLocationOfMud");
            TextBox txtDescription = (TextBox)frmVwAdmin.FindControl("txtDescription");
            TextBox dateDestory = (TextBox)frmVwAdmin.FindControl("dateDestory");
            TextBox disposalReceiptNum = (TextBox)frmVwAdmin.FindControl("disposalReceiptNum");
            TextBox destroyOrderDate = (TextBox)frmVwAdmin.FindControl("destroyOrderDate");
            TextBox decisionDate = (TextBox)frmVwAdmin.FindControl("decisionDate");
            CheckBox caseDecided = (CheckBox)frmVwAdmin.FindControl("caseDecided");
            FileUpload upload = (FileUpload)frmVwAdmin.FindControl("inputFile");
            System.Web.UI.WebControls.Image image = (System.Web.UI.WebControls.Image)frmVwAdmin.FindControl("image_upload_preview");
            string photoId = image.ImageUrl;
            if (upload.HasFile)
            {
                string time = DateTime.Now.ToString("yyyyMMddHHmmss");
                string extension = Path.GetExtension(upload.FileName);
                string folder = Request.PhysicalApplicationPath + "photo" + "\\";
                var path = Path.Combine(folder, time + extension);
                upload.SaveAs(path);
                photoId = "photo/" + time + extension;
            }
            if (boolDoAction == true)
            {
                MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
                MySqlCommand cmd = new MySqlCommand();
                con.Open();
                cmd.Connection = con;
                // (IN id int, IN mudNo varchar(45), IN year int, IN departmentId int, IN headId int, IN photoId int , IN seizeDate DATE,
                // IN ioName varchar(45), IN description varchar(500), IN statusId int, IN location varchar(500), IN caseDecided bit,
                // IN dateDecision DATE, IN courtId int, IN dateOrderDestroy DATE, IN dateDestroy DATE, IN disposalId int,
                // IN qrCodeId int, IN updatedBy INT, IN isActive int )
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_mud_add";
                cmd.Parameters.AddWithValue("@numId", 0);
                cmd.Parameters.AddWithValue("@firId", txtFIRNo.Text.Trim());
                cmd.Parameters.AddWithValue("@txtmudNo", txtMudNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@description", txtDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@statusId", ddlStatus.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@receiptNo", receiptNo.Text.Trim());
                cmd.Parameters.AddWithValue("@txtDisposalOrderNumber", disposalReceiptNum.Text.Trim());
                cmd.Parameters.AddWithValue("@location", txtLocationOfMud.Text.Trim());
                cmd.Parameters.AddWithValue("@caseDecided", caseDecided.Enabled ? 1 : 0);
                cmd.Parameters.AddWithValue("@courtId", ddlCourtName.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@dateDecision", string.IsNullOrEmpty(decisionDate.Text.Trim()) ? DBNull.Value : decisionDate.Text.Trim());
                cmd.Parameters.AddWithValue("@seizeDate", string.IsNullOrEmpty(txtSeizureDate.Text.Trim()) ? DBNull.Value : txtSeizureDate.Text.Trim());
                cmd.Parameters.AddWithValue("@dateOrderDestroy", string.IsNullOrEmpty(destroyOrderDate.Text.Trim()) ? DBNull.Value : destroyOrderDate.Text.Trim());
                cmd.Parameters.AddWithValue("@dateDestroy", string.IsNullOrEmpty(dateDestory.Text.Trim()) ? DBNull.Value : dateDestory.Text.Trim());
                cmd.Parameters.AddWithValue("@disposalId", ddlDisposal.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@isActive", 1);
                cmd.Parameters.AddWithValue("@updatedBy", Session["numUserId"].ToString());
                cmd.Parameters.AddWithValue("@photoId", photoId);

                cmd.ExecuteNonQuery();

                lblMessage.Text = "Record Updated.";

                cmd.Dispose();
                con.Close();
            }
            e.Cancel = true;
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
        protected void frmVwAdmin_transfer(object sender, FormViewUpdateEventArgs e)
        {
            TextBox numUniqueId = (TextBox)FormView1.FindControl("numUniqueId");
            TextBox ackNumber = (TextBox)FormView1.FindControl("ackNumber");
            TextBox ackDate = (TextBox)FormView1.FindControl("ackDate");
            if (numUniqueId != null)
            {
                MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
                MySqlCommand cmd = new MySqlCommand();
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "sp_mudmovement_ack";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@mudMovementId", numUniqueId.Text.Trim());
                cmd.Parameters.AddWithValue("@txtackNumber", ackNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@dtackDate", ackDate.Text.Trim());

                cmd.ExecuteNonQuery();

                lblMessage.Text = "Record Updated.";
                cmd.Dispose();
                con.Close();

            }
            e.Cancel = true;
        }
        //transfer_submit
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            frmVwAdmin.ChangeMode(FormViewMode.ReadOnly);
            pnlAdmin.Visible = false;
            pnlAdminNew.Visible = false;
            Panel2.Visible = false;
        }
        protected void btnCancel_Click_ps(object sender, EventArgs e)
        {
            frmVwAdmin.ChangeMode(FormViewMode.ReadOnly);
            pnlAdminNew.Visible = false;
        }
        protected void btnCancel_Click_qr(object sender, EventArgs e)
        {
            frmVwAdmin.ChangeMode(FormViewMode.ReadOnly);
            Panel2.Visible = false;
        }
        protected void transfer_submit(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_mudmovement_add";
            cmd.Parameters.AddWithValue("@mudNo", mudId);
            cmd.Parameters.AddWithValue("@requestedBy", "");
            cmd.Parameters.AddWithValue("@goingAt", transferPoliceStation.SelectedValue.Trim());
            cmd.ExecuteNonQuery();

            lblMessage.Text = "Record removed.";

            cmd.Dispose();
            con.Close();

        }
        protected void lstVwAdmin_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "EDITRECORD")
            {
                divMultipleQR.InnerHtml = "";
                numUniqueID.Text = e.CommandArgument.ToString();
                frmVwAdmin.DataBind();
                frmVwAdmin.ChangeMode(FormViewMode.Edit);
                pnlAdmin.Visible = true;
            }
            else if (e.CommandName == "PRINTRECORD")
            {
                divMultipleQR.InnerHtml = "";
                Panel1.Visible = true;
                Panel2.Visible = true;
                QRCodeGenerator qrGenerator = new QRCodeGenerator();
                QRCodeData qrCodeData = qrGenerator.CreateQrCode(WebConstants.URL + "/SearchMud.aspx?MudNo=" + e.CommandArgument.ToString(), QRCodeGenerator.ECCLevel.Q);
                QRCode qrCode = new QRCode(qrCodeData);
                qrCodeImage = qrCode.GetGraphic(20);
                MemoryStream ms = new MemoryStream();
                qrCodeImage.Save(ms, ImageFormat.Png);
                var base64Data = Convert.ToBase64String(ms.ToArray());
                qrCodeImg.ImageUrl = "data:image/gif;base64," + base64Data;
                numPrintId.Text = e.CommandArgument.ToString();
                //PrintDocument pd = new PrintDocument();
                //pd.PrintPage += PrintPage;
                //pd.Print();

                //imgQR.Src = "data:image/gif;base64," + base64Data;
            }
            else if (e.CommandName == "DELETERECORD")
            {
                MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
                MySqlCommand cmd = new MySqlCommand();
                con.Open();
                cmd.Connection = con;

                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "update mud set isActive = 0 WHERE id = " + e.CommandArgument.ToString();
                cmd.ExecuteNonQuery();

                lblMessage.Text = "Record removed.";

                cmd.Dispose();
                con.Close();

                Response.Redirect("Mud.aspx");
            }
            else if (e.CommandName == "TRANSFERRECORD")
            {
                divMultipleQR.InnerHtml = "";
                numUniqueID.Text = e.CommandArgument.ToString();
                FormView1.DataBind();
                FormView1.ChangeMode(FormViewMode.Edit);
                pnlAdminNew.Visible = true;
                RadioButtonList radioButtonList = (RadioButtonList)FormView1.FindControl("transfer");
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
        //panelTransfer_Load
        protected void panelTransfer_Load(object sender, EventArgs e)
        {
            btnCheck.Text = "Visibility Check";

        }
        protected void panelQR_Load(object sender, EventArgs e)
        {
            btnCheck.Text = "Visibility Check";
        }

        protected void frmVwAdmin_PreRender(object sender, EventArgs e)
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
        }

        protected void isPresentedInCourt_CheckedChanged(object sender, EventArgs e)
        {
            DropDownList isPresentedInCourt = sender as DropDownList;
            DropDownList ddlPoliceStation = (DropDownList)FormView1.FindControl("ddlPoliceStation");
            DropDownList ddlCourtName = (DropDownList)FormView1.FindControl("ddlCourtName");
            DropDownList ddlFSL = (DropDownList)FormView1.FindControl("ddlFSL");
            Label lblPoliceStation = (Label)FormView1.FindControl("lblPoliceStation");
            if (isPresentedInCourt.SelectedIndex == 1)
            {
                lblPoliceStation.Text = "કોર્ટનું નામ";
                ddlPoliceStation.Visible = false;
                ddlCourtName.Visible = true;
                ddlFSL.Visible = false;
            }
            else if (isPresentedInCourt.SelectedIndex == 2)
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

        protected void bulkPrint_Click(object sender, EventArgs e)
        {
            divMultipleQR.InnerHtml = "";
            int counter = 0;
            for (int i = 0; i < lstView.Items.Count; i++)
            {
                CheckBox checkBox = (CheckBox)lstView.Items[i].FindControl("chkID");
                if (checkBox.Checked)
                {
                    counter++;
                    Label label = (Label)lstView.Items[i].FindControl("txtName");
                    Label numRoleId = (Label)lstView.Items[i].FindControl("numRoleId");
                    QRCodeGenerator qrGenerator = new QRCodeGenerator();
                    QRCodeData qrCodeData = qrGenerator.CreateQrCode(WebConstants.URL + "/SearchMud.aspx?MudNo=" + numRoleId.Text, QRCodeGenerator.ECCLevel.Q);
                    QRCode qrCode = new QRCode(qrCodeData);
                    qrCodeImage = qrCode.GetGraphic(20);
                    MemoryStream ms = new MemoryStream();
                    qrCodeImage.Save(ms, ImageFormat.Png);
                    var base64Data = Convert.ToBase64String(ms.ToArray());
                    string image = "<img style=\"height: 200px; width: 200px; \" src=\"" + "data:image/gif;base64," + base64Data + "\" />";
                    string divQRCode = "<div style=\"text-align:center;page-break-before: always;\"><div style=\"text-align:center\"><b>ગુજરાત પોલીસ</b></div><br/><div style=\"text-align:center;\">" + image + " <br/></div><div style=\"text-align:center\">મુદ્દા માલ નંબર: " + label.Text + "</div></div>";
                    qrCodeImg.ImageUrl = "data:image/gif;base64," + base64Data;
                    divMultipleQR.InnerHtml += divQRCode;
                }
                if (counter > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "printDivBulk()", true);
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
    }

}
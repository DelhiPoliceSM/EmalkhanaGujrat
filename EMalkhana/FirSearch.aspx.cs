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
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Expressions;

namespace EMalkhana
{
    public partial class FirSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void frmVwAdmin_DataBound(object sender, EventArgs e)
        {

        }


        protected void lstVwAdmin_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "VIEWRECORD")
            {
                Response.Redirect($"SearchMud.aspx?MudNo={e.CommandArgument}");
            }
            else if (e.CommandName == "EDITRECORD")
            {
                Response.Redirect($"Mud.aspx?MudNo={e.CommandArgument}");
            }
        }

        protected void searchType_CheckedChanged(object sender, EventArgs e)
        {
            switch (searchType.SelectedValue)
            {
                case "0":
                    firNumber.Visible = true;
                    receiptNumber.Visible = false;
                    rcNum.Visible = false;
                    break;
                case "2":
                    firNumber.Visible = false;
                    receiptNumber.Visible = true;
                    rcNum.Visible = false;
                    break;
                case "1":
                    firNumber.Visible = false;
                    receiptNumber.Visible = false;
                    rcNum.Visible = true;
                    break;
            }
        }
        private Bitmap qrCodeImage;
        protected void btnCancel_Click_qr(object sender, EventArgs e)
        {
            Panel2.Visible = false;
        }
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

        protected void bulkPrint_Click(object sender, EventArgs e)
        {
            divMultipleQR.InnerHtml = "";
            int counter = 0;
            string queryParams = "";
            for (int i = 0; i < lstView.Items.Count; i++)
            {
                CheckBox checkBox = (CheckBox)lstView.Items[i].FindControl("checkbox");
                if (checkBox.Checked)
                {
                    counter++;
                    Label label = (Label)lstView.Items[i].FindControl("numMudNumber");
                    queryParams += $"{label.Text},";
                }
            }
            Panel2.Visible = true;
            queryParams = queryParams.Remove(queryParams.Length - 1);
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(WebConstants.URL + "/SearchMuds.aspx?mudNo?=" + queryParams, QRCodeGenerator.ECCLevel.Q);
            QRCode qrCode = new QRCode(qrCodeData);
            qrCodeImage = qrCode.GetGraphic(20);
            MemoryStream ms = new MemoryStream();
            qrCodeImage.Save(ms, ImageFormat.Png);
            var base64Data = Convert.ToBase64String(ms.ToArray());
            qrCodeImg.ImageUrl = "data:image/gif;base64," + base64Data;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            switch (searchType.SelectedValue)
            {
                case "0":
                    string[] split = firNumber.SelectedValue.Split('/');
                    cmd.CommandText = "sp_firNum_Search";
                    cmd.Parameters.AddWithValue($"@strFirType", split[0]);
                    cmd.Parameters.AddWithValue($"@strFirNum", split[1]);
                    cmd.Parameters.AddWithValue($"@numyear", split[2]);
                    break;
                case "1":
                    cmd.CommandText = "sp_mudnum_Search";
                    cmd.Parameters.AddWithValue($"@strMudNum", rcNum.Text);
                    break;
                default:
                    split = receiptNumber.SelectedValue.Split('/');
                    cmd.CommandText = "sp_receiptNum_Search";
                    cmd.Parameters.AddWithValue($"@strReceiptNum", split[0]);
                    cmd.Parameters.AddWithValue($"@numyear", split[1]);
                    break;
            }
            cmd.Parameters.AddWithValue($"@numUserId", Session["numUserId"]);

            lstView.DataSource = cmd.ExecuteReader();
            lstView.DataBind();

            cmd.Dispose();
            con.Close();

        }
    }

}
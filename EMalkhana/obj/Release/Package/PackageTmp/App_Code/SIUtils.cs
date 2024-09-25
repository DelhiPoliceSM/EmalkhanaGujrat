using System;
using System.Collections.Generic;
using System.Web;
using System.Net;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.IO;
using System.Data;
using System.Xml;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Sudhith Infotech
/// </summary>
/// 
namespace SmartMonitoringTool
{
    public class SIUtils
    {
        public SIUtils()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public string SaveAttachment(HttpPostedFile fileAttachment, string strSavePath, string strUniqueID, string strPrefix)
        {
            string strFileName = strUniqueID + "_" + strPrefix + "_" + Path.GetFileName(fileAttachment.FileName);
            string strFileNameWithoutExt = Path.GetFileNameWithoutExtension(fileAttachment.FileName);
            string strFileExtension = Path.GetExtension(fileAttachment.FileName);
            String txtResponse = "";

            int fileCounter = 0;

            while (File.Exists(Path.Combine(strSavePath, strFileName)))
            {
                txtResponse += "<li>File: " + strFileName + " :Exists.</li>";
                fileCounter += 1;
                strFileName = strFileNameWithoutExt + "[" + fileCounter + "]" + strFileExtension;
            }

            try
            {
                fileAttachment.SaveAs(Path.Combine(strSavePath, strFileName));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.Print(ex.Message);
                return String.Empty;
            }
            return (strFileName);
        }

        public string SavePhoto(HttpPostedFile fileAttachment, string strSavePath, string strUniqueID, string strPrefix)
        {
            string strBookmarkText = ConfigurationManager.AppSettings["strBookmarkText"].ToString();

            string strFileName = strUniqueID + "_" + strPrefix + "_" + Path.GetFileName(fileAttachment.FileName);
            string strFileNameThumb = strUniqueID + "_" + strPrefix + "_THMB_" + Path.GetFileName(fileAttachment.FileName);

            string strFileNameWithoutExt = strUniqueID + "_" + strPrefix + "_" + Path.GetFileNameWithoutExtension(fileAttachment.FileName);
            string strFileNameThumbWithoutExt = strUniqueID + "_" + strPrefix + "_THMB_" + Path.GetFileNameWithoutExtension(fileAttachment.FileName);
            string strFileExtension = Path.GetExtension(fileAttachment.FileName);
            String txtResponse = "";

            int fileCounter = 0;
            int fileCounterThumb = 0;

            while (File.Exists(Path.Combine(strSavePath, strFileName)))
            {
                txtResponse += "<li>File: " + strFileName + " :Exists.</li>";
                fileCounter += 1;
                strFileName = strFileNameWithoutExt + "[" + fileCounter + "]" + strFileExtension;
            }

            while (File.Exists(Path.Combine(strSavePath, strFileNameThumb)))
            {
                txtResponse += "<li>File: " + strFileNameThumb + " :Exists.</li>";
                fileCounterThumb += 1;
                strFileNameThumb = strFileNameThumbWithoutExt + "[" + fileCounterThumb + "]" + strFileExtension;
            }

            try
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(fileAttachment.InputStream);
                int width = image.Width;
                int height = image.Height;

                Bitmap bmp = new Bitmap(width, height);
                System.Drawing.Graphics graphics = System.Drawing.Graphics.FromImage((System.Drawing.Image)bmp);
                graphics.InterpolationMode = InterpolationMode.High;
                graphics.SmoothingMode = SmoothingMode.HighQuality;
                graphics.Clear(Color.Transparent);
                graphics.DrawImage(image, 0, 0, width, height);
                Font font = new Font("Arial", 60, FontStyle.Bold);
                SolidBrush brush = new SolidBrush(Color.FromArgb(100, 122, 39, 106));
                graphics.DrawString(strBookmarkText, font, brush, 10.0F, 90.0F); // string, font style, brush used, x and y position for the string to be written
                System.Drawing.Image newImage = (System.Drawing.Image)bmp;
                //newImage.Save(Server.MapPath(strSavePath + fileAttachment.FileName));
                newImage.Save(Path.Combine(strSavePath, strFileName));
                graphics.Dispose();

                System.Drawing.Image imageThumb = System.Drawing.Image.FromStream(fileAttachment.InputStream);
                int widthThumb = (imageThumb.Width / 4 < 150) ? 150 : imageThumb.Width / 4;
                int heightThumb = (imageThumb.Height / 4 < 100) ? 100 : imageThumb.Height / 4;

                Bitmap bmpThumb = new Bitmap(widthThumb, heightThumb);
                System.Drawing.Graphics graphicsThumb = System.Drawing.Graphics.FromImage((System.Drawing.Image)bmpThumb);
                graphicsThumb.InterpolationMode = InterpolationMode.High;
                graphicsThumb.SmoothingMode = SmoothingMode.HighQuality;
                graphicsThumb.Clear(Color.Transparent);
                graphicsThumb.DrawImage(imageThumb, 0, 0, widthThumb, heightThumb);
                Font fontThumb = new Font("Arial", 20, FontStyle.Bold);
                SolidBrush brushThumb = new SolidBrush(Color.FromArgb(100, 122, 39, 106));
                graphicsThumb.DrawString(strBookmarkText, fontThumb, brushThumb, 10.0F, 90.0F); // string, font style, brush used, x and y position for the string to be written
                System.Drawing.Image newImageThumb = (System.Drawing.Image)bmpThumb;
                //newImage.Save(Server.MapPath(strSavePath + fileAttachment.FileName));
                newImageThumb.Save(Path.Combine(strSavePath, strFileNameThumb));
                graphicsThumb.Dispose();

                //fileAttachment.SaveAs(Path.Combine(strSavePath, strFileName));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.Print(ex.Message);
                return String.Empty;
            }
            return (strFileName + "," + strFileNameThumb);
        }

        private string Encrypt(string clearText)
        {
            string encryptionKey = "MAKV2SPBNISHANY99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(encryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        private string Decrypt(string cipherText)
        {
            string encryptionKey = "MAKV2SPBNISHANY99212";
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(encryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }

        public static void SendEmail(string txtToEmail, string txtSubject, string txtBody)
        {
            try
            {
                String strMailFrom, strMailBCc, strMailFromPwd, strMailServer, strMailPort, strMailIsSSL;

                strMailFrom = ConfigurationManager.AppSettings["strMailFrom"].ToString();
                strMailBCc = ConfigurationManager.AppSettings["strMailBCc"].ToString();
                strMailFromPwd = ConfigurationManager.AppSettings["strMailPWD"].ToString();
                strMailServer = ConfigurationManager.AppSettings["strMailServer"].ToString();
                strMailPort = ConfigurationManager.AppSettings["strMailPort"].ToString();
                strMailIsSSL = ConfigurationManager.AppSettings["strMailIsSSL"].ToString();

                MailMessage mail = new MailMessage();
                SmtpClient smtp = new SmtpClient();
                smtp.Host = strMailServer;
                smtp.Port = Int32.Parse(strMailPort);
                smtp.EnableSsl = Boolean.Parse(strMailIsSSL);
                smtp.UseDefaultCredentials = Convert.ToBoolean("True");

                CredentialCache che = new CredentialCache();
                che.Add(strMailServer, Convert.ToInt32(strMailPort), "LOGIN", new System.Net.NetworkCredential(strMailFrom, strMailFromPwd));

                smtp.Credentials = che;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;

                System.Web.Mail.SmtpMail.SmtpServer = strMailServer;

                mail.From = new MailAddress(strMailFrom, "Shaanu Computers");
                mail.To.Add(txtToEmail);
                if (strMailBCc.Trim().Length > 0)
                {
                    mail.Bcc.Add(strMailBCc);
                }

                mail.Subject = txtSubject;
                mail.Body = txtBody;
                mail.IsBodyHtml = true;

                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.Print(ex.Message);
            }
        }

    }
}

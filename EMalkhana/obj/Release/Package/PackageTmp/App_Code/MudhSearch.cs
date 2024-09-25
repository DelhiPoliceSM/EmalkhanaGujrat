using MySql.Data.MySqlClient;
using SMartMonitoringTool.Constants;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace EMalkhana
{
    public class MudhSearch
    {

        public DataTable GetBlockedVehicle(int startrows, int pagesize, int numUserId, string txtMudhNo)
        {
            int endrows;
            //startrows starts from zero
            startrows = startrows + 1;
            endrows = startrows + (pagesize - 1);
            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            con.Open();
            cmd.Connection = con;

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_mud_Search_Page_Wise";
            cmd.Parameters.AddWithValue("@numUserId", numUserId);
            cmd.Parameters.AddWithValue("@searchText", txtMudhNo == null ? "" : txtMudhNo);
            cmd.Parameters.AddWithValue("@startRows", startrows);
            cmd.Parameters.AddWithValue("@endRows", endrows);

            //") T where T.RowNum between " + startrows +" and "+endrows;
            MySqlDataReader dr = cmd.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(dr);
            dr.Close();
            con.Close();
            return table;
        }
        public int GetBlockedVehicleCount(string txtMudhNo, int numUserId)
        {
            MySqlConnection con = new MySqlConnection(WebConstants.ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            con.Open();
            cmd.Connection = con;

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_mud_count_Page_Wise";
            cmd.Parameters.AddWithValue("@numUserId", numUserId);
            cmd.Parameters.AddWithValue("@searchText", txtMudhNo == null ? "" : txtMudhNo);
            MySqlDataReader dr = cmd.ExecuteReader();
            int rowCount = 0;
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    rowCount = int.Parse(dr["count_data"].ToString());
                }
            }
            dr.Close();
            con.Close();
            return rowCount;
        }
    }
}
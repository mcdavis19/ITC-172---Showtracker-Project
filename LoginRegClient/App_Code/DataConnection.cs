using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for DataConnection
/// </summary>
public class DataConnection
{
    //private SqlConnection connect;

    //public DataConnection()
    //{
    //    connect = new SqlConnection(ConfigurationManager.ConnectionStrings["ShowTrackerConnectionString"].ToString());
    //}
        
    //public DataTable GetArtists()
    //{
    //    DataTable table = new DataTable();
    //    string sql = "SELECT artistname, artistkey FROM artist";
    //    SqlCommand cmd = new SqlCommand(sql, connect);
    //    table = ReadData(cmd);
    //    return table;
    //}
        
    //private DataTable ReadData(SqlCommand cmd)
    //{
    //    SqlDataReader reader = null;
    //    DataTable table = new DataTable();
    //    connect.Open();
    //    reader = cmd.ExecuteReader();
    //    table.Load(reader);
    //    reader.Close();
    //    connect.Close();
    //    return table;
    //}
        
}
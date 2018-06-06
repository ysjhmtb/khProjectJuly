package kh.com.java;
import java.sql.*;


public class TestDBAccess {
	public static void main ( String [] args ) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("Loading Driver Success :)");
		}	catch ( ClassNotFoundException e ) {
			System.out.print(e.getMessage()+" Not Founded :(");
		}
		
		try {
			String URL = "jdbc:oracle:thin:@localhost:59161:XE";
			con = DriverManager.getConnection(URL, "system", "oracle");
			System.out.println("Connection Success :)");
		}	catch ( SQLException e ) {
			System.out.println(e.getMessage());
			System.out.println("Connection Failed :(");
		}
	}
}

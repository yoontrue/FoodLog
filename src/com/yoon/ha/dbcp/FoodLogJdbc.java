package com.yoon.ha.dbcp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class FoodLogJdbc {
	static String url = "jdbc:mysql://localhost/testdb?serverTimezone=UTC";
	static String user = "yoonjin";
	static String password = "12345";
	static Connection conn = null;
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver"); // jdbc 드라이버 로딩.
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static void close(Connection conn) {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void close(Statement stmt) {
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void close(ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		close(rs);
		close(stmt);
		close(conn);
	}
}

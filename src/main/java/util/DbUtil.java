package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DbUtil {

	private static DbUtil dbUtil = new DbUtil();
	private Connection conn;

	private DbUtil() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521/xe";
			String username = "syy";
			String password = "dnjsehddus";

			this.conn = DriverManager.getConnection(jdbcUrl, username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static DbUtil getInstance() {
		return DbUtil.dbUtil;
	}

	public PreparedStatement createStmt(String sql) {
		PreparedStatement stmt = null;

		try {
			stmt = this.conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return stmt;
	}

	public void closeConn() {
		try {
			this.conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}

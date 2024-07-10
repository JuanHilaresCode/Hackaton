package pe.edu.vallegrande.crudweb.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SqlConnection {

	public SqlConnection() {
	}

	public static Connection getConnection() throws SQLException {
		Connection cn = null;
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String urlDB = "jdbc:sqlserver://localhost:1433;databaseName=CRUD;encrypt=True;TrustServerCertificate=True;";
		String user = "sa";
		String pass = "SQL#1234";
		try {
			Class.forName(driver).getDeclaredConstructor().newInstance();
			cn = DriverManager.getConnection(urlDB, user, pass);
		} catch (SQLException e) {
			throw e;
		} catch (ClassNotFoundException e) {
			throw new SQLException("No se encontro el driver de la base de datos.");
		} catch (Exception e) {
			throw new SQLException("No se puede establecer la conexion con la BD.");
		}
		return cn;
	}
}

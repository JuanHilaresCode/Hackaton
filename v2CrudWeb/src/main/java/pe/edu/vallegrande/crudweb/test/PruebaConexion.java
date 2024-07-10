package pe.edu.vallegrande.crudweb.test;

import pe.edu.vallegrande.crudweb.connection.SqlConnection;

import java.sql.SQLException;

public class PruebaConexion {

	public static void main(String[] args) throws SQLException {
		SqlConnection.getConnection();
		System.out.println("Conexion exitosa");

	}
}

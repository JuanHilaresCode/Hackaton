package pe.edu.vallegrande.crudweb.service;

import pe.edu.vallegrande.crudweb.connection.SqlConnection;
import pe.edu.vallegrande.crudweb.dto.ContactoDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContactoService {
    public List<ContactoDTO> getAll() {
        List<ContactoDTO> lista = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql;

        try {
            cn = SqlConnection.getConnection();
            sql = "SELECT id, nombre, correo, telefono, estado FROM contacto WHERE estado = 1";
            pstm = cn.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                ContactoDTO bean = new ContactoDTO();
                bean.setId(rs.getInt("id"));
                bean.setNombre(rs.getString("nombre"));
                bean.setCorreo(rs.getString("correo"));
                bean.setTelefono(rs.getString("telefono"));
                bean.setEstado(rs.getInt("estado"));
                lista.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstm != null) pstm.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return lista;
    }

    public ContactoDTO getById(int id) {
        ContactoDTO bean = null;
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql;

        try {
            cn = SqlConnection.getConnection();
            sql = "SELECT id, nombre, correo, telefono, estado FROM contacto WHERE id = ?";
            pstm = cn.prepareStatement(sql);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            if (rs.next()) {
                bean = new ContactoDTO();
                bean.setId(rs.getInt("id"));
                bean.setNombre(rs.getString("nombre"));
                bean.setCorreo(rs.getString("correo"));
                bean.setTelefono(rs.getString("telefono"));
                bean.setEstado(rs.getInt("estado"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstm != null) pstm.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bean;
    }

    public int create(ContactoDTO bean) {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql;
        int nuevoContactoId = 0;

        try {
            cn = SqlConnection.getConnection();
            sql = "INSERT INTO contacto (nombre, correo, telefono) VALUES (?, ?, ?)";
            pstm = cn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstm.setString(1, bean.getNombre());
            pstm.setString(2, bean.getCorreo());
            pstm.setString(3, bean.getTelefono());
            pstm.executeUpdate();

            rs = pstm.getGeneratedKeys();
            if (rs.next()) {
                nuevoContactoId = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstm != null) pstm.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return nuevoContactoId;
    }


    public ContactoDTO update(ContactoDTO bean) {
        Connection cn = null;
        PreparedStatement pstm = null;
        String sql;

        try {
            cn = SqlConnection.getConnection();
            sql = "UPDATE contacto SET nombre = ?, correo = ?, telefono = ?, estado = ? WHERE id = ?";
            pstm = cn.prepareStatement(sql);
            pstm.setString(1, bean.getNombre());
            pstm.setString(2, bean.getCorreo());
            pstm.setString(3, bean.getTelefono());
            pstm.setInt(4, bean.getEstado());
            pstm.setInt(5, bean.getId());
            int rowsAffected = pstm.executeUpdate();
            if (rowsAffected == 0) {
                bean = null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstm != null) pstm.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bean;
    }

    public boolean delete(int id) {
        Connection cn = null;
        PreparedStatement pstm = null;
        String sql;

        try {
            cn = SqlConnection.getConnection();
            sql = "UPDATE contacto SET estado = 0 WHERE id = ?";
            pstm = cn.prepareStatement(sql);
            pstm.setInt(1, id);
            int rowsAffected = pstm.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstm != null) pstm.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

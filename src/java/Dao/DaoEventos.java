/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Datos.Eventos;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MARIO
 */
public class DaoEventos {
    
    private Connection connection;

    public DaoEventos() throws URISyntaxException, SQLException {
        connection = Conexion.getConnection();
    }
    
    public List<Eventos> ListarObj() throws SQLException {
        List<Eventos> objetosLista = new ArrayList<Eventos>();
        String query = "SELECT * FROM EVENTOS";
        Connection connection = Conexion.getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {

                Eventos registro = new Eventos();
                
                registro.setID_Evento(rs.getInt("ID_Evento"));
                registro.setNombre(rs.getString("nombre"));
                registro.setTipo(rs.getString("Tipo"));
                registro.setFecha(rs.getString("fecha"));
                registro.setLugar(rs.getString("lugar"));

                objetosLista.add(registro);
            }

            st.close();

        } catch (SQLException e) {
            System.out.println("Problemas al obtener la lista de Eventos");
            e.printStackTrace();
        }

        return objetosLista;
    }
    
    public void addObjeto(Eventos objetoAdd) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("INSERT INTO eventos (`nombre`, `Tipo`, `fecha`, `lugar`) VALUES (?, ?, ?, ?);");
            // Parameters start with 1
            preparedStatement.setString(1, objetoAdd.getNombre());
            preparedStatement.setString(2, objetoAdd.getTipo());
            preparedStatement.setString(3, objetoAdd.getFecha());
            preparedStatement.setString(4, objetoAdd.getLugar());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteObj(int objetoID) {
        try {
            System.out.println("Entro a eliminar");
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from eventos where ID_Evento=?");
            // Parameters start with 1
            preparedStatement.setInt(1, objetoID);
            preparedStatement.executeUpdate();
            System.out.println("Elimino La Evento");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateTabla(Eventos objetoUP, int cs) {
        try {
            System.out.println("Entro a Acturalizar");
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update eventos set nombre=?, Tipo=?, fecha=?, lugar=? where ID_Evento=" + cs);
            // Parameters start with 1
            preparedStatement.setString(1, objetoUP.getNombre());
            preparedStatement.setString(2, objetoUP.getTipo());
            preparedStatement.setString(3, objetoUP.getFecha());
            preparedStatement.setString(4, objetoUP.getLugar());
            preparedStatement.executeUpdate();
            System.out.println("Actualizo El Evento");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Eventos buscarId(int tablaId) {
        Eventos tabla = new Eventos();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select * from EVENTOS where ID_Evento=?");
            preparedStatement.setInt(1, tablaId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                tabla.setID_Evento(rs.getInt("ID_Evento"));
                tabla.setNombre(rs.getString("nombre"));
                tabla.setTipo(rs.getString("Tipo"));
                tabla.setFecha(rs.getString("fecha"));
                tabla.setLugar(rs.getString("lugar"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tabla;
    }
    
}

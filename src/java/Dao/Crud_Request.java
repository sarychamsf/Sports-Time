/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Datos.Comments;
import Datos.Request;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author JCBOT
 */
public class Crud_Request {

    public Map<String, Integer> Map = new HashMap<String, Integer>();

    public List<Request> findAll() throws SQLException {
        List<Request> departamentos = null;
        String query = "SELECT * FROM requests";
        Connection connection = Conexion.getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            String user = null;
            String destiny = null;
            String state = null;

            while (rs.next()) {
                if (departamentos == null) {
                    departamentos = new ArrayList<Request>();
                }

                Request registro = new Request();

                user = rs.getString("user");
                registro.setUser(user);

                destiny = rs.getString("destiny");
                registro.setDestiny(destiny);

                state = rs.getString("state");
                registro.setState(state);

                departamentos.add(registro);
            }

            st.close();

        } catch (SQLException e) {
            System.out.println("Problemas al obtener la lista de Departamentos");
            e.printStackTrace();
        }

        return departamentos;
    }

    public boolean insert(Request t) throws SQLException {
        boolean result = false;
        Connection connection = Conexion.getConnection();
        String query = " insert into requests (user,destiny,state)" + "values (?,?,?)";
        PreparedStatement preparedStmt = null;

        try {

            preparedStmt = connection.prepareStatement(query);
            preparedStmt.setString(1, t.getUser());
            preparedStmt.setString(2, t.getDestiny());
            preparedStmt.setString(3, t.getState());

            result = preparedStmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean update(String state, String user, String destiny) throws SQLException {
        boolean result = false;
        Connection connection = Conexion.getConnection();
        String query = " update requests SET state=? WHERE  user=? AND `destiny`=? AND `state`='en espera' ";
        PreparedStatement preparedStmt = null;
        try {

            preparedStmt = connection.prepareStatement(query);
            preparedStmt.setString(1, state);
            preparedStmt.setString(2, user);
            preparedStmt.setString(3, destiny);

            result = preparedStmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean delete(String state, String user, String destiny) throws SQLException {
        boolean result = false;
        Connection connection = Conexion.getConnection();
        String query = " delete from requests WHERE `user`=? AND `destiny`=? AND `state`=?";
        
        PreparedStatement preparedStmt = null;
        try {

            preparedStmt = connection.prepareStatement(query);
            preparedStmt.setString(1, user);
            preparedStmt.setString(2, destiny);
            preparedStmt.setString(3, state);

            result = preparedStmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

}

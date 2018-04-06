/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Datos.Comments;
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
public class Crud_Comments {

    public Map<String, Integer> Map = new HashMap<String, Integer>();

    public List<Comments> findAll() throws SQLException {
        List<Comments> departamentos = null;
        String query = "SELECT * FROM comments";
        Connection connection = Conexion.getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            String id = null;
            String name = null;
            String text = null;
            String date = null;

            while (rs.next()) {
                if (departamentos == null) {
                    departamentos = new ArrayList<Comments>();
                }

                Comments registro = new Comments();

                id = rs.getString("id");
                registro.setId(id);

                name = rs.getString("name");
                registro.setName(name);

                text = rs.getString("text");
                registro.setText(text);

                date = rs.getString("date");
                registro.setDate(date);

                departamentos.add(registro);
            }

            st.close();

        } catch (SQLException e) {
            System.out.println("Problemas al obtener la lista de Departamentos");
            e.printStackTrace();
        }

        return departamentos;
    }

    public boolean insert(Comments t) throws SQLException {
        boolean result = false;
        Connection connection = Conexion.getConnection();
        String query = " insert into comments (id,name,text,date)" + "values (?,?,?,?)";
        PreparedStatement preparedStmt = null;

        try {

            preparedStmt = connection.prepareStatement(query);
            preparedStmt.setString(1, t.getId());
            preparedStmt.setString(2, t.getName());
            preparedStmt.setString(3, t.getText());
            preparedStmt.setString(4, t.getDate());

            result = preparedStmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean delete(String t) throws SQLException {
        boolean result = false;
        Connection connection = Conexion.getConnection();
        String query = " delete from comments where date=?";
        PreparedStatement preparedStmt = null;

        try {

            preparedStmt = connection.prepareStatement(query);
            preparedStmt.setString(1, t);

            result = preparedStmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

}

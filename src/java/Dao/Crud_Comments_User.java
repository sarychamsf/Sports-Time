/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Datos.Comments_user;
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
public class Crud_Comments_User {

    public Map<String, Integer> Map = new HashMap<String, Integer>();

    public List<Comments_user> findAll() throws SQLException {
        List<Comments_user> departamentos = null;
        String query = "SELECT * FROM comment_user";
        Connection connection = Conexion.getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            String idcomment = null;
            String id = null;
            String name = null;
            String text = null;
            String date = null;

            while (rs.next()) {
                if (departamentos == null) {
                    departamentos = new ArrayList<Comments_user>();
                }

                Comments_user registro = new Comments_user();

                idcomment = rs.getString("idcomment");
                registro.setIdcomments(idcomment);

                id = rs.getString("id");
                registro.setId(id);

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

    public boolean insert(Comments_user t) throws SQLException {
        boolean result = false;
        Connection connection = Conexion.getConnection();
        String query = " insert into comment_user (idcomment,id,text,date)" + "values (?,?,?,?)";
        PreparedStatement preparedStmt = null;

        try {

            preparedStmt = connection.prepareStatement(query);
            
            preparedStmt.setString(1, t.getIdcomments());
            preparedStmt.setString(2, t.getId());
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
        String query = " delete from comment_user where date=?";
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

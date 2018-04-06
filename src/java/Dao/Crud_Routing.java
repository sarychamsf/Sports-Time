/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Datos.Register;
import Datos.Routing;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author JCBOT
 */
public class Crud_Routing {

    public List<Routing> findAll() throws SQLException {
        List<Routing> departamentos = null;
        String query = "SELECT * FROM Routing";
        Connection connection = Conexion.getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            int Number = 0;
            String Quantity = null;
            String Distance = null;
            String Style = null;
            String Date = null;

            while (rs.next()) {
                if (departamentos == null) {
                    departamentos = new ArrayList<Routing>();
                }

                Routing registro = new Routing();

                Number = rs.getInt("Number");
                registro.setNumber(Number);

                Quantity = rs.getString("Quantity");
                registro.setQuantity(Quantity);

                Distance = rs.getString("Distance");
                registro.setDistance(Distance);

                Style = rs.getString("Style");
                registro.setStyle(Style);
                
                Date = rs.getString("Date");
                registro.setDate(Date);

                departamentos.add(registro);
            }

            st.close();

        } catch (SQLException e) {
            System.out.println("Problemas al obtener la lista de Departamentos");
            e.printStackTrace();
        }

        return departamentos;
    }
    
    public List<Routing> Distancias(String estilo, String fecha) throws SQLException {
        List<Routing> departamentos = null;
        String query = "SELECT * FROM `routing` WHERE Style='"+estilo+"' AND Date='"+fecha+"'; ";
        Connection connection = Conexion.getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            int Number = 0;
            String Quantity = null;
            String Distance = null;
            String Style = null;
            String Date = null;

            while (rs.next()) {
                if (departamentos == null) {
                    departamentos = new ArrayList<Routing>();
                }

                Routing registro = new Routing();

                Number = rs.getInt("Number");
                registro.setNumber(Number);

                Distance = rs.getString("Distance");
                registro.setDistance(Distance);

                
                
                departamentos.add(registro);
            }

            st.close();

        } catch (SQLException e) {
            System.out.println("Problemas al obtener la lista de Departamentos");
            e.printStackTrace();
        }

        return departamentos;
    }
    
    public List<String> Estilos(String fecha) throws SQLException {
        List<String> departamentos = null;
        String query = "SELECT Style FROM `routing` WHERE Date='"+fecha+"' GROUP BY Style;";
        Connection connection = Conexion.getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            String Style = null;

            while (rs.next()) {
                if (departamentos == null) {
                    departamentos = new ArrayList<String>();
                }
                Routing registro = new Routing();
                Style = rs.getString("Style");
                departamentos.add(Style);
            }

            st.close();

        } catch (SQLException e) {
            System.out.println("Problemas al obtener la lista de Departamentos");
            e.printStackTrace();
        }

        return departamentos;
    }

    public boolean insert(Routing t) throws SQLException {
        boolean result = false;
        Connection connection = Conexion.getConnection();

        String query = " insert into Routing (Quantity,Distance,Style,Date)" + "values (?,?,?,?)";
        
        Date date = new Date();
        DateFormat hourdateFormat = new SimpleDateFormat("yyyy/MM/dd");
        System.out.println("Hora y fecha: " + hourdateFormat.format(date));
        String fecha_y_hora = hourdateFormat.format(date);
        PreparedStatement preparedStmt = null;

        try {
            preparedStmt = connection.prepareStatement(query);
            preparedStmt.setString(1, t.getQuantity());
            preparedStmt.setString(2, t.getDistance());
            preparedStmt.setString(3, t.getStyle());
            preparedStmt.setString(4, fecha_y_hora);

            result = preparedStmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Datos.List1;
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
public class Crud_List {

    public List<List1> findAll() throws SQLException {
        List<List1> departamentos = null;
        String query = "SELECT * FROM asistance";
        Connection connection = Conexion.getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            String Date1 = null;
            String Name_Athele = null;
            String State = null;
            String Name_Coach = null;
            String Jornada = null;

            while (rs.next()) {
                if (departamentos == null) {
                    departamentos = new ArrayList<List1>();
                }

                List1 registro = new List1();

                Date1 = rs.getString("Date1");
                registro.setDate(Date1);

                Name_Athele = rs.getString("Name_Athele");
                registro.setName_Athele0(Name_Athele);

                State = rs.getString("State");
                registro.setAthele0(State);

                Name_Coach = rs.getString("Name_Coach");
                registro.setCoach_Name(Name_Coach);

                Jornada = rs.getString("Jornada");
                registro.setJornada(Jornada);

                departamentos.add(registro);
            }

            st.close();

        } catch (SQLException e) {
            System.out.println("Problemas al obtener la lista de Departamentos");
            e.printStackTrace();
        }

        return departamentos;
    }
    
    public List<String> Fechas(String nombreDep, String nombreEnt) throws SQLException {
        List<String> departamentos = null;
        String query = "SELECT Date1 FROM asistance Where Name_Athele='"+nombreDep+"' and Name_Coach='"+nombreEnt+"' and State='Asistio' GROUP BY Date1 ORDER BY Date1 DESC;";
//        System.out.println(query);
        Connection connection = Conexion.getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            String Date1 = null;

            while (rs.next()) {
                if (departamentos == null) {
                    departamentos = new ArrayList();
                }

                Date1 = rs.getString("Date1");

                departamentos.add(Date1);
            }

            st.close();

        } catch (SQLException e) {
            System.out.println("Problemas al obtener la lista de Departamentos");
            e.printStackTrace();
        }

        return departamentos;
    }
    public List<String> Fechas2(String nombreEnt) throws SQLException {
        List<String> departamentos = null;
        String query = "SELECT Date1 FROM asistance Where Name_Coach='"+nombreEnt+"' GROUP BY Date1 ORDER BY Date1 DESC;";
//        System.out.println(query);
        Connection connection = Conexion.getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            String Date1 = null;

            while (rs.next()) {
                if (departamentos == null) {
                    departamentos = new ArrayList();
                }

                Date1 = rs.getString("Date1");

                departamentos.add(Date1);
            }

            st.close();

        } catch (SQLException e) {
            System.out.println("Problemas al obtener la lista de FEchas2");
            e.printStackTrace();
        }

        return departamentos;
    }

    public boolean insert0(List1 t) throws SQLException {
        boolean result = false;
        Connection connection = Conexion.getConnection();
        String query = " insert into asistance (Date1,Name_Athele,State,Name_Coach,Jornada)" + "values (?,?,?,?,?)";

        Date date = new Date();
        DateFormat hourdateFormat = new SimpleDateFormat("yyyy/MM/dd");
        System.out.println("Hora y fecha: " + hourdateFormat.format(date));
        String fecha_y_hora = hourdateFormat.format(date);
        PreparedStatement preparedStmt = null;

        
        try {

            preparedStmt = connection.prepareStatement(query);
            preparedStmt.setString(1, fecha_y_hora);
            preparedStmt.setString(2, t.getName_Athele0());
            preparedStmt.setString(3, t.getAthele0());
            preparedStmt.setString(4, t.getCoach_Name());
            preparedStmt.setString(5, t.getJornada());

            result = preparedStmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

}

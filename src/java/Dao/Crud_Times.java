/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Datos.Times;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 *
 * @author JCBOT
 */
public class Crud_Times {

    public List<Times> findAll() throws SQLException {
        List<Times> departamentos = null;
        String query = "SELECT * FROM times";
        Connection connection = Conexion.getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            int ID_Time;
            int ID_Routing;
            String ID_Athele;
            String Time1;

            while (rs.next()) {
                if (departamentos == null) {
                    departamentos = new ArrayList<Times>();
                }

                Times registro = new Times();

                ID_Time = rs.getInt("ID_Time");
                registro.setID_Time(ID_Time);

                ID_Routing = rs.getInt("ID_Routing");
                registro.setID_Routing(ID_Routing);

                ID_Athele = rs.getString("ID_Athele");
                registro.setID_Athele(ID_Athele);

                Time1 = rs.getString("Time1");
                registro.setTime(Time1);

                departamentos.add(registro);
            }

            st.close();

        } catch (SQLException e) {
            System.out.println("Problemas al obtener la lista de Departamentos");
            e.printStackTrace();
        }

        return departamentos;
    }

    public List<Times> DatosFiltro(int iD_Tiempo, String nomDep) throws SQLException {
        List<Times> departamentos = null;
        String query = "SELECT * FROM times WHERE ID_Time='" + iD_Tiempo + "' AND ID_Athele='" + nomDep + "'; ";
        Connection connection = Conexion.getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            int ID_Time;
            int ID_Routing;
            String ID_Athele;
            String Time1;

            while (rs.next()) {
                if (departamentos == null) {
                    departamentos = new ArrayList<Times>();
                }

                Times registro = new Times();

                ID_Time = rs.getInt("ID_Time");
                registro.setID_Time(ID_Time);

                ID_Routing = rs.getInt("ID_Routing");
                registro.setID_Routing(ID_Routing);

                ID_Athele = rs.getString("ID_Athele");
                registro.setID_Athele(ID_Athele);

                Time1 = rs.getString("Time1");
                registro.setTime(Time1);

                departamentos.add(registro);
            }

            st.close();

        } catch (SQLException e) {
            System.out.println("Problemas al obtener la lista de Departamentos");
            e.printStackTrace();
        }
//        System.out.println("#################");
//        System.out.println("impresion de select");
//        System.out.println(departamentos.toString().toString());
//        System.out.println("#################");
        return departamentos;
    }

    public List<List> datosFiltroGrafica(int iD_Tiempo, String nomDep) throws SQLException {
        Crud_Times tu = new Crud_Times();

        List<String> listNombres = new ArrayList<String>();
        List<String> listTiempos = new ArrayList<String>();
        
        for (Times times : DatosFiltro(iD_Tiempo, nomDep)) {
            listNombres.add(times.getID_Athele());
            listTiempos.add(ConvertirTime(times.getTime()));
        }

        System.out.println(listTiempos.toString());
        List<Double> listTiempos2 = new ArrayList<Double>();
        
        for (String listTiempo : listTiempos) {
                listTiempos2.add(TiemSeg(listTiempo));
            }

        List<List> listaDoble = new ArrayList<List>();
        listaDoble.add(listNombres);
        listaDoble.add(listTiempos2);
        return listaDoble;
    }

    public List<List> datosGrafica(int iD_Tiempo) throws SQLException {
        List<String> listNombres = new ArrayList<String>();
        List<String> listTiempos;
        List<List> listaDoble = new ArrayList<List>();

        for (Times nombres : BuscarTiemposRut(iD_Tiempo)) {
            String nombre = nombres.getID_Athele();
            listNombres.add(nombre);
        }
        listaDoble.add(listNombres);

        for (String nombres : listNombres) {
            listTiempos = new ArrayList<String>();
            for (Object tiempoS : datosFiltroGrafica(iD_Tiempo, nombres).get(1)) {
                String tiempo = tiempoS.toString();
                listTiempos.add(tiempo);
            }
            listaDoble.add(listTiempos);
        }

        return listaDoble;
    }

    public boolean insert(Times t) throws SQLException {
        boolean result = false;
        Connection connection = Conexion.getConnection();

        String query = " insert into times (ID_Time,ID_Routing,ID_Athele,Time1)" + "values (?,?,?,?)";
        PreparedStatement preparedStmt = null;

        try {

            preparedStmt = connection.prepareStatement(query);
            preparedStmt.setInt(1, t.getID_Time());
            preparedStmt.setInt(2, t.getID_Routing());
            preparedStmt.setString(3, t.getID_Athele());
            preparedStmt.setString(4, t.getTime());

            result = preparedStmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<Times> BuscarTiemposRut(int Id_time) throws SQLException {
        List<Times> departamentos = null;
        String query = "SELECT * FROM `sports_time`.`times` WHERE `ID_Time` = '" + Id_time + "' GROUP BY ID_Athele ORDER BY `ID_Time` ASC, `ID_Athele`";
        Connection connection = Conexion.getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            int ID_Time;
            int ID_Routing;
            String ID_Athele;
            String Time1;

            while (rs.next()) {
                if (departamentos == null) {
                    departamentos = new ArrayList<Times>();
                }

                Times registro = new Times();

                ID_Time = rs.getInt("ID_Time");
                registro.setID_Time(ID_Time);

                ID_Routing = rs.getInt("ID_Routing");
                registro.setID_Routing(ID_Routing);

                ID_Athele = rs.getString("ID_Athele");
                registro.setID_Athele(ID_Athele);

                Time1 = rs.getString("Time1");
                registro.setTime(Time1);

                departamentos.add(registro);
            }

            st.close();

        } catch (SQLException e) {
            System.out.println("Problemas al obtener la lista de Departamentos");
            e.printStackTrace();
        }

        return departamentos;
    }

    public String ConvertirTime(String tiempo) {
        String str = tiempo;
        String delimiter = ":";
        String[] temp;
        temp = str.split(delimiter);

        String uno = null;
        String dos = null;
        String tres = null;

        if (temp[1].length() == 1) {
            uno = "0" + temp[1];
        } else {
            uno = temp[1];
        }

        if (temp[2].length() == 1) {
            dos = "0" + temp[2];
        } else {
            dos = temp[2];
        }

        if (temp[3].length() == 1) {
            tres = "0" + temp[3];
        } else {
            tres = temp[3];
        }

        tiempo = uno + ":" + dos + ":" + tres;
        return tiempo;
    }

    public double TiemSeg(String tiempo) {
        String s = tiempo;
        String miliseg = "";
        String seg = "";
        String minu = "";

        miliseg = Character.toString(s.charAt(6)) + Character.toString(s.charAt(7));
        seg = Character.toString(s.charAt(3)) + Character.toString(s.charAt(4));
        minu = Character.toString(s.charAt(0)) + Character.toString(s.charAt(1));

        int in = Integer.parseInt(miliseg);
        int j = Integer.parseInt(seg);
        int k = Integer.parseInt(minu);

        double d = 0.01 * in + j + k * 60;
        return d;
    }

}

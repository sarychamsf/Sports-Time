/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Datos.Register;
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
public class Crud_Athele {

    public Map<String, Integer> Map = new HashMap<>();

    public List<Register> findAll() throws SQLException {
        List<Register> departamentos = null;
        String query = "SELECT * FROM Athele_Register";
        Connection connection = Conexion.getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            String Name = null;
            String Lastname = null;
            String Password = null;
            String Identification_Card = null;
            String Coach = null;
            String Jornada = null;
            String Genre = null;
            String Born_Date = null;
            String Height = null;
            String weight = null;
            String Category = null;
            String Cellphone = null;
            String Role = null;
            String Description = null;
            String Eps = null;
            String Emergency_Number = null;
            String Allergies = null;
            String Diseases = null;
            String FotoName = null;

            while (rs.next()) {
                if (departamentos == null) {
                    departamentos = new ArrayList<Register>();
                }

                Register registro = new Register();

                Name = rs.getString("Name");
                registro.setName(Name);

                Lastname = rs.getString("Lastname");
                registro.setLastname(Lastname);

                Password = rs.getString("Password1");
                registro.setPassword(Password);

                Identification_Card = rs.getString("Identification_Card");
                registro.setIdentification_Card(Identification_Card);

                Coach = rs.getString("Coach");
                registro.setCoach(Coach);

                Jornada = rs.getString("Jornada");
                registro.setJornada(Jornada);

                Genre = rs.getString("Genre");
                registro.setGenre(Genre);

                Born_Date = rs.getString("Born_Date");
                registro.setBorn_Date(Born_Date);

                Height = rs.getString("Height");
                registro.setHeight(Height);

                weight = rs.getString("weight");
                registro.setWeight(weight);

                Category = rs.getString("Category");
                registro.setCategory(Category);

                Cellphone = rs.getString("Cellphone");
                registro.setCellphone(Cellphone);

                Role = rs.getString("Role");
                registro.setRole(Role);

                Description = rs.getString("Description");
                registro.setDescription(Description);

                Eps = rs.getString("Eps");
                registro.setEps(Eps);

                Emergency_Number = rs.getString("Emergency_Number");
                registro.setEmergency_Number(Emergency_Number);

                Allergies = rs.getString("Allergies");
                registro.setAllergies(Allergies);

                Diseases = rs.getString("Diseases");
                registro.setDiseases(Diseases);

                FotoName = rs.getString("FotoName");
                registro.setFotoName(FotoName);

                departamentos.add(registro);
            }

            st.close();

        } catch (SQLException e) {
            System.out.println("Problemas al obtener la lista de Atletas");
            e.printStackTrace();
        }

        return departamentos;
    }

    public boolean insert(Register t) throws SQLException {
        boolean result = false;
        Connection connection = Conexion.getConnection();
        String query = " insert into Athele_Register (Name,Lastname,Password1,Identification_Card,Coach,Jornada,Genre,Born_Date,Height,weight,Category,Cellphone,Role,Description,Eps,Emergency_Number,Allergies,Diseases,FotoName)" + "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStmt = null;

        try {

            preparedStmt = connection.prepareStatement(query);
            preparedStmt.setString(1, t.getName());
            preparedStmt.setString(2, t.getLastname());
            preparedStmt.setString(3, t.getPassword());
            preparedStmt.setString(4, t.getIdentification_Card());
            preparedStmt.setString(5, t.getCoach());
            preparedStmt.setString(6, t.getJornada());
            preparedStmt.setString(7, t.getGenre());
            preparedStmt.setString(8, t.getBorn_Date());
            preparedStmt.setString(9, t.getHeight());
            preparedStmt.setString(10, t.getWeight());
            preparedStmt.setString(11, t.getCategory());
            preparedStmt.setString(12, t.getCellphone());
            preparedStmt.setString(13, t.getRole());
            preparedStmt.setString(14, t.getDescription());
            preparedStmt.setString(15, t.getEps());
            preparedStmt.setString(16, t.getEmergency_Number());
            preparedStmt.setString(17, t.getAllergies());
            preparedStmt.setString(18, t.getDiseases());
            preparedStmt.setString(19, t.getFotoName());

            result = preparedStmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

//    public String getAthleteImageById(String id) throws SQLException {
//        Connection connection = Conexion.getConnection();
//        Statement st = connection.createStatement();
//        ResultSet rs = st.executeQuery("SELECT FROM athele_register where id=" + id);
//
//        Register coach = new Register();
//        if (rs.next()) {
//            coach.setFotoName(rs.getString("FotoName"));
//        }
//        return coach.getFotoName();
//    }
//
}

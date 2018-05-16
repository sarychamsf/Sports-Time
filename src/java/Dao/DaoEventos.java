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

public class DaoEventos {

    private Connection connection;

    public DaoEventos() throws URISyntaxException, SQLException {
        connection = Conexion.getConnection();
    }

    public List<Eventos> ListarEventos() throws SQLException {
        List<Eventos> eventos = new ArrayList<Eventos>();
        String query = "SELECT * FROM EVENTS";
        Connection connection = Conexion.getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {

                Eventos evento = new Eventos();

                evento.setId(rs.getInt("id"));
                evento.setStart_date(rs.getString("start_date"));
                evento.setEnd_date(rs.getString("end_date"));
                evento.setText(rs.getString("text"));
                evento.setSubject(rs.getString("subject"));

                eventos.add(evento);

            }

            st.close();

        } catch (SQLException e) {
            System.out.println("Problemas al obtener la lista de Eventos");
            e.printStackTrace();
        }

        return eventos;
    }

    public void addEvento(Eventos objetoAdd) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("INSERT INTO events (`id`, `start_date`, `end_date`, `text`, `subject`) VALUES (?, ?, ?, ?, ?);");
            // Parameters start with 1
            preparedStatement.setInt(1, (int) objetoAdd.getId());
            preparedStatement.setString(2, objetoAdd.getStart_date());
            preparedStatement.setString(3, objetoAdd.getEnd_date());
            preparedStatement.setString(4, objetoAdd.getText());
            preparedStatement.setString(5, objetoAdd.getSubject());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteEvento(String text) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from events where text=?");
            // Parameters start with 1
            preparedStatement.setString(1, text);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateEvento(Eventos objetoUP, String text) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update events set start_date=?, end_date=?, text=?, subject=? where text=" + text);
            // Parameters start with 1
            preparedStatement.setString(1, objetoUP.getStart_date());
            preparedStatement.setString(2, objetoUP.getEnd_date());
            preparedStatement.setString(3, objetoUP.getText());
            preparedStatement.setString(4, objetoUP.getSubject());
            preparedStatement.executeUpdate();
            System.out.println("Actualizo El Evento");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Eventos buscarId(String text) {
        Eventos tabla = new Eventos();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select * from EVENTS where text=?");
            preparedStatement.setString(1, text);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                tabla.setStart_date(rs.getString("start_date"));
                tabla.setEnd_date(rs.getString("end_date"));
                tabla.setText(rs.getString("text"));
                tabla.setSubject(rs.getString("subject"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tabla;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Dao.DaoEventos;
import Datos.Eventos;
import com.google.gson.Gson;
import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MARIO
 */
public class EventoSv extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            Gson gson = new Gson();
            String eventoGson = null;

            DaoEventos evDAO = new DaoEventos();

            // Obtener lista de eventos.
            List<Eventos> listaEventos = evDAO.ListarEventos();
            eventoGson = gson.toJson(listaEventos);
            //ENVIAR AQUÍ "eventoGson" AL SERVLET

            
            
            
            
            // Agregar evento a la base de datos.
            int tempAgregar = Integer.parseInt(request.getParameter("tempAgregar"));
            if (tempAgregar == 1) {

                String id = request.getParameter("id");
                String ev = request.getParameter("ev");
                System.out.println("ID:" + id);
                System.out.println("EV:" + ev);
                
                // UNA VEZ OBTENIDO EL EVENTO, SE SEPARAN SUS ATRIBUTOS, PARA AGREGARLO A LA BASE DE DATOS.

            }

        } catch (URISyntaxException ex) {
            Logger.getLogger(EventoSv.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EventoSv.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}

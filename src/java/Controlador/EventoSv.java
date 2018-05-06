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
import java.io.PrintWriter;
import java.net.URISyntaxException;
import java.sql.SQLException;
import java.util.ArrayList;
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
    
    private DaoEventos dao;
    private int eliminarID;
    private int buscarID;

    public EventoSv() throws URISyntaxException, SQLException {
        super();
        dao = new DaoEventos();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String s = null;
        try {
            ///posiscion 0 //Lista Eventos
            List<Eventos> datosEvento = dao.ListarObj();
            if (this.eliminarID != 0) {
                dao.deleteObj(eliminarID);
            }
            
            if (this.buscarID != 0) {
                dao.buscarId(buscarID);
            }
 
            
            /////Asignacion Gson
            List<List> dotGraficas = new ArrayList<List>();
            dotGraficas.add(datosEvento);
//            System.out.println(dotGraficas.get(0));

            s = gson.toJson(dotGraficas);
        } catch (SQLException ex) {
            Logger.getLogger(Graficas.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.getWriter().print(s);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.eliminarID = Integer.parseInt(request.getParameter("IDeliminarJX"));
        this.buscarID = Integer.parseInt(request.getParameter("IDactualizarJX"));
        System.out.println(eliminarID+" "+buscarID);
        
        
        
        
        
        
        doGet(request, response);
    }
}

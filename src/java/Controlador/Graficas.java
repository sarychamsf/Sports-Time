/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Dao.*;
import com.google.gson.Gson;
import java.io.IOException;
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
public class Graficas extends HttpServlet {

    private Crud_List dao;
    private Crud_Routing dao2;
    private Crud_Times dao3;
    private String nombreEnt;
    private String Fecha;
    private String Estilo;

    public Graficas() {
        super();
        dao = new Crud_List();
        dao2 = new Crud_Routing();
        dao3 = new Crud_Times();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String s = null;
        try {
            ///posiscion 0
            List<String> datosFecha = dao.Fechas2(nombreEnt);
            ///posiscion 1
            List<String> datosEstilos = dao2.Estilos(Fecha);
            ///posiscion 2
            List<List> datosFilFecEnt = new ArrayList<List>();
            if (Estilo != null) {
                System.out.println(Estilo);
                datosFilFecEnt = dao3.filtroFecEnt(Fecha, nombreEnt, Estilo);
            }
            List<List> dotGraficas = new ArrayList<List>();
            dotGraficas.add(datosFecha);
            System.out.println(dotGraficas.get(0));
            dotGraficas.add(datosEstilos);
            dotGraficas.add(datosFilFecEnt);

            s = gson.toJson(dotGraficas);
        } catch (SQLException ex) {
            Logger.getLogger(Graficas.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.getWriter().print(s);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.nombreEnt = request.getParameter("nombreEntJX");
        this.Fecha = request.getParameter("FechaJX");
        this.Estilo = request.getParameter("EstiloJX");
        
        System.out.println(nombreEnt+" "+Fecha+" "+Estilo+" ");
        doGet(request, response);
    }
}

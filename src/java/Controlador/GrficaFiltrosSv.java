/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Dao.*;
import Datos.*;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
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
public class GrficaFiltrosSv extends HttpServlet {

    private Crud_List dao;
    private Crud_Routing dao2;
    private Crud_Times dao3;
    private String nombreDep;
    private String nombreEnt;
    private String Fecha;
    private String Estilo;
    private String Distancia;

    public GrficaFiltrosSv() {
        super();
        dao = new Crud_List();
        dao2 = new Crud_Routing();
        dao3 = new Crud_Times();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String s = null;
        int distID = 0;
        try {
            List<String> datosFecha = dao.Fechas(nombreDep, nombreEnt);
            List<String> datosEstilos = dao2.Estilos(Fecha);
            List<Routing> datosDistancias = dao2.Distancias(Estilo, Fecha);
            List<List> datosFiltro = new ArrayList<List>();
            if (Distancia!=null) {
                distID=Integer.parseInt(Distancia);
                System.out.println(distID);
                datosFiltro = dao3.datosFiltroGrafica(distID, nombreDep);
            }

            List<List> dotGraficas = new ArrayList<List>();
            ///posiscion 0
            dotGraficas.add(datosFecha);
            ///posiscion 1
            dotGraficas.add(datosEstilos);
            ///posiscion 2
            dotGraficas.add(datosDistancias);
            ///posiscion 3
            dotGraficas.add(datosFiltro);
            
            s = gson.toJson(dotGraficas);
            
        } catch (SQLException ex) {
            Logger.getLogger(Graficas.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.getWriter().print(s);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.nombreDep= request.getParameter("nombreDepJX");
        this.nombreEnt= request.getParameter("nombreEntJX");
        this.Fecha= request.getParameter("FechaJX");
        this.Estilo= request.getParameter("EstiloJX");
        this.Distancia= request.getParameter("DistanciaJX");
        System.out.println(nombreDep+" "+nombreEnt+" "+Fecha+" "+Estilo+" "+Distancia);
        doGet(request, response);
    }
}

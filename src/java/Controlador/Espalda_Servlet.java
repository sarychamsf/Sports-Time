package Controlador;

import Dao.Crud_Athele;
import Dao.Crud_Routing;
import Dao.Crud_Times;
import Datos.Routing;
import Datos.Times;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Espalda_Servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=iso-8859-1");
        PrintWriter out = response.getWriter();

        HttpSession misession = request.getSession(true);
        String Cantidad = request.getParameter("Cantidad");

        int cantidadsec = Integer.parseInt(Cantidad);

        if (cantidadsec == 0) {

            misession.invalidate();
            out.println("Finalizado");

        } else {

            String Distancia = request.getParameter("Distancia");

            cantidadsec--;
            misession.setAttribute("repeticiones", cantidadsec);
            misession.setAttribute("Distancia", Distancia);

            String nombresfi = request.getParameter("nombresfi");
            String tiemposfi = request.getParameter("tiempofi");

            String[] nombres = nombresfi.split(",");
            String[] tiempos = tiemposfi.split(",");

            Crud_Routing routi = new Crud_Routing();
            Routing r = new Routing(Cantidad, Distancia, "Espalda", " ");

            try {
                routi.insert(r);
            } catch (SQLException ex) {
                Logger.getLogger(Espalda_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            int temp = 0;
            try {
                temp = routi.findAll().size();
                temp--;
            } catch (SQLException ex) {
                Logger.getLogger(Espalda_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            for (int i = 0; i < nombres.length; i++) {
                try {
                    Crud_Athele athele = new Crud_Athele();
                    Crud_Times time = new Crud_Times();
                    Times t = new Times(routi.findAll().get(temp).getNumber(), 1, nombres[i], tiempos[i]);
                    time.insert(t);
                } catch (SQLException ex) {
                    Logger.getLogger(Espalda_Servlet.class.getName()).log(Level.SEVERE, null, ex);
                }

            }

            if (cantidadsec == 0) {
                out.println("Finalizado");
            } else {
                out.println("Relogea");
            }

        }

    }
}

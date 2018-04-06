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

public class Libre_Servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=iso-8859-1");
        PrintWriter out = response.getWriter();

        String Cantidad = request.getParameter("Cantidad");
        String Distancia = request.getParameter("Distancia");

        String Name_Athele0 = request.getParameter("Name_Athele0");
        String Athele0 = request.getParameter("Athele0");

        String Name_Athele1 = request.getParameter("Name_Athele1");
        String Athele1 = request.getParameter("Athele1");

        String Name_Athele2 = request.getParameter("Name_Athele2");
        String Athele2 = request.getParameter("Athele2");

        String Name_Athele3 = request.getParameter("Name_Athele3");
        String Athele3 = request.getParameter("Athele3");

        String Name_Athele4 = request.getParameter("Name_Athele4");
        String Athele4 = request.getParameter("Athele4");

        String Name_Athele5 = request.getParameter("Name_Athele5");
        String Athele5 = request.getParameter("Athele5");

        Crud_Routing routi = new Crud_Routing();
        Routing r = new Routing(Cantidad, Distancia, "Libre", " ");

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

        if (Name_Athele0.equals("")) {

        } else {

            Crud_Athele athele = new Crud_Athele();
            Crud_Times time = new Crud_Times();

            try {
                Times t = new Times(routi.findAll().get(temp).getNumber(), 2, Name_Athele0, Athele0);
                time.insert(t);
            } catch (SQLException ex) {
                Logger.getLogger(Espalda_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (Name_Athele1.equals("")) {

        } else {
            Crud_Athele athele = new Crud_Athele();
            Crud_Times time = new Crud_Times();

            try {
                Times t = new Times(routi.findAll().get(temp).getNumber(), 2, Name_Athele1, Athele1);
                time.insert(t);
            } catch (SQLException ex) {
                Logger.getLogger(Espalda_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (Name_Athele2.equals("")) {

        } else {
            Crud_Athele athele = new Crud_Athele();
            Crud_Times time = new Crud_Times();

            try {
                Times t = new Times(routi.findAll().get(temp).getNumber(), 2, Name_Athele2, Athele2);
                time.insert(t);
            } catch (SQLException ex) {
                Logger.getLogger(Espalda_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (Name_Athele3.equals("")) {

        } else {
            Crud_Athele athele = new Crud_Athele();
            Crud_Times time = new Crud_Times();

            try {
                Times t = new Times(routi.findAll().get(temp).getNumber(), 2, Name_Athele3, Athele3);
                time.insert(t);
            } catch (SQLException ex) {
                Logger.getLogger(Espalda_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (Name_Athele4.equals("")) {

        } else {
            Crud_Athele athele = new Crud_Athele();
            Crud_Times time = new Crud_Times();

            try {
                Times t = new Times(routi.findAll().get(temp).getNumber(), 2, Name_Athele4, Athele4);
                time.insert(t);
            } catch (SQLException ex) {
                Logger.getLogger(Espalda_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (Name_Athele5.equals("")) {

        } else {
            Crud_Athele athele = new Crud_Athele();
            Crud_Times time = new Crud_Times();

            try {
                Times t = new Times(routi.findAll().get(temp).getNumber(), 2, Name_Athele5, Athele5);
                time.insert(t);
            } catch (SQLException ex) {
                Logger.getLogger(Espalda_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        out.println("xxx");

    }
}

package Controlador;

import Dao.Crud_Request;
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

public class Temporary_Profile_Servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=iso-8859-1");
        PrintWriter out = response.getWriter();

        String temp = request.getParameter("temp");

        if (temp.equals("volver")) {
            out.println("volver");
        }

        if (temp.equals("verperfil")) {
            String name = request.getParameter("name");
            HttpSession misession = request.getSession(true);
            misession.setAttribute("Temporary_Profile", name);
            out.println("verperfil");
        }

        if (temp.equals("aceptado")) {

            try {
                String namesolicitud = request.getParameter("namesolicitud");
                String name = request.getParameter("name");
                Crud_Request crr = new Crud_Request();
                crr.update("aceptado", namesolicitud, name);
                out.println("aceptado");
            } catch (SQLException ex) {
                Logger.getLogger(Temporary_Profile_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        if (temp.equals("rechazado")) {

            try {
                String namesolicitud = request.getParameter("namesolicitud");
                String name = request.getParameter("name");
                Crud_Request crr = new Crud_Request();
                crr.delete("en espera",namesolicitud, name);
                out.println("rechazado");
            } catch (SQLException ex) {
                Logger.getLogger(Temporary_Profile_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }
}

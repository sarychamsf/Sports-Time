package Controlador;

import Dao.Crud_Athele;
import Dao.Crud_Coach;
import Dao.Crud_Comments_User;
import Dao.Crud_Request;
import Datos.Comments_user;
import Datos.Request;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Request_Servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=iso-8859-1");
        PrintWriter out = response.getWriter();
       
        
        HttpSession misession = request.getSession(true);
        String name = null;
        String fotoName = null;

        if (misession.getAttribute("usuario") == "Entrenador") {

            try {
                Crud_Coach crr = new Crud_Coach();
                HttpSession misession1 = request.getSession(true);
                String h = String.valueOf(misession1.getAttribute("v"));
                int identifiquer = Integer.parseInt(h);
                name = crr.findAll().get(identifiquer).getName() + " " + crr.findAll().get(identifiquer).getLastname();
            } catch (SQLException ex) {
                Logger.getLogger(Request_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }
 
        }

        if (misession.getAttribute("usuario") == "Deportista") {

            try {
                Crud_Athele crr = new Crud_Athele();
                HttpSession misession1 = request.getSession(true);
                String h = String.valueOf(misession1.getAttribute("v"));
                int identifiquer = Integer.parseInt(h);
                name = crr.findAll().get(identifiquer).getName() + " " + crr.findAll().get(identifiquer).getLastname();
            } catch (SQLException ex) {
                Logger.getLogger(Request_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }
          
        }
      
        
        
        String temp = request.getParameter("temp");
        String idsolitud = name;
        String destiny = request.getParameter("destiny");

        if (temp.equals("agregar")) {

            try {
                Request re = new Request(idsolitud, destiny, "en espera");
                Crud_Request req = new Crud_Request();
                req.insert(re);
                out.println("agregado");
            } catch (SQLException ex) {
                Logger.getLogger(Request_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (temp.equals("volver")) {
            out.println("volver");

        }

    }
}

//Prueba

package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Athlete_Servlet extends HttpServlet {
//El profe leyva es el mejor!!
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=iso-8859-1");
        PrintWriter out = response.getWriter();

        String temp = request.getParameter("Temp");
        
         if (temp.equals("Espalda_graph")) {
      
            out.println("Espalda_graph");
        }

        if (temp.equals("close")) {
            HttpSession misession = request.getSession(true);
            misession.removeAttribute("usuario");
            misession.invalidate();
            out.println("close");
        }
        
        if (temp.equals("muro")) {         
            out.println("muro");
        }
        
         if (temp.equals("calendario")) {         
            out.println("calendario");
        }
         
          if (temp.equals("solicitudes")) {         
            out.println("solicitudes");
        }

    }
}

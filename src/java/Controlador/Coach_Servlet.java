package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Coach_Servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=iso-8859-1");
        PrintWriter out = response.getWriter();

        String temp = request.getParameter("Temp");
        String Role1 = request.getParameter("Role1");

  
        
        if (temp.equals("list")) {

            if (Role1.equals("1")) {
                HttpSession misession = request.getSession(true);
                misession.setAttribute("Role", "Mañana");

            } else {
                HttpSession misession = request.getSession(true);
                misession.setAttribute("Role", "Tarde");

            }

            out.println("list");
        }

        if (temp.equals("management")) {
            out.println("management");
        }

        if (temp.equals("close")) {
            HttpSession misession = request.getSession(true);
            misession.removeAttribute("usuario");
            misession.invalidate();
            out.println("close");
        }
        
         if(temp.equals("grap")){
            out.println("grap");
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

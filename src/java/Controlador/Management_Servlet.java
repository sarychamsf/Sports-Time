package Controlador;

import Dao.Crud_Athele;
import Dao.Crud_Coach;
import Datos.Register;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Management_Servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=iso-8859-1");
        PrintWriter out = response.getWriter();

        String Espalda = request.getParameter("Espalda");
        String Libre = request.getParameter("Libre");
        String Pecho = request.getParameter("Pecho");
        System.out.println(Espalda);
        System.out.println(Libre);
        System.out.println(Pecho);

        if (Espalda.equals("1")) {
            out.println("Espalda");
        }

        if (Libre.equals("1")) {
            out.println("Libre");
        }
        if (Pecho.equals("1")) {
            out.println("Pecho");
        }

    }
}
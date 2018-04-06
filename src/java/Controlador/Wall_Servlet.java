package Controlador;

import Dao.Crud_Athele;
import Dao.Crud_Coach;
import Dao.Crud_Comments;
import Datos.Comments;
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

public class Wall_Servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=iso-8859-1");
        PrintWriter out = response.getWriter();

        String tempdec = request.getParameter("temp");

        if (tempdec.equals("publicar")) {

            try {

                HttpSession misession = request.getSession(true);
                String namefi = null;
                

                if (misession.getAttribute("usuario") == "Entrenador") {

                    Crud_Coach crr = new Crud_Coach();
                    HttpSession misession1 = request.getSession(true);
                    String h = String.valueOf(misession1.getAttribute("v"));
                    int identifiquer = Integer.parseInt(h);
                    namefi = crr.findAll().get(identifiquer).getName() + " " + crr.findAll().get(identifiquer).getLastname();
                   
                }

                if (misession.getAttribute("usuario") == "Deportista") {

                    Crud_Athele crr = new Crud_Athele();
                    HttpSession misession1 = request.getSession(true);
                    String h = String.valueOf(misession1.getAttribute("v"));
                    int identifiquer = Integer.parseInt(h);
                    namefi = crr.findAll().get(identifiquer).getName() + " " + crr.findAll().get(identifiquer).getLastname();
                    

                }
                

                String id = namefi;
                String name = request.getParameter("name");
                String mensaje = request.getParameter("mensaje");
                String duracion = request.getParameter("duracion");
            

                Date date = new Date();
                DateFormat hourdateFormat = new SimpleDateFormat("yyyy/MM/dd");

                String fecha_y_hora = hourdateFormat.format(date);
                String[] parts = fecha_y_hora.split("/");
                String part1 = parts[0];
                String part2 = parts[1];
                String part3 = parts[2];

                int diaactual = Integer.parseInt(part3);
                int duracionint = Integer.parseInt(duracion);
                int temp = diaactual + duracionint;

                String fecha = String.valueOf(temp);
                String definitiva = null;

                if (fecha.length() == 1) {
                    definitiva = "0" + fecha;
                } else if (fecha.length() == 2) {
                    int temp2 = Integer.parseInt(fecha);
                    int temp3 = Integer.parseInt(part3);

                    if (temp2 > 28) {
                        int tempf = temp2 - temp3;
                        String tempf1 = String.valueOf(tempf);
                        if (tempf1.length() == 1) {
                            definitiva = "0" + tempf1;
                        }
                    } else {
                        definitiva = fecha;
                    }

                    if (temp2 > 30) {
                        int tempf = temp2 - temp3;
                        String tempf1 = String.valueOf(tempf);
                        if (tempf1.length() == 1) {
                            definitiva = "0" + tempf1;
                        }
                    } else {
                        definitiva = fecha;
                    }

                    if (temp2 > 31) {
                        int tempf = temp2 - temp3;
                        String tempf1 = String.valueOf(tempf);
                        if (tempf1.length() == 1) {
                            definitiva = "0" + tempf1;
                        }
                    } else {
                        definitiva = fecha;
                    }

                }

                String fecha_de_cierre = part1 + "/" + part2 + "/" + definitiva;

                System.out.println(fecha_y_hora);
                System.out.println(fecha_de_cierre);

                Comments co = new Comments(id, name, mensaje, fecha_de_cierre);
                Crud_Comments crr = new Crud_Comments();
                crr.insert(co);
                out.println("publicar");
            } catch (SQLException ex) {
                Logger.getLogger(Wall_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (tempdec.equals("volver")) {
            out.println("volver");
        }

    }
}

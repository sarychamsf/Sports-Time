package Controlador;

import Dao.Crud_Comments_User;
import Datos.Comments_user;
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

public class Comment_Servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            response.setContentType("text/html; charset=iso-8859-1");
            PrintWriter out = response.getWriter();
            
            String id = request.getParameter("id");
            String idcommentuser = request.getParameter("idcommentuser");
            String mensajecomment = request.getParameter("mensajecomment");
            String duracioncomment = request.getParameter("duracioncomment");
            
            
            Date date = new Date();
            DateFormat hourdateFormat = new SimpleDateFormat("yyyy/MM/dd");

            String fecha_y_hora = hourdateFormat.format(date);
            String[] parts = fecha_y_hora.split("/");
            String part1 = parts[0];
            String part2 = parts[1];
            String part3 = parts[2];

            int diaactual = Integer.parseInt(part3);
            int duracionint = Integer.parseInt(duracioncomment);
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

            System.out.println(fecha_de_cierre);
            
            
            Comments_user co=new Comments_user(id,idcommentuser,mensajecomment,fecha_de_cierre);
            Crud_Comments_User crr=new Crud_Comments_User();
            crr.insert(co);
            out.println("comentado");
            
        } catch (SQLException ex) {
            Logger.getLogger(Comment_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
        
        
        
        

    }
}

package Controlador;

import Dao.Crud_Athele;
import Dao.Crud_Coach;
import Dao.Crud_List;
import Datos.List1;
import Datos.Register;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import static java.net.Proxy.Type.HTTP;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Attendance_Servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=iso-8859-1");
        PrintWriter out = response.getWriter();
        HttpSession misession = request.getSession(true);

        String nombresfi = request.getParameter("nombresfi");
        String estadofin = request.getParameter("estadofin");
        String lenght = request.getParameter("lenght");

        int lenghti = Integer.parseInt(lenght);
        System.out.println("........");
        System.out.println(lenghti);

        String[] nombres = nombresfi.split(",");
        String[] estados = estadofin.split(",");

        for (int i = 0; i < lenghti; i++) {
            if (estados[i].equals("1")) {
                estados[i] = "Asistio";
            } else {
                estados[i] = "No Asistio";
            }
        }

        String Coach_Name = request.getParameter("Coach_Name");
        String Jornada = request.getParameter("Jornada");
        misession.setAttribute("jornada", Jornada);

        Crud_List crr = new Crud_List();

        for (int i = 0; i < lenghti; i++) {
            try {
                List1 list = new List1(nombres[i], estados[i], Coach_Name, Jornada);
                crr.insert0(list);
            } catch (SQLException ex) {
                Logger.getLogger(Attendance_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        out.println("xxx");

    }
}

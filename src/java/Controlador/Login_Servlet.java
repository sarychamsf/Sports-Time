package Controlador;

import Dao.Crud_Athele;
import Dao.Crud_Coach;
import Datos.Register;
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
import org.apache.commons.codec.digest.DigestUtils;

public class Login_Servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final static Logger LOGGER = Logger.getLogger(Login_Servlet.class.getCanonicalName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=iso-8859-1");
        PrintWriter out = response.getWriter();

        String temp = request.getParameter("Temp");
        HttpSession misession = request.getSession(true);
   


        if (temp.equals("1")) {       //Log in

            Crud_Coach crr = new Crud_Coach();
            Crud_Athele crr2 = new Crud_Athele();

            try {

                String UserName = request.getParameter("username1");
                String Password = request.getParameter("password");
                String textoEncriptadoConMD5 = DigestUtils.md5Hex(Password);

                for (int i = 0; i < crr.findAll().size(); i++) {

                    if (Password.equals(crr.findAll().get(i).getPassword()) && UserName.equals(crr.findAll().get(i).getName())) {
                        Register reg = new Register();
                        reg.setTemp(i);
                        misession.setAttribute("usuario", "Entrenador");
                        misession.setAttribute("v", i);
                        out.println("Entrenador");

                    }

                }

                for (int i = 0; i < crr2.findAll().size(); i++) {

                    if (Password.equals(crr2.findAll().get(i).getPassword()) && UserName.equals(crr2.findAll().get(i).getName())) {
                        Register reg = new Register();
                        reg.setTemp(i);
                        misession.setAttribute("usuario", "Deportista");
                        misession.setAttribute("v", i);
                        out.println("Deportista");

                    }

                }

            } catch (SQLException ex) {
                Logger.getLogger(Login_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

}

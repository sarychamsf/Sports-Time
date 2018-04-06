package Controlador;

import Dao.Crud_Athele;
import Dao.Crud_Coach;
import Datos.Register;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.codec.digest.DigestUtils;

@WebServlet(name = "Register_Servlet", urlPatterns = {"/Register_Servlet"})
@MultipartConfig
public class Register_Servlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private final static Logger LOGGER = Logger.getLogger(Login_Servlet.class.getCanonicalName());
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html; charset=iso-8859-1");
        response.sendRedirect("Login.jsp");
        
        String Name = request.getParameter("Name");
        String Lastname = request.getParameter("Lastname");
        String Password = request.getParameter("Password");
        String textoEncriptadoConMD5 = DigestUtils.md5Hex(Password);
        String Identification_Card = request.getParameter("Identification_Card");
        String Coach = request.getParameter("Coach");
        String Jornada = request.getParameter("Jornada");
        String Genre = request.getParameter("Genre");
        String Born_Date = request.getParameter("Born_Date");
        String Height = request.getParameter("Height");
        String weight = request.getParameter("Weight");
        String Category = request.getParameter("Category");
        String Cellphone = request.getParameter("Cellphone");
        String Role = request.getParameter("Role");
        String Description = request.getParameter("Description");
        String Eps = request.getParameter("Eps");
        String Emergency_Number = request.getParameter("Emergency_Number");
        String Allergies = request.getParameter("Allergies");
        String Diseases = request.getParameter("Diseases");
        String FotoName = request.getParameter("fototxt");
        
        Part FotoFile = request.getPart("fotofile");
        final String path = "C:/Users/user/Documents/NetBeansProjects/SpotsTime10000/web/fotosdb/";
        InputStream filecontent = FotoFile.getInputStream();
        PrintWriter out = response.getWriter();
        File file = new File(path + FotoName);
        OutputStream output = new FileOutputStream(file);
        final PrintWriter writer = response.getWriter();
        
        int read = 0;
        final byte[] bytes = new byte[1024];
        
        while ((read = filecontent.read(bytes)) != -1) {
            output.write(bytes, 0, read);
        }
        
        if (out != null) {
            out.close();
        }
        if (filecontent != null) {
            filecontent.close();
        }
        if (writer != null) {
            writer.close();
        }
        
        if (Role.equals("1")) {     //coach

            try {
                
                Register reg = new Register(Name, Lastname, textoEncriptadoConMD5, Identification_Card, Coach, Jornada, Genre, Born_Date, Height, weight, Category, Cellphone, Role, Description, Eps, Emergency_Number, Allergies, Diseases, FotoName);
                Crud_Coach crr = new Crud_Coach();
                crr.insert(reg);
            } catch (SQLException ex) {
                Logger.getLogger(Login_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        } else if (Role.equals("2")) {   //athlete

            try {
                Register reg = new Register(Name, Lastname, textoEncriptadoConMD5, Identification_Card, Coach, Jornada, Genre, Born_Date, Height, weight, Category, Cellphone, Role, Description, Eps, Emergency_Number, Allergies, Diseases, FotoName);
                Crud_Athele crr2 = new Crud_Athele();
                crr2.insert(reg);
            } catch (SQLException ex) {
                Logger.getLogger(Login_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        
    }
    
}

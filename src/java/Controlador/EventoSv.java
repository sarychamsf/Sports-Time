package Controlador;

import Dao.DaoEventos;
import Datos.Eventos;
import com.google.gson.Gson;
import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Esta clase es el Servlet para el JSP Calendar. Permite agregar eventos y
 * obtener eventos de la base de datos.
 *
 * @author Sary
 */
public class EventoSv extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * El método GET envía los eventos de la base de datos al JSP para que se
     * muestren en el calendario.
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            // Crear objeto GSON para que se pueda convertir la lista de eventos a JSON.
            Gson gsonEnviar = new Gson();
            String evGsonEnviar = null;

            DaoEventos evDAO = new DaoEventos();

            // Obtener lista de eventos.
            List<Eventos> listaEventos = evDAO.ListarEventos();

            // Convertir lista de eventos a formato JSON usando GSON.
            evGsonEnviar = gsonEnviar.toJson(listaEventos);

            // Enviar la lista de eventos en JSON al JSP.
            response.getWriter().print(evGsonEnviar);

        } catch (URISyntaxException ex) {
            Logger.getLogger(EventoSv.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EventoSv.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * El método POST obtiene los parámetros enviados en la creación de un nuevo
     * evento y guarda dicho evento en la base de datos.
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            // Se obtiene el evento creado y su id.
            String idString = request.getParameter("id");
            String ev = request.getParameter("ev");
            long id = Long.parseLong(idString);

            // Se crea un objeto GSON para convertir el objeto de JSON a un objeto de tipo Eventos.
            Gson gsonObtener = new Gson();
            Eventos evGsonObtener = gsonObtener.fromJson(ev, Eventos.class);

            // Se le asigna al objeto creado el id generado.
            evGsonObtener.setId(id);

            // Convertir la fecha y hora de inicio al formato necesario: aaaa-mm-dd hh:mm
            String start_dateAux = evGsonObtener.getStart_date();
            String start_horaAux = evGsonObtener.getStart_date();
            String date = start_dateAux.substring(0, 10);
            String hora = start_horaAux.substring(11, 16);
            String start_date = date + " " + hora;
            evGsonObtener.setStart_date(start_date);

            // Convertir la fecha y hora de finalización al formato necesario: aaaa-mm-dd hh:mm
            String end_dateAux = evGsonObtener.getEnd_date();
            String end_horaAux = evGsonObtener.getEnd_date();
            String edate = end_dateAux.substring(0, 10);
            String ehora = end_horaAux.substring(11, 16);
            String end_date = edate + " " + ehora;
            evGsonObtener.setEnd_date(end_date);

            // Agregar a la base de datos.
            DaoEventos evDAO = new DaoEventos();
            evDAO.addEvento(evGsonObtener);

        } catch (URISyntaxException ex) {
            Logger.getLogger(EventoSv.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EventoSv.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}

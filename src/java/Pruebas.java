
import Dao.DaoEventos;
import Datos.Eventos;
import java.net.URISyntaxException;
import java.sql.SQLException;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author MARIO
 */
public class Pruebas {
    
    public static void main(String[] args) throws URISyntaxException, SQLException {
        
        Eventos eventos = new Eventos("open aguar abiertas", "open", "2018-04-20", "Cali");
        
        DaoEventos daoEventos = new DaoEventos();
        
        
//        daoEventos.addObjeto(eventos);
        
        Eventos eventos1 = daoEventos.buscarId(1);
        eventos1.setLugar("Medellin");
        daoEventos.updateTabla(eventos1, 1);
        
        System.out.println(eventos1);
        
        System.out.println(daoEventos.ListarObj());
        
    }
}

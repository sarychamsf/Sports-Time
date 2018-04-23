/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

/**
 *
 * @author MARIO
 */
public class Eventos {
    private int ID_Evento;
    private String nombre;
    private String Tipo;
    private String fecha;
    private String lugar;

    public Eventos() {
    }
    
    public Eventos(String nombre, String Tipo, String fecha, String lugar) {
        this.nombre = nombre;
        this.Tipo = Tipo;
        this.fecha = fecha;
        this.lugar = lugar;
    }
    
    public int getID_Evento() {
        return ID_Evento;
    }

    public void setID_Evento(int ID_Evento) {
        this.ID_Evento = ID_Evento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    @Override
    public String toString() {
        return "Eventos{" + "ID_Evento=" + ID_Evento + ", nombre=" + nombre + ", Tipo=" + Tipo + ", fecha=" + fecha + ", lugar=" + lugar + '}';
    }    
    
}

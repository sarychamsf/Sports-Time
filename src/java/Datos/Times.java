/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

/**
 *
 * @author JCBOT
 */
public class Times {

    private int ID_Time;
    private int ID_Routing;
    private String ID_Athele;
    private String time;

    public Times(int ID_Time, int ID_Routing, String ID_Athele, String time) {
        this.ID_Time = ID_Time;
        this.ID_Routing = ID_Routing;
        this.ID_Athele = ID_Athele;
        this.time = time;
    }

    public Times() {
    }

    public int getID_Time() {
        return ID_Time;
    }

    public void setID_Time(int ID_Time) {
        this.ID_Time = ID_Time;
    }

    public int getID_Routing() {
        return ID_Routing;
    }

    public void setID_Routing(int ID_Routing) {
        this.ID_Routing = ID_Routing;
    }

    public String getID_Athele() {
        return ID_Athele;
    }

    public void setID_Athele(String ID_Athele) {
        this.ID_Athele = ID_Athele;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

  

}

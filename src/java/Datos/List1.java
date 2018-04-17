/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

/**
 *
 * @author sebastián-rs
 */
public class List1 {

    private String Date;  
    private String Name_Athele0;
    private String Athele0;
    private String Coach_Name;
    private String Jornada;

    public List1(String Name_Athele0, String Athele0, String Coach_Name, String Jornada) {
        this.Name_Athele0 = Name_Athele0;
        this.Athele0 = Athele0;
        this.Coach_Name = Coach_Name;
        this.Jornada = Jornada;
    }

    public List1() {
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

        
    public String getName_Athele0() {
        return Name_Athele0;
    }

    public void setName_Athele0(String Name_Athele0) {
        this.Name_Athele0 = Name_Athele0;
    }

    public String getAthele0() {
        return Athele0;
    }

    public void setAthele0(String Athele0) {
        this.Athele0 = Athele0;
    }

    public String getCoach_Name() {
        return Coach_Name;
    }

    public void setCoach_Name(String Coach_Name) {
        this.Coach_Name = Coach_Name;
    }

    public String getJornada() {
        return Jornada;
    }

    public void setJornada(String Jornada) {
        this.Jornada = Jornada;
    }

}
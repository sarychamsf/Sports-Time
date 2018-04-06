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
public class Routing {

    private int Number;
    private String Quantity;
    private String Distance;
    private String Style;
    private String Date;

    public Routing( String Quantity, String Distance, String Style, String Date) {
        this.Quantity = Quantity;
        this.Distance = Distance;
        this.Style = Style;
        this.Date = Date;
    }

    public Routing() {
    }

    public int getNumber() {
        return Number;
    }

    public void setNumber(int Number) {
        this.Number = Number;
    }

    public String getQuantity() {
        return Quantity;
    }

    public void setQuantity(String Quantity) {
        this.Quantity = Quantity;
    }

    public String getDistance() {
        return Distance;
    }

    public void setDistance(String Distance) {
        this.Distance = Distance;
    }

    public String getStyle() {
        return Style;
    }

    public void setStyle(String Style) {
        this.Style = Style;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }
    

}

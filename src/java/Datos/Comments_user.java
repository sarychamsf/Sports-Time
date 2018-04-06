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
public class Comments_user {

    private String idcomments;
    private String id;
    private String text;
    private String date;

    public Comments_user(String idcomments, String id, String text, String date) {
        this.idcomments = idcomments;
        this.id = id;
        this.text = text;
        this.date = date;
    }

    public Comments_user() {
    }

    public String getIdcomments() {
        return idcomments;
    }

    public void setIdcomments(String idcomments) {
        this.idcomments = idcomments;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    

}

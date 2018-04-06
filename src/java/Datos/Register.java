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
public class Register {

    private String Name;
    private String Lastname;
    private String Password;
    private String Identification_Card;
    private String Coach;
    private String Jornada;
    private String Genre;
    private String Born_Date;
    private String Height;
    private String weight;
    private String Category;
    private String Cellphone;
    private String Role;
    private String Description;
    private String Eps;
    private String Emergency_Number;
    private String Allergies;
    private String Diseases;
    private String FotoName;
    private int temp;

    public Register(String Name, String Lastname, String Password, String Identification_Card, String Coach, String Jornada, String Genre, String Born_Date, String Height, String weight, String Category, String Cellphone, String Role, String Description, String Eps, String Emergency_Number, String Allergies, String Diseases, String FotoName) {
        this.Name = Name;
        this.Lastname = Lastname;
        this.Password = Password;
        this.Identification_Card = Identification_Card;
        this.Coach = Coach;
        this.Jornada = Jornada;
        this.Genre = Genre;
        this.Born_Date = Born_Date;
        this.Height = Height;
        this.weight = weight;
        this.Category = Category;
        this.Cellphone = Cellphone;
        this.Role = Role;
        this.Description = Description;
        this.Eps = Eps;
        this.Emergency_Number = Emergency_Number;
        this.Allergies = Allergies;
        this.Diseases = Diseases;
        this.FotoName = FotoName;
    }

    public Register() {
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getLastname() {
        return Lastname;
    }

    public void setLastname(String Lastname) {
        this.Lastname = Lastname;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getIdentification_Card() {
        return Identification_Card;
    }

    public void setIdentification_Card(String Identification_Card) {
        this.Identification_Card = Identification_Card;
    }

    public String getCoach() {
        return Coach;
    }

    public void setCoach(String Coach) {
        this.Coach = Coach;
    }

    public String getJornada() {
        return Jornada;
    }

    public void setJornada(String Jornada) {
        this.Jornada = Jornada;
    }

    public String getGenre() {
        return Genre;
    }

    public void setGenre(String Genre) {
        this.Genre = Genre;
    }

    public String getBorn_Date() {
        return Born_Date;
    }

    public void setBorn_Date(String Born_Date) {
        this.Born_Date = Born_Date;
    }

    public String getHeight() {
        return Height;
    }

    public void setHeight(String Height) {
        this.Height = Height;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

    public String getCellphone() {
        return Cellphone;
    }

    public void setCellphone(String Cellphone) {
        this.Cellphone = Cellphone;
    }

    public String getRole() {
        return Role;
    }

    public void setRole(String Role) {
        this.Role = Role;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getEps() {
        return Eps;
    }

    public void setEps(String Eps) {
        this.Eps = Eps;
    }

    public String getEmergency_Number() {
        return Emergency_Number;
    }

    public void setEmergency_Number(String Emergency_Number) {
        this.Emergency_Number = Emergency_Number;
    }

    public String getAllergies() {
        return Allergies;
    }

    public void setAllergies(String Allergies) {
        this.Allergies = Allergies;
    }

    public String getDiseases() {
        return Diseases;
    }

    public void setDiseases(String Diseases) {
        this.Diseases = Diseases;
    }

    public int getTemp() {
        return temp;
    }

    public void setTemp(int temp) {
        this.temp = temp;
    }

    public String getFotoName() {
        return FotoName;
    }

    public void setFotoName(String Foto) {
        this.FotoName = Foto;
    }

}

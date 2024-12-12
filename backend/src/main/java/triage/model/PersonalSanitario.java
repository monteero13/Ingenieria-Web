package triage.model;

import jakarta.persistence.*;

import java.util.Date;

@Entity
public class PersonalSanitario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int personalID;

    private String nombre;
    private String cargo;
    private String especialidad;
    private String correoElectronico;
    private String telefono;
    private String contrasena;

    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaRegistro = new Date();

    // Getters y Setters
    public int getPersonalID() {
        return personalID;
    }

    public void setPersonalID(int personalID) {
        this.personalID = personalID;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }
}
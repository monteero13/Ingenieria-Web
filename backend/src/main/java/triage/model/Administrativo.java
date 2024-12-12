package triage.model;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Administrativo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int administrativoID;

    private String nombre;
    private String cargo;
    private String correoElectronico;
    private String telefono;
    private String contrasena;
    private Date fechaRegistro;

    // Constructor
    public Administrativo() {}

    // Getters y Setters
    public int getAdministrativoID() {
        return administrativoID;
    }

    public void setAdministrativoID(int administrativoID) {
        this.administrativoID = administrativoID;
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
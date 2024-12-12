package triage.model;

import jakarta.persistence.*;

import java.util.Date;

@Entity
public class Medico {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int medicoID;

    @ManyToOne
    @JoinColumn(name = "personalID", referencedColumnName = "personalID")
    private PersonalSanitario personalSanitario;

    private String especialidad;
    private String correoElectronico;
    private String telefono;
    private String contrasena;

    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaRegistro = new Date();

    // Getters y Setters
    public int getMedicoID() {
        return medicoID;
    }

    public void setMedicoID(int medicoID) {
        this.medicoID = medicoID;
    }

    public PersonalSanitario getPersonalSanitario() {
        return personalSanitario;
    }

    public void setPersonalSanitario(PersonalSanitario personalSanitario) {
        this.personalSanitario = personalSanitario;
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

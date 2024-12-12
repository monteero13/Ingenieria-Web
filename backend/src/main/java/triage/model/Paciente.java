package triage.model;

import jakarta.persistence.*;

import java.util.Date;

@Entity
public class Paciente {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int pacienteID;

    private String numeroTarjetaSanitaria;
    private String nombre;
    private int edad;
    private String sintomas;
    private String antecedentes;
    private String nivelUrgencia;

    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaRegistro = new Date();

    @ManyToOne
    @JoinColumn(name = "personalID", referencedColumnName = "personalID")
    private PersonalSanitario personalSanitario;

    // Getters y Setters
    public int getPacienteID() {
        return pacienteID;
    }

    public void setPacienteID(int pacienteID) {
        this.pacienteID = pacienteID;
    }

    public String getNumeroTarjetaSanitaria() {
        return numeroTarjetaSanitaria;
    }

    public void setNumeroTarjetaSanitaria(String numeroTarjetaSanitaria) {
        this.numeroTarjetaSanitaria = numeroTarjetaSanitaria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getSintomas() {
        return sintomas;
    }

    public void setSintomas(String sintomas) {
        this.sintomas = sintomas;
    }

    public String getAntecedentes() {
        return antecedentes;
    }

    public void setAntecedentes(String antecedentes) {
        this.antecedentes = antecedentes;
    }

    public String getNivelUrgencia() {
        return nivelUrgencia;
    }

    public void setNivelUrgencia(String nivelUrgencia) {
        this.nivelUrgencia = nivelUrgencia;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public PersonalSanitario getPersonalSanitario() {
        return personalSanitario;
    }

    public void setPersonalSanitario(PersonalSanitario personalSanitario) {
        this.personalSanitario = personalSanitario;
    }
}

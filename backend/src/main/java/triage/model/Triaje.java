package triage.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
public class Triaje {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int triajeID;

    @ManyToOne
    @JoinColumn(name = "pacienteID", referencedColumnName = "pacienteID")
    private Paciente paciente;

    @ManyToOne
    @JoinColumn(name = "personalID", referencedColumnName = "personalID")
    private PersonalSanitario personalSanitario;

    private double temperatura;
    private String presionArterial;
    private int latidosPorMinuto;
    private int dolorEVA;  // Escala Visual Analógica (0-10)
    private int prioridad;
    private String estado; // Ejemplo: En espera, Atendido, Urgente, Crítico

    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaTriaje = new Date();

    // Getters y Setters
    public int getTriajeID() {
        return triajeID;
    }

    public void setTriajeID(int triajeID) {
        this.triajeID = triajeID;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }

    public PersonalSanitario getPersonalSanitario() {
        return personalSanitario;
    }

    public void setPersonalSanitario(PersonalSanitario personalSanitario) {
        this.personalSanitario = personalSanitario;
    }

    public double getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(double temperatura) {
        this.temperatura = temperatura;
    }

    public String getPresionArterial() {
        return presionArterial;
    }

    public void setPresionArterial(String presionArterial) {
        this.presionArterial = presionArterial;
    }

    public int getLatidosPorMinuto() {
        return latidosPorMinuto;
    }

    public void setLatidosPorMinuto(int latidosPorMinuto) {
        this.latidosPorMinuto = latidosPorMinuto;
    }

    public int getDolorEVA() {
        return dolorEVA;
    }

    public void setDolorEVA(int dolorEVA) {
        this.dolorEVA = dolorEVA;
    }

    public int getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(int prioridad) {
        this.prioridad = prioridad;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Date getFechaTriaje() {
        return fechaTriaje;
    }

    public void setFechaTriaje(Date fechaTriaje) {
        this.fechaTriaje = fechaTriaje;
    }
}

package triage.model;

import jakarta.persistence.*;

@Entity
public class Login {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int loginID;

    private String correoElectronico;
    private String contrasena;
    private String rol; // Ejemplo: Administrador, PersonalSanitario, Medico, etc.

    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date fechaLogin = new java.util.Date();

    // Getters y Setters
    public int getLoginID() {
        return loginID;
    }

    public void setLoginID(int loginID) {
        this.loginID = loginID;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public java.util.Date getFechaLogin() {
        return fechaLogin;
    }

    public void setFechaLogin(java.util.Date fechaLogin) {
        this.fechaLogin = fechaLogin;
    }

    public boolean isPresent() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'isPresent'");
    }

    
}
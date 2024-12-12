package triage.service;

import triage.model.Login;
import triage.repository.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LoginService {

    @Autowired
    private LoginRepository loginRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder; // Inyectamos el BCryptPasswordEncoder

    // Guardar Login
    public Login saveLogin(Login login) {
        // Codificar la contraseña antes de guardarla
        login.setContrasena(passwordEncoder.encode(login.getContrasena()));
        return loginRepository.save(login);
    }

    // Obtener todos los logins
    public List<Login> getAllLogins() {
        return loginRepository.findAll();
    }

    // Obtener un Login por ID
    public Optional<Login> getLoginById(int id) {
        return loginRepository.findById(id);
    }

    // Actualizar un Login
    public Login updateLogin(int id, Login login) {
        if (loginRepository.existsById(id)) {
            login.setLoginID(id);
            return loginRepository.save(login);
        }
        return null;
    }

    // Eliminar un Login
    public void deleteLogin(int id) {
        loginRepository.deleteById(id);
    }

    // Método para autenticar al usuario
    public Login authenticateUser(Login login) {
        // Buscar el Login por correo electrónico
        Optional<Login> existingLogin = loginRepository.findByCorreoElectronico(login.getCorreoElectronico());

        if (existingLogin.isPresent()) {
            Login foundLogin = existingLogin.get();

            // Verificamos si las contraseñas coinciden usando BCrypt
            if (passwordEncoder.matches(login.getContrasena(), foundLogin.getContrasena())) {
                return foundLogin;  // Devolver el Login encontrado si las contraseñas coinciden
            } else {
                throw new IllegalArgumentException("Credenciales incorrectas");
            }
        } else {
            throw new IllegalArgumentException("Usuario no encontrado");
        }
    }
}

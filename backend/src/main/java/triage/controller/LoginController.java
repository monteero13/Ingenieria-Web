package triage.controller;

import triage.model.Login;
import triage.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/login")
public class LoginController {

    @Autowired
    private LoginService loginService;

    // Método de login
    @PostMapping
    public ResponseEntity<Login> login(@RequestBody Login login) {
        try {
            Login authenticatedLogin = loginService.authenticateUser(login);
            return new ResponseEntity<>(authenticatedLogin, HttpStatus.OK);
        } catch (IllegalArgumentException e) {
            // Si las credenciales no son correctas, respondemos con un error 401 (Unauthorized)
            return new ResponseEntity<>(null, HttpStatus.UNAUTHORIZED);
        }
    }
}

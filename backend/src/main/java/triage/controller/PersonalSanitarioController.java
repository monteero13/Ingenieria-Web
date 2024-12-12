package triage.controller;

import triage.model.PersonalSanitario;
import triage.service.PersonalSanitarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/personalSanitario")
public class PersonalSanitarioController {

    @Autowired
    private PersonalSanitarioService personalSanitarioService;

    // Crear un nuevo personal sanitario
    @PostMapping
    public PersonalSanitario createPersonalSanitario(@RequestBody PersonalSanitario personalSanitario) {
        return personalSanitarioService.savePersonalSanitario(personalSanitario);
    }

    // Obtener todos los registros de personal sanitario
    @GetMapping
    public List<PersonalSanitario> getAllPersonalSanitario() {
        return personalSanitarioService.getAllPersonalSanitario();
    }

    // Obtener un personal sanitario por ID
    @GetMapping("/{id}")
    public Optional<PersonalSanitario> getPersonalSanitarioById(@PathVariable("id") int id) {
        return personalSanitarioService.getPersonalSanitarioById(id);
    }

    // Actualizar un personal sanitario
    @PutMapping("/{id}")
    public PersonalSanitario updatePersonalSanitario(@PathVariable("id") int id, @RequestBody PersonalSanitario personalSanitario) {
        return personalSanitarioService.updatePersonalSanitario(id, personalSanitario);
    }

    // Eliminar un personal sanitario
    @DeleteMapping("/{id}")
    public void deletePersonalSanitario(@PathVariable("id") int id) {
        personalSanitarioService.deletePersonalSanitario(id);
    }
}

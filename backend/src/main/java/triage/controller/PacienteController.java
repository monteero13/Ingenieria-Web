package triage.controller;

import triage.model.Paciente;
import triage.service.PacienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/pacientes")
public class PacienteController {

    @Autowired
    private PacienteService pacienteService;

    // Crear un nuevo paciente
    @PostMapping
    public Paciente createPaciente(@RequestBody Paciente paciente) {
        return pacienteService.savePaciente(paciente);
    }

    // Obtener todos los pacientes
    @GetMapping
    public List<Paciente> getAllPacientes() {
        return pacienteService.getAllPacientes();
    }

    // Obtener un paciente por ID
    @GetMapping("/{id}")
    public Optional<Paciente> getPacienteById(@PathVariable("id") int id) {
        return pacienteService.getPacienteById(id);
    }

    // Actualizar un paciente
    @PutMapping("/{id}")
    public Paciente updatePaciente(@PathVariable("id") int id, @RequestBody Paciente paciente) {
        return pacienteService.updatePaciente(id, paciente);
    }

    // Eliminar un paciente
    @DeleteMapping("/{id}")
    public void deletePaciente(@PathVariable("id") int id) {
        pacienteService.deletePaciente(id);
    }
}

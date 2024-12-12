package triage.controller;

import triage.model.Medico;
import triage.service.MedicoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/medicos")
public class MedicoController {

    @Autowired
    private MedicoService medicoService;

    // Crear un nuevo médico
    @PostMapping
    public Medico createMedico(@RequestBody Medico medico) {
        return medicoService.saveMedico(medico);
    }

    // Obtener todos los médicos
    @GetMapping
    public List<Medico> getAllMedicos() {
        return medicoService.getAllMedicos();
    }

    // Obtener un médico por ID
    @GetMapping("/{id}")
    public Optional<Medico> getMedicoById(@PathVariable("id") int id) {
        return medicoService.getMedicoById(id);
    }

    // Actualizar un médico
    @PutMapping("/{id}")
    public Medico updateMedico(@PathVariable("id") int id, @RequestBody Medico medico) {
        return medicoService.updateMedico(id, medico);
    }

    // Eliminar un médico
    @DeleteMapping("/{id}")
    public void deleteMedico(@PathVariable("id") int id) {
        medicoService.deleteMedico(id);
    }
}
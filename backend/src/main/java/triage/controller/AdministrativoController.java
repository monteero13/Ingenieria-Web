package triage.controller;

import triage.model.Administrativo;
import triage.service.AdministrativoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/administrativos")
public class AdministrativoController {

    @Autowired
    private AdministrativoService administrativoService;

    // Crear un nuevo administrativo
    @PostMapping
    public Administrativo createAdministrativo(@RequestBody Administrativo administrativo) {
        return administrativoService.saveAdministrativo(administrativo);
    }

    // Obtener todos los administrativos
    @GetMapping
    public List<Administrativo> getAllAdministrativos() {
        return administrativoService.getAllAdministrativos();
    }

    // Obtener un administrativo por ID
    @GetMapping("/{id}")
    public Optional<Administrativo> getAdministrativoById(@PathVariable("id") int id) {
        return administrativoService.getAdministrativoById(id);
    }

    // Actualizar un administrativo
    @PutMapping("/{id}")
    public Administrativo updateAdministrativo(@PathVariable("id") int id, @RequestBody Administrativo administrativo) {
        return administrativoService.updateAdministrativo(id, administrativo);
    }

    // Eliminar un administrativo
    @DeleteMapping("/{id}")
    public void deleteAdministrativo(@PathVariable("id") int id) {
        administrativoService.deleteAdministrativo(id);
    }
}
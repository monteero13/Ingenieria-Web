package triage.controller;

import triage.model.Triaje;
import triage.service.TriajeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/triajes")
public class TriajeController {

    @Autowired
    private TriajeService triajeService;

    // Crear un nuevo triaje
    @PostMapping
    public Triaje createTriaje(@RequestBody Triaje triaje) {
        return triajeService.saveTriaje(triaje);
    }

    // Obtener todos los triajes
    @GetMapping
    public List<Triaje> getAllTriajes() {
        return triajeService.getAllTriajes();
    }

    // Obtener un triaje por ID
    @GetMapping("/{id}")
    public Optional<Triaje> getTriajeById(@PathVariable("id") int id) {
        return triajeService.getTriajeById(id);
    }

    // Actualizar un triaje
    @PutMapping("/{id}")
    public Triaje updateTriaje(@PathVariable("id") int id, @RequestBody Triaje triaje) {
        return triajeService.updateTriaje(id, triaje);
    }

    // Eliminar un triaje
    @DeleteMapping("/{id}")
    public void deleteTriaje(@PathVariable("id") int id) {
        triajeService.deleteTriaje(id);
    }
}


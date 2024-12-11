package backend.src.main.java.triage.controller;

import com.example.triage.model.Patient;
import com.example.triage.service.PatientService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/patients")
@CrossOrigin(origins = "http://localhost:4200")
public class PatientController {

    private final PatientService service;

    public PatientController(PatientService service) {
        this.service = service;
    }

    @GetMapping
    public List<Patient> getPatients() {
        return service.getAllPatients();
    }

    @PostMapping
    public Patient addPatient(@RequestBody Patient patient) {
        return service.savePatient(patient);
    }

    @DeleteMapping("/{id}")
    public void deletePatient(@PathVariable Long id) {
        service.deletePatient(id);
    }
}

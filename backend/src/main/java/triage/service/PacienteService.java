package triage.service;

import triage.model.Paciente;
import triage.repository.PacienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PacienteService {

    @Autowired
    private PacienteRepository pacienteRepository;

    public Paciente savePaciente(Paciente paciente) {
        return pacienteRepository.save(paciente);
    }

    public List<Paciente> getAllPacientes() {
        return pacienteRepository.findAll();
    }

    public Optional<Paciente> getPacienteById(int id) {
        return pacienteRepository.findById(id);
    }

    public Paciente updatePaciente(int id, Paciente paciente) {
        if (pacienteRepository.existsById(id)) {
            paciente.setPacienteID(id);
            return pacienteRepository.save(paciente);
        }
        return null;
    }

    public void deletePaciente(int id) {
        pacienteRepository.deleteById(id);
    }
}
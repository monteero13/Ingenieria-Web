package triage.service;

import triage.model.Medico;
import triage.repository.MedicoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MedicoService {

    @Autowired
    private MedicoRepository medicoRepository;

    public Medico saveMedico(Medico medico) {
        return medicoRepository.save(medico);
    }

    public List<Medico> getAllMedicos() {
        return medicoRepository.findAll();
    }

    public Optional<Medico> getMedicoById(int id) {
        return medicoRepository.findById(id);
    }

    public Medico updateMedico(int id, Medico medico) {
        if (medicoRepository.existsById(id)) {
            medico.setMedicoID(id);
            return medicoRepository.save(medico);
        }
        return null;
    }

    public void deleteMedico(int id) {
        medicoRepository.deleteById(id);
    }
}

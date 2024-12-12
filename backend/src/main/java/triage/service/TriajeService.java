package triage.service;

import triage.model.Triaje;
import triage.repository.TriajeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TriajeService {

    @Autowired
    private TriajeRepository triajeRepository;

    public Triaje saveTriaje(Triaje triaje) {
        return triajeRepository.save(triaje);
    }

    public List<Triaje> getAllTriajes() {
        return triajeRepository.findAll();
    }

    public Optional<Triaje> getTriajeById(int id) {
        return triajeRepository.findById(id);
    }

    public Triaje updateTriaje(int id, Triaje triaje) {
        if (triajeRepository.existsById(id)) {
            triaje.setTriajeID(id);
            return triajeRepository.save(triaje);
        }
        return null;
    }

    public void deleteTriaje(int id) {
        triajeRepository.deleteById(id);
    }
}

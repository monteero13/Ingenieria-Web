package triage.service;


import triage.model.PersonalSanitario;
import triage.repository.PersonalSanitarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PersonalSanitarioService {

    @Autowired
    private PersonalSanitarioRepository personalSanitarioRepository;

    public PersonalSanitario savePersonalSanitario(PersonalSanitario personalSanitario) {
        return personalSanitarioRepository.save(personalSanitario);
    }

    public List<PersonalSanitario> getAllPersonalSanitario() {
        return personalSanitarioRepository.findAll();
    }

    public Optional<PersonalSanitario> getPersonalSanitarioById(int id) {
        return personalSanitarioRepository.findById(id);
    }

    public PersonalSanitario updatePersonalSanitario(int id, PersonalSanitario personalSanitario) {
        if (personalSanitarioRepository.existsById(id)) {
            personalSanitario.setPersonalID(id);
            return personalSanitarioRepository.save(personalSanitario);
        }
        return null;
    }

    public void deletePersonalSanitario(int id) {
        personalSanitarioRepository.deleteById(id);
    }
}

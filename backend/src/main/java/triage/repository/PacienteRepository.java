package triage.repository;

import triage.model.Paciente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PacienteRepository extends JpaRepository<Paciente, Integer> {

    // Método adicional para encontrar un Paciente por su número de tarjeta sanitaria
    Paciente findByNumeroTarjetaSanitaria(String numeroTarjetaSanitaria);
}

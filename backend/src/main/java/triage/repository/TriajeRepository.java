package triage.repository;

import triage.model.Triaje;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TriajeRepository extends JpaRepository<Triaje, Integer> {

    // Método adicional para obtener los Triajes por prioridad
    List<Triaje> findByPrioridad(int prioridad);

    // Método adicional para obtener los Triajes de un paciente específico
    List<Triaje> findByPaciente_PacienteID(int pacienteID);
}
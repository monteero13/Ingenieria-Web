package triage.repository;

import triage.model.Administrativo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdministrativoRepository extends JpaRepository<Administrativo, Integer> {

    // Método adicional para buscar un administrativo por su correo electrónico
    Administrativo findByCorreoElectronico(String correoElectronico);
}
package triage.repository;

import triage.model.Login;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginRepository extends JpaRepository<Login, Integer> {

    // Método adicional para encontrar un Login por correo electrónico
    Optional<Login> findByCorreoElectronico(String correoElectronico);  // Búsqueda por correo electrónico
}
package triage.repository;

import triage.model.PersonalSanitario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PersonalSanitarioRepository extends JpaRepository<PersonalSanitario, Integer> {
}
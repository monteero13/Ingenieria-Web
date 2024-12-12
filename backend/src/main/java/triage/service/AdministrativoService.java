package triage.service;

import triage.model.Administrativo;
import triage.repository.AdministrativoRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AdministrativoService {

    private final AdministrativoRepository administrativoRepository;

    public AdministrativoService(AdministrativoRepository administrativoRepository) {
        this.administrativoRepository = administrativoRepository;
    }

    // Método para obtener todos los administrativos
    public List<Administrativo> getAllAdministrativos() {
        return administrativoRepository.findAll();
    }

    // Método para obtener un administrativo por su ID
    public Optional<Administrativo> getAdministrativoById(int id) {
        return administrativoRepository.findById(id);
    }

    // Método para guardar o actualizar un administrativo
    public Administrativo saveAdministrativo(Administrativo administrativo) {
        return administrativoRepository.save(administrativo);
    }

    // Método para eliminar un administrativo por su ID
    public void deleteAdministrativo(int id) {
        administrativoRepository.deleteById(id);
    }

    // Método para buscar un administrativo por correo electrónico
    public Administrativo getAdministrativoByCorreo(String correoElectronico) {
        return administrativoRepository.findByCorreoElectronico(correoElectronico);
    }

    // Método para actualizar un administrativo
    public Administrativo updateAdministrativo(int id, Administrativo administrativo) {
        // Buscar el administrativo por el ID
        Optional<Administrativo> existingAdministrativo = administrativoRepository.findById(id);

        if (existingAdministrativo.isPresent()) {
            Administrativo existing = existingAdministrativo.get();

            // Actualizar los campos del administrativo con los nuevos valores
            existing.setNombre(administrativo.getNombre());
            existing.setCargo(administrativo.getCargo());
            existing.setCorreoElectronico(administrativo.getCorreoElectronico());
            existing.setTelefono(administrativo.getTelefono());
            existing.setContrasena(administrativo.getContrasena());
            existing.setFechaRegistro(administrativo.getFechaRegistro());  // No es necesario actualizar si no quieres cambiarlo

            // Guardar los cambios
            return administrativoRepository.save(existing);
        } else {
            // Si no se encuentra el administrativo, puedes devolver null o lanzar una excepción
            return null;  // O lanzar una excepción personalizada si prefieres manejarlo así
        }
    }
}

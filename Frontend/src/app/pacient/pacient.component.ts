import { Component } from '@angular/core';

@Component({
  selector: 'app-pacient',
  templateUrl: './pacient.component.html',
})
export class PacientComponent {
  paciente = {
    idpaciente: '',
    nombre: '',
    edad: null,
    prioridad: 'baja', // Valor por defecto
    estadoAtencion: 'en espera', // Valor por defecto
    tiempoEspera: null,
    departamentoAsignado: '',
    sintomas: '',
    tratamiento: ''
  };

  registrarPaciente() {
    console.log(this.paciente); // Verifica que los datos estén bien almacenados
    // Aquí iría la lógica para registrar al paciente, como una llamada a un servicio para guardarlo en la base de datos
  }
}

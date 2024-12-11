import { Component, OnInit } from '@angular/core';
import { PatientService } from './patient.service';
import { Patient } from './patient.model';

@Component({
  selector: 'app-patient-list',
  templateUrl: './patient-list.component.html',
})
export class PatientListComponent implements OnInit {
  patients: Patient[] = [];

  constructor(private patientService: PatientService) {}

  ngOnInit(): void {
    this.patientService.getPatients().subscribe(data => {
      this.patients = data;
    });
  }

  deletePatient(id: number): void {
    this.patientService.deletePatient(id).subscribe(() => {
      this.patients = this.patients.filter(patient => patient.id !== id);
    });
  }
}

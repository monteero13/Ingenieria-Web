import { Component } from '@angular/core';
import { User } from '@app/_models';
import { AccountService } from '@app/_services';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']  // Asegúrate de importar correctamente el archivo CSS
})
export class HomeComponent {
  user: User | null;

  constructor(private accountService: AccountService) {
    // Obtiene el valor del usuario autenticado
    this.user = this.accountService.userValue;
  }

  // Método para cerrar sesión (si es necesario)
  logout() {
    this.accountService.logout();
  }
}

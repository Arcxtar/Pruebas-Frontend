import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NavbarComponent } from './navbar/navbar.component';
import { DashboardRoutingModule } from './dashboard-routing.module';
import { SharedModule } from '../shared/shared.module';
import { DashboardComponent } from './dashboard.component';
import { ListarUsuariosComponent } from './users/listar-usuarios/listar-usuarios.component';
import { CrearUsuarioComponent } from './users/crear-usuario/crear-usuario.component';
import { MatTableModule } from '@angular/material/table';
import { MatSortModule } from '@angular/material/sort';
import { MatInputModule } from '@angular/material/input';
import { DialogEliminarComponent } from './dialog-eliminar/dialog-eliminar.component';
import { BienvenidaComponent } from './bienvenida/bienvenida.component';
import { PerfilRhComponent } from './users/perfil-rh/perfil-rh.component';
import { NgxChartsModule } from '@swimlane/ngx-charts';




@NgModule({
  declarations: [
    DashboardComponent,
    NavbarComponent,
    ListarUsuariosComponent,
    CrearUsuarioComponent,
    DialogEliminarComponent,
    BienvenidaComponent,
    PerfilRhComponent,
  ],
  imports: [
    CommonModule,
    DashboardRoutingModule,
    SharedModule,
    MatTableModule,
    MatSortModule,
    MatInputModule,
    NgxChartsModule
  ]
})
export class DashboardModule { }

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { DashboardComponent } from './dashboard.component';
import { ListarUsuariosComponent } from './users/listar-usuarios/listar-usuarios.component';
import { CrearUsuarioComponent } from './users/crear-usuario/crear-usuario.component';
import { AuthChildGuard } from '../../utils/auth-child.guard';
import { BienvenidaComponent } from './bienvenida/bienvenida.component';
import { PerfilRhComponent } from './users/perfil-rh/perfil-rh.component';


const routes: Routes = [
  { path: '', component: DashboardComponent,canActivateChild:[AuthChildGuard],children: [
    { path: 'usuarios', component: ListarUsuariosComponent },
    { path: 'bienvenida', component: BienvenidaComponent },
    { path: 'crear-usuario', component: CrearUsuarioComponent },
    { path: 'ver-usuario/:ID', component: CrearUsuarioComponent },
    { path: 'perfil', component: PerfilRhComponent }
  ] },
];

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    RouterModule.forChild(routes)
  ],
  exports: [RouterModule]
})
export class DashboardRoutingModule { }

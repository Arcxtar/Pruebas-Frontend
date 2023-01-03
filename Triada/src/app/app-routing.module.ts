import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Componentes
import { LoginComponent } from './components/login/login.component';
import { SignInComponent } from './components/sign-in/sign-in.component';
import { InicioComponent } from './components/inicio/inicio.component';
import { CuestionarioComponent } from './components/cuestionario/cuestionario.component';

// Guards
import { AuthGuard } from './utils/auth.guard';
import { AuthChildGuard } from './utils/auth-child.guard';


const routes: Routes = [
  { path: '', redirectTo: 'inicio', pathMatch: 'full' },
  { path: 'inicio', component: InicioComponent},//comentar
  { path: 'cuestionario', component: CuestionarioComponent}, //comentar
  { path: 'login', component: LoginComponent },
  { path: 'signIn', component: SignInComponent },
  { path: 'dashboard', loadChildren: () => import('./components/dashboard/dashboard.module').then(x => x.DashboardModule),canActivateChild:[AuthChildGuard]},//component: DashboardComponent},//, canActivate: [AuthGuard] },
  { path: '**', redirectTo: 'inicio', pathMatch: 'full' }
]
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

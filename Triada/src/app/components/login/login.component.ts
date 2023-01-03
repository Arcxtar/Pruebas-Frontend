import { HttpErrorResponse } from '@angular/common/http';
import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { ErrorService } from 'src/app/services/error.service';
import { UserService } from 'src/app/services/user.service';
import { RHService } from '../../services/rh.service';
import { LoginDashboardService } from '../../services/login-dashboard.service';
import { UsuarioRH } from '../../interfaces/UsuarioRh'

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  @Input() ID:number=0;
  Nombre: string = '';
  A_Paterno: string = '';
  A_Materno: string = '';
  Empresa: string = '';
  Genero: string ='';
  Fecha_nac: string = '';
  Correo: string = '';
  Contrasena: string = '';
  loading: boolean = false;
  public usuarios = Array<UsuarioRH>;

  constructor(
    private toastr: ToastrService,
    private userService: UserService,
    private router: Router,
    private errorService: ErrorService,
    private RHService: RHService,
    private LD: LoginDashboardService) {
      /*
      this.RHService.getUserRHID(13).subscribe((res:UsuarioRH)=>{
        console.log(res)
      })*/
    }

  ngOnInit(): void {
  }

  login() {

    // Validamos que el usuario ingrese datos
    if (this.Correo == '' || this.Contrasena == '') {
      this.toastr.error('Todos los campos son obligatorios', 'Error');
      return
    }

    const user: UsuarioRH = {
      Nombre: this.Nombre,
      A_Paterno: this.A_Paterno,
      A_Materno: this.A_Materno,
      Genero: this.Genero,
      Empresa: this.Empresa,
      Fecha_nac: this.Fecha_nac,
      Correo: this.Correo,
      Contrasena: this.Contrasena
    }

    // Creamos el body

    this.loading = true;
    this.RHService.login(user).subscribe({
      next: (res) => {
        localStorage.setItem('token', res.Token);
        this.ID = res.ID
        this.LD.ID.emit(this.ID)
        this.LD.setID$(this.ID)
        localStorage.setItem("ID",this.ID.toString())
        this.router.navigate(['/dashboard'])
      },
      error: (e: HttpErrorResponse) => {
        this.errorService.msjError(e);
        this.loading = false
      }
    })
  }
  home(){
    this.router.navigate(['/inicio'])
  }

}{}

import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UsuarioRH } from 'src/app/interfaces/UsuarioRh';
import { ErrorService } from 'src/app/services/error.service';
import { UserService } from 'src/app/services/user.service';
import { RHService } from '../../services/rh.service'
import {Respuesta} from '../../interfaces/Respuesta'
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.css']
})

export class SignInComponent implements OnInit {
  password: string='';
  confirmPassword: string = '';
  Nombre: string = '';
  A_Paterno: string = '';
  A_Materno: string = '';
  Genero: string = '';
  Empresa: string = '';
  Fecha_nac: string = '';
  Correo: string = '';

  constructor(private toastr: ToastrService,
    private _userService: UserService,
    private router: Router,
    private _errorService: ErrorService,
    private RHServise: RHService) { }

  ngOnInit(): void {
  }

  addUser() {
    var EMAIL_REGEX = /^[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/
    let PASS_REGEX = /^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$/

    // Validamos que el usuario ingrese valores
    if (this.Nombre == '' || this.password == '' || this.confirmPassword == '' || this.A_Paterno == '' ||
        this.Genero == '' || this.Empresa == '' || this.Fecha_nac == '' || this.Correo == ''){  // || this.A_Materno == ''
        this.toastr.error('Todos los campos son obligatorios', 'Error');
        return;
    }
    if(!this.Correo.match(EMAIL_REGEX)){
      this.toastr.error('Correo no valido', 'Error');
      return;
    }
    /* if(!this.password.match(PASS_REGEX)){
      this.toastr.error('Contraseña insegura', 'Error');
      return;
    } */
      // Validamos que las password sean iguales
    if (this.password != this.confirmPassword) {
      this.toastr.error('Las passwords ingresadas son distintas', 'Error');
      return;
    }

    // Creamos el objeto
    const usuario : UsuarioRH = {
      Nombre:   this.Nombre,
      A_Paterno:  this.A_Paterno,
      A_Materno:  this.A_Materno,
      Genero:     this.Genero,
      Empresa:    this.Empresa,
      Fecha_nac:  this.Fecha_nac,
      Correo:     this.Correo,
      Contrasena: this.password,
    }
    console.log(usuario)
    this.RHServise.postUserRH(usuario).subscribe((res:Respuesta)=>{
      if(res.Estado){
        this.toastr.success(res.Mensaje, 'Listo');
        this.toastr.success(`El usuario ${this.Nombre} fue registrado con exito`, 'Usuario registrado');
      }
      else{
        this.toastr.error(res.Mensaje, 'Error');
      }
    })
  }

  home(){
    this.router.navigate(['/inicio'])
  }
}

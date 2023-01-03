import { Component, Input, OnInit ,AfterViewChecked} from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { DateAdapter } from '@angular/material/core';
import { ActivatedRoute } from '@angular/router';
import { UsuarioRH } from 'src/app/interfaces/UsuarioRh';
import { RHService } from '../../../../services/rh.service';

@Component({
  selector: 'app-perfil-rh',
  templateUrl: './perfil-rh.component.html',
  styleUrls: ['./perfil-rh.component.css']
})
export class PerfilRhComponent implements OnInit {
  loading: boolean = false;
  maxDate: Date;
  public usuarios = Array<UsuarioRH>;
  rhForm: FormGroup;
  G:String="";
  img:String="PX2.png";
  C:String="";
  Code:String="";
  constructor(private RHService: RHService,
              private fb: FormBuilder,
              private aRouter: ActivatedRoute,
              private dateAdapter: DateAdapter<any>) {
    this.maxDate = new Date();    
    //this.ID = Number(aRouter.snapshot.paramMap.get('ID'))
    this.dateAdapter.setLocale('es');    
    this.rhForm = this.fb.group({
      Nombre: [''],
      A_Paterno: [''],
      A_Materno: [''],
      Fecha_nac: [''],
      Genero: [''],
      Correo: [''],
      Empresa: ['']
    })        
  }

  ngOnInit(): void {
    this.getUsuarioRH();
  }
  ngAfterViewChecked(): void {
    if(this.G == "F"){
      this.img = "PF2.png"
    }
    if(this.G == "M"){
      this.img = "PM2.png"
    }
  }
  getUsuarioRH() {
    this.RHService.getUserRHID(Number((localStorage.getItem("ID")))).subscribe((data:UsuarioRH) =>{
      const date = new Date(data.Fecha_nac).getFullYear()
      const date2 = new Date().getFullYear()
      this.rhForm.setValue({
        Nombre: data.Nombre,
        A_Paterno: data.A_Paterno,
        A_Materno: data.A_Materno,
        Fecha_nac: date2-date,
        Genero: data.Genero,
        Correo: data.Correo,
        Empresa: data.Empresa,
      })
      this.G = data.Genero
      this.C = data.A_Paterno[0] + data.A_Paterno[1] + data.A_Paterno[2] + data.A_Materno[0] + data.A_Materno[1] + data.Nombre[0] + "TD0" + localStorage.getItem("ID")
      this.Code = this.C.toUpperCase()
    }) 
  }
}

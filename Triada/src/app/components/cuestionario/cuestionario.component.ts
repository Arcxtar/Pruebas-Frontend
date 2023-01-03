import { AfterViewInit, Component, OnInit } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { Candidato } from 'src/app/interfaces/candidato';
import { Cuestionario } from 'src/app/interfaces/cuestionario';
import { Preguntas } from 'src/app/interfaces/preguntas';
import { CuestionarioService } from 'src/app/services/cuestionario.service';
import { PreguntasService } from 'src/app/services/preguntas.service';
import { HttpClient } from '@angular/common/http';
import { DateAdapter } from '@angular/material/core';
import { Transaccion } from '../../interfaces/Transaccion'
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-cuestionario',
  templateUrl: './cuestionario.component.html',
  styleUrls: ['./cuestionario.component.css']
})
export class CuestionarioComponent implements OnInit, AfterViewInit {
  Genero: string[] = ['M', 'F', 'X'];
  Codigo: string[] = ['MDA045TD01','MGM357TD02','EOC984TD03','OFC235TD04','NMA156TD05'];
  Opcion: any = ['V','F'];
  disabled: boolean = true;

  displayedColumns: string[] = ['#', 'Pregunta']; 
  dataSource:MatTableDataSource<Cuestionario>
  list:Cuestionario[] = [];
  maxDate: Date;
  cuestionarioForm: FormGroup;

  test: Preguntas[] = [];
  preguntas: string[] = [];
  preview: string = '';


  constructor(private fb: FormBuilder,
              private fb2: FormBuilder,
              private router:Router,
              private dateAdapter: DateAdapter<any>,
              private http: HttpClient,
              private toastr: ToastrService,
              private _preguntasService: PreguntasService,
              private Cuestionario:CuestionarioService) {
      this.dataSource = new MatTableDataSource(); 
      this.maxDate = new Date();
      this.dateAdapter.setLocale('es');
      this.cuestionarioForm = this.fb.group({
        Nombre: ['', [Validators.required, Validators.maxLength(30)]],
        A_Paterno: ['', Validators.required],
        A_Materno: ['', Validators.required],
        Genero: ['', Validators.required],
        Fecha_nac: ['', Validators.required],
        Correo: ['', [Validators.required,  Validators.email]],
        Codigo:['', Validators.required],
        'direcciones': this.fb.array([
        ])
      })      
    this.obtenerPreguntas();
  }

  changeOpcion(e:any){
    /* this.direcciones?.setValue(e.target.value,{
      onlySelf:true,
    }) */
    this.cuestionarioForm.patchValue(e.target.value,{
      onlySelf:true,
    })
  } 

  get direcciones(){
    return this.cuestionarioForm.get('direcciones') as FormArray
  }


  ngOnInit(): void {
    for(let i=1;i<91;i++){
      let x = "Pregunta #"+ i 
      this.preguntas.push(x)
    }
    for(let i=0;i<this.preguntas.length;i++){
      this.direcciones.push(this.fb.control('',Validators.required))
    }

    this.http.get<any>('./assets/data/cuestionario.json').subscribe(data =>{
/*       console.log(data); */
      this.test = data;
    })
  }

  ngAfterViewInit(): void {
  }

  obtenerPreguntas() {
    this.Cuestionario.getPreguntas().subscribe((res:Cuestionario[])=>{
      this.dataSource.data=res
    })
  
  }

  agregarCuestionario() {
    const candidato: Candidato = {
      Nombre: this.cuestionarioForm.value.Nombre,
      A_Paterno: this.cuestionarioForm.value.A_Paterno,
      A_Materno: this.cuestionarioForm.value.A_Materno,
      Fecha_nac: this.cuestionarioForm.value.Fecha_nac,
      Genero: this.cuestionarioForm.value.Genero,
      Correo: this.cuestionarioForm.value.Correo,
      Codigo: this.cuestionarioForm.value.Codigo
    }
    /* console.log(candidato) */
  }

  home(){
    localStorage.removeItem('token')
    this.router.navigate(['/inicio'])
  }
  save() {
    const codigoArray = this.cuestionarioForm.value.Codigo.split("TD0"); 
    Codigo:this.cuestionarioForm.value.Codigo = codigoArray[1];
    Number(codigoArray[1])
    /* console.log(codigoArray[1]) */
    const date = new Date(this.cuestionarioForm.value.Fecha_nac)
    let Fecha,anno,mes,dia;
    anno = date.getFullYear()
    mes = date.getMonth()+1
    dia = date.getDate()
    if (mes.toString().length < 2) 
        mes = '0' + mes;
    if (dia.toString().length < 2) 
        dia = '0' + dia;
    Fecha = anno+"/"+mes+"/"+dia
    
    let DP:Candidato={
      Nombre:this.cuestionarioForm.value.Nombre,
      A_Paterno:this.cuestionarioForm.value.A_Paterno,
      A_Materno:this.cuestionarioForm.value.A_Materno,
      Genero:this.cuestionarioForm.value.Genero,
      Fecha_nac:Fecha,
      Correo:this.cuestionarioForm.value.Correo,
      Codigo:this.cuestionarioForm.value.Codigo
    }
    let respuestas=[];
    for(let i=0;i < this.cuestionarioForm.value.direcciones.length;i++){
      if(this.cuestionarioForm.value.direcciones[i] == 'V'){
        respuestas.push(1);
      }
      if(this.cuestionarioForm.value.direcciones[i] == 'F'){
        respuestas.push(0);
      }
    }
    let T:Transaccion={
      Candidato:DP,
      Preguntas:respuestas
    }
    this.Cuestionario.postTransaccion(T).subscribe((res:any)=>{
      console.log(res)
    })
    window.location.reload()
  }

}

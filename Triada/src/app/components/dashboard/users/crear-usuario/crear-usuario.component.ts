import { AfterViewInit, Component, OnInit ,AfterViewChecked} from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Candidato } from 'src/app/interfaces/candidato';
import { HttpClient } from '@angular/common/http';
import { DateAdapter } from '@angular/material/core';
import { CandidateService } from 'src/app/services/candidate.service';
import {Interpretacion } from '../../../../interfaces/Interpretacion'
import { Verdaderos } from 'src/app/interfaces/verdaderos';

@Component({
  selector: 'app-crear-usuario',
  templateUrl: './crear-usuario.component.html',
  styleUrls: ['./crear-usuario.component.css']
})
export class CrearUsuarioComponent implements OnInit, AfterViewInit,AfterViewChecked{

  Genero: string[] = ['M', 'F', 'X'];
  Opcion: any = ['V','F'];
  maxDate: Date;
  cuestionarioForm: FormGroup;
  preview: string = '';
  inter2:string='';

  inter1:string='';
  inter3:string='';

  rasgo:string[]=["","",""]
  ID: number;
  G:String="";
  img:String="PX2.png";
  conteo: any[] = [];
  numbers: any[] = [];
  N: number = 0;
  M: number = 0
  P: number = 0;
  single: any[] = [];
  M1: Number[] = [3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51,54,57,60,63,66,69,72,75,78,81,84,87,90];
  N1: Number[] = [2,5,8,11,14,17,20,23,26,29,32,35,38,41,44,47,50,53,56,59,62,65,68,71,74,77,80,83,86,89]; 
  P1: Number[] = [1,4,7,10,13,16,19,22,25,28,31,34,37,40,43,46,49,52,55,58,61,64,67,70,73,76,79,82,85,88];

  view:[number,number] = [700,400];
  // options
  gradient: boolean = true;
  showLegend: boolean = false;
  showLabels: boolean = true;
  isDoughnut: boolean = false;
  legendPosition: string = 'below';

  constructor(private fb: FormBuilder,
              private fb2: FormBuilder,
              private router:Router,
              private Persona:CandidateService,
              private aRouter: ActivatedRoute,
              private dateAdapter: DateAdapter<any>,
              private http: HttpClient,) {
      this.maxDate = new Date();
      this.ID = Number(aRouter.snapshot.paramMap.get('ID'))
      this.dateAdapter.setLocale('es');
      this.cuestionarioForm = this.fb.group({
        Nombre: [''],
        A_Paterno: [''],
        A_Materno: [''],
        Genero: [''],
        Fecha_nac: [''],
        Correo: [''],
      })
  }

  ngOnInit(): void {
    this.getCandidato(this.ID);
  }

  ngAfterViewInit(): void {
    this.getRespuestasCandidato(this.ID);
    this.http.get<Interpretacion>('../../../../../assets/data/Interpretacion.json').subscribe((data:Interpretacion)=>{
      //MAQUIAVELISMO
      if(this.M<=10){
        this.rasgo[0] = data.Maquiavelismo[0]
      }
      if(this.M<=20 && this.M>=11){
        this.rasgo[0] = data.Maquiavelismo[1]
      }
      if(this.M<=30 && this.M>=21){
        this.rasgo[0] = data.Maquiavelismo[2]
      }
      //PSICOPATIA
      if(this.P<=10){
        this.rasgo[1] = data.Psicopatia[0]
      }
      if(this.P<=20 && this.P>=11){
        this.rasgo[1] = data.Psicopatia[1]
      }
      if(this.P<=30 && this.P>=21){
        this.rasgo[1] = data.Psicopatia[2]
      }
      //NARCISISMO
      if(this.N<=10){
        this.rasgo[2] = data.Narcisismo[0]
      }
      if(this.N<=20 && this.N>=11){
        this.rasgo[2] = data.Narcisismo[1]
      }
      if(this.N<=30 && this.N>=21){
        this.rasgo[2] = data.Narcisismo[2]
      }
      //const NE = 100
      this.single = [
        {
          name: 'Narcisismo',
          value: this.N
        },
        {
          name: 'Maquiavelismo',
          value: this.M
        },
        {
          name: 'Psicopatía',
          value: this.P
        },
        {
          name: 'No evaluado',
          value: 90 - this.P - this.M - this.N
        }
      ];
    }) 
  }

  ngAfterViewChecked(): void {
    if(this.G == "F"){
      this.img = "PF2.png"
    }
    if(this.G == "M"){
      this.img = "PM2.png"
    }
    this.inter1 = this.rasgo[0];
    this.inter2 = this.rasgo[1];
    this.inter3 = this.rasgo[2];
  }

  getCandidato(ID: Number) {
    this.Persona.getCandidato(ID).subscribe((data:Candidato) =>{
      const date = new Date(data.Fecha_nac).getFullYear()
      const date2 = new Date().getFullYear()
      this.cuestionarioForm.setValue({
        Nombre: data.Nombre,
        A_Paterno: data.A_Paterno,
        A_Materno: data.A_Materno,
        Fecha_nac: date2-date,
        Genero: data.Genero,
        Correo: data.Correo
      })
      this.G = data.Genero
    })
  } 

  getRespuestasCandidato(ID: Number) {
    this.Persona.getCuestionarioRespuestas(ID).subscribe((data:Verdaderos[]) =>{
      this.conteo = data;
      this.numbers = this.conteo.map(x => x.ID_Pregunta);

      const N2 = this.N1.filter(x => this.numbers.includes(x));
      const countN2 = N2.length;
      //console.log(countN2)

      const M2 = this.M1.filter(x => this.numbers.includes(x));
      const countM2 = M2.length;
      //console.log(countM2)

      const P2 = this.P1.filter(x => this.numbers.includes(x));
      const countP2 = P2.length;
      //console.log(countM2)
      this.N = countN2;
      this.M = countM2;
      this.P = countP2;
    }) 
  }

  home(){
    localStorage.removeItem('token')
    this.router.navigate(['/inicio'])
  }

  save() {
    console.log(this.cuestionarioForm.value)
  }

  randomIntFromInterval(min:number, max:number) { // min and max included 
    return Math.floor(Math.random() * (max - min + 1) + min)
  }
}







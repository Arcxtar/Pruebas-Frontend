import { NumberInput } from '@angular/cdk/coercion';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Candidato } from "../interfaces/candidato";
import { Cuestionario } from '../interfaces/cuestionario';
import { Respuesta } from '../interfaces/Respuesta';
import { Verdaderos } from '../interfaces/verdaderos';
@Injectable({
  providedIn: 'root'
})
export class CandidateService {

  url="http://localhost:3000/api"

  constructor(private http:HttpClient) { }



  getPersona(ID:Number):Observable<Candidato[]>{
    return this.http.get<Candidato[]>(this.url + "/persona/searchrh/"+ID)
  }

  deletePersona(ID_RH:Number,ID:Number){
    return this.http.delete<Respuesta>(this.url+"/persona/deleteRH/"+ID_RH+"/"+ID)
  }

  getCandidato(ID:Number):Observable<Candidato>{
    return this.http.get<Candidato>(this.url + "/persona/search/"+ID)
  }

  getCuestionarioRespuestas(ID:Number):Observable<Verdaderos[]>{
    return this.http.get<Verdaderos[]>(this.url + "/cuestionario/"+ID)
  }
}

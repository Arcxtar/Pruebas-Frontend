import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { Cuestionario } from '../interfaces/cuestionario';
import { Transaccion } from '../interfaces/Transaccion';
import { Respuesta } from '../interfaces/Respuesta';
import { Preguntas } from '../interfaces/preguntas';

@Injectable({
  providedIn: 'root'
})
export class CuestionarioService {

  url="http://localhost:3000/api"

  constructor(private http:HttpClient) { }

  getPreguntas():Observable<Cuestionario[]>{
    return this.http.get<Cuestionario[]>(this.url + "/cuestionario")
  }
  postTransaccion(user:Transaccion){
    return this.http.post(this.url+"/cuestionario/enviar",user)
  }
}

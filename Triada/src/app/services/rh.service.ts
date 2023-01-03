import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import {UsuarioRH} from '../interfaces/UsuarioRh'
import {Respuesta} from '../interfaces/Respuesta'
import {Validacion} from '../interfaces/Validacion'
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
@Injectable({
  providedIn: 'root'
})
export class RHService {


  url="http://localhost:3000/api"
  constructor(private http:HttpClient) { 
    
  }

  //get RH

  getUserRH(){
    return this.http.get<UsuarioRH[]>(this.url + "/userrh/all")
  }
  getUserRHID(ID:Number):Observable<UsuarioRH>{
    return this.http.get<UsuarioRH>(this.url+"/userrh/search/"+ID)
  }
  postUserRH(user:UsuarioRH){
    return this.http.post<Respuesta>(this.url+"/userrh/create",user)
  }
  login(user: UsuarioRH): Observable<Validacion>{
    return this.http.post<Validacion>(this.url+"/userrh/login", user)
  }
}

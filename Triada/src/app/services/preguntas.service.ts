import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Preguntas } from '../interfaces/preguntas';

@Injectable({
    providedIn: 'root'
})
export class PreguntasService {

    constructor(private http: HttpClient) { }

    getPreguntas(): Observable<Preguntas[]>{
        return this.http.get<Preguntas[]>('./assets/data/cuestionario.json')
    }
}
import { Injectable , Output,EventEmitter } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

const ID2:number=0

@Injectable({
  providedIn: 'root'
})
export class LoginDashboardService {
  private ID$ = new BehaviorSubject<number>(ID2);
  @Output() ID: EventEmitter<number> = new EventEmitter();
  constructor() { 
  }
  getID$():Observable<number>{
    return this.ID$.asObservable()
  }
  setID$(N:number):void{
    this.ID$.next(N)
  }
}

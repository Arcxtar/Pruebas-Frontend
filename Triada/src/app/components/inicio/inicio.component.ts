import { AfterViewInit, Component, OnChanges, OnInit, SimpleChanges, ViewChild } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.component.html',
  styleUrls: ['./inicio.component.css']
})
export class InicioComponent implements OnInit {

  constructor(
    private router:Router
  ) {
  }

  ngOnInit(): void {

  }

  cuestionario(){
    this.router.navigate(['/cuestionario'])
  }
  signin(){
    this.router.navigate(['/signIn'])
  }
  login(){
    this.router.navigate(['/login'])
  }
}

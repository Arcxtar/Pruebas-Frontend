import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-bienvenida',
  templateUrl: './bienvenida.component.html',
  styleUrls: ['./bienvenida.component.css']
})
export class BienvenidaComponent implements OnInit {
  loading: boolean = false;

  constructor() { }

  ngOnInit(): void {
    this.spinner();
  }

  spinner(){
    this.loading = true;
    setTimeout(() => {
      this.loading = false;
    }, 2000);
  }

}

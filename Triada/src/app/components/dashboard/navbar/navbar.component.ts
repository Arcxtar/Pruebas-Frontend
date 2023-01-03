import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Menu } from 'src/app/interfaces/menu';
import { MenuService } from 'src/app/services/menu.service';
import {LoginDashboardService} from '../../../services/login-dashboard.service'
import { RHService } from '../../../services/rh.service'
import { UsuarioRH} from '../../../interfaces/UsuarioRh'

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {  
  menu: Menu[] = [];
  user:String = "";

  constructor(
    private _menuService: MenuService,
    private LD:LoginDashboardService,
    private router:Router,
    private RH:RHService
  ) { }

  ngOnInit(): void {
    this.getRHID();
    /* this.cargarMenu();
    this.LD.ID.subscribe(res=>{
      console.log("Navbar:",res)
    }) */
    this.cargarMenu();
  }

  cargarMenu() {
    this._menuService.getMenu().subscribe(data =>{
      this.menu = data;
    })
  }
  logout(){
    localStorage.removeItem('token')
    localStorage.removeItem('ID')
    this.router.navigate(['/login'])
  }
  getRHID(){
    this.RH.getUserRHID(Number(localStorage.getItem("ID"))).subscribe((res:UsuarioRH)=>{
      this.user = res.Nombre;
    })
  }
 
}

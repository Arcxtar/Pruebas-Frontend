import { AfterViewInit, Component, OnInit, ViewChild} from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Candidato } from 'src/app/interfaces/candidato';
import { CrearUsuarioComponent } from '../crear-usuario/crear-usuario.component';
import { CandidateService } from '../../../../services/candidate.service';
import { LoginDashboardService } from 'src/app/services/login-dashboard.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { DialogEliminarComponent } from '../../dialog-eliminar/dialog-eliminar.component';


@Component({
  selector: 'app-listar-usuarios',
  templateUrl: './listar-usuarios.component.html',
  styleUrls: ['./listar-usuarios.component.css']
})
export class ListarUsuariosComponent implements OnInit, AfterViewInit {

  displayedColumns: string[] = ['Nombre', 'A_Paterno','A_Materno','Fecha_nac','Correo', 'acciones']; //acciones
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;
  dataSource:MatTableDataSource<Candidato>
  loading: boolean = false;
  list:Candidato[] = [];

  constructor(
    public dialog: MatDialog,
    private Persona:CandidateService,
    private LD: LoginDashboardService,
    private _snackBar: MatSnackBar
  ) { 
    this.dataSource = new MatTableDataSource()
/*     this.LD.getID$().subscribe((N : number)=>this.ID = N) */
    /* this.dataSource = new MatTableDataSource(listCandidatos) */
  }

  ngOnInit(): void {

  }

  ngAfterViewInit(): void {
    this.obtenerCandidatos();
  }

  obtenerCandidatos() {
    this.loading = true;
    setTimeout(() => {
      this.Persona.getPersona(Number(localStorage.getItem("ID"))).subscribe((res:Candidato[])=>{
        this.loading = false;
        this.dataSource.data=res
      })
      this.dataSource.paginator = this.paginator;
      this.dataSource.paginator._intl.itemsPerPageLabel = "Candidatos por Página";
      this.dataSource.sort = this.sort;
    }, 1000);
  }


  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }

  addEditCandidato() {
    const dialogRef = this.dialog.open(CrearUsuarioComponent, {
      width: '50%',
      height: '50%',
      disableClose: true
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
     
    });

  }

  openDialog(id:Number,Nombre:String,Correo:String){
    const dialogRef = this.dialog.open(DialogEliminarComponent, {
      width: '550px',
      disableClose: true,
      data:{
        ID:id,
        Nombre:Nombre,
        Correo:Correo
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('Dialog closed');
    });
  }
  
}

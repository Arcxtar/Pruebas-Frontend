import { Component, OnInit ,Inject} from '@angular/core';
import { MatDialogRef , MAT_DIALOG_DATA} from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { CandidateService } from 'src/app/services/candidate.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-dialog-eliminar',
  templateUrl: './dialog-eliminar.component.html',
  styleUrls: ['./dialog-eliminar.component.css']
})
export class DialogEliminarComponent implements OnInit {
  public ID:Number;
  public Nombre:String;
  public Correo:String;
  constructor(
    public dialogRef: MatDialogRef<DialogEliminarComponent>,
    private _snackBar: MatSnackBar,
    private router:Router,
    private Persona:CandidateService,
    @Inject(MAT_DIALOG_DATA) public data: {ID:Number,Nombre:String,Correo:String},
    ) { 
      this.ID = data.ID
      this.Nombre = data.Nombre,
      this.Correo = data.Correo
    }

  ngOnInit(): void {
  }

  cancelar() {
    this.dialogRef.close();
  }
  prueba() {
    this.dialogRef.close();
  }

  borrarCandidato() {
    //this.loading = true;
    console.log("ID_Usuario:"+this.ID+"\n ID_RH:"+localStorage.getItem('ID'))
    this.Persona.deletePersona(Number(localStorage.getItem('ID')),this.ID).subscribe(() => {
    }) 
    this._snackBar.open('El candidato ha sido eliminado con éxito', '', {
      duration: 2000
    });
    //window.location.reload()
    this.dialogRef.close();
    this.router.navigate(['/dashboard/bienvenida'])
    
  }

}

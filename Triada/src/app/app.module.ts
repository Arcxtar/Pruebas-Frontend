import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { CommonModule } from '@angular/common';

import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AppComponent } from './app.component';
import { LoginComponent } from './components/login/login.component';
import { SignInComponent } from './components/sign-in/sign-in.component';


//Angular Material

import { AddTokenInterceptor } from './utils/add-token.interceptor';
import { AppRoutingModule } from './app-routing.module';
import { SharedModule } from './components/shared/shared.module';

// Modulos
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ToastrModule } from 'ngx-toastr';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from "@angular/material/input"
import { MatTableModule } from '@angular/material/table';
import { MatRadioModule } from '@angular/material/radio';
import { MatSelectModule } from '@angular/material/select';
import {AuthChildGuard} from './utils/auth-child.guard'
import {AuthGuard} from './utils/auth.guard';
import { InicioComponent } from './components/inicio/inicio.component';
import { CuestionarioComponent } from './components/cuestionario/cuestionario.component';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { NgxChartsModule } from '@swimlane/ngx-charts';




@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    SignInComponent,
    InicioComponent,
    CuestionarioComponent,
  ],
  imports: [
    BrowserModule,
    CommonModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
    MatTableModule,
    MatRadioModule,
    SharedModule,
    MatDatepickerModule,
    MatNativeDateModule,
    NgxChartsModule,
    BrowserAnimationsModule, // required animations module
    ToastrModule.forRoot(/*{
      timeOut: 4000,
      positionClass: 'toast-bottom-right',
      preventDuplicates: true,
    }*/), // ToastrModule added
  ],
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: AddTokenInterceptor, multi: true },
    AuthChildGuard,
    AuthGuard
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

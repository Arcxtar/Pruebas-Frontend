import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PerfilRhComponent } from './perfil-rh.component';

describe('PerfilRhComponent', () => {
  let component: PerfilRhComponent;
  let fixture: ComponentFixture<PerfilRhComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PerfilRhComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PerfilRhComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

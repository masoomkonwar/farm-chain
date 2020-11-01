import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { CertifiedComponent } from './components/certified/certified.component';
import { TraceComponent } from './trace/trace.component';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';

const routes: Routes = [
  {path:'',redirectTo:'home',pathMatch:'full'},
 {path:'home',component:HomeComponent},
 {path:'certified',component:CertifiedComponent},
 {path:'trace',component:TraceComponent},
 {path:'login',component:LoginComponent},
 {path:'signup',component:RegisterComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

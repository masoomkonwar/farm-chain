import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { CertifiedComponent } from './components/certified/certified.component';

const routes: Routes = [
  {path:'',redirectTo:'home',pathMatch:'full'},
 {path:'home',component:HomeComponent},
 {path:'certified',component:CertifiedComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

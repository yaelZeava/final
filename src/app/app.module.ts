import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AlertsModule } from 'angular-alert-module';
import { AppComponent } from './app.component';
import { TemplatePageComponent } from './nav-bar/template-page/template-page.component';
import { StickersComponent } from './nav-bar/stickers/stickers.component';
import { BackgroundComponent } from './nav-bar/background/background.component';
import { HomeComponent } from './dashboard/home/home.component';
import { ViewAlbumsComponent } from './dashboard/view-albums/view-albums.component';
import { EditAlbumComponent } from './dashboard/edit-album/edit-album.component';
import { NewAlbumComponent } from './dashboard/new-album/new-album.component';
import { HttpClientModule } from '@angular/common/http';
import { LoginComponent } from './dashboard/login/login.component'; 
import { FormsModule } from '@angular/forms';
import { ShapeComponent } from './nav-bar/shape/shape.component';
import { PagesComponent } from './dashboard/edit-album/pages/pages.component';
import { WorkspaceComponent } from './dashboard/edit-album/workspace/workspace.component'; 
//import { DragulaService } from 'ng2-dragula'
//import { DragulaModule } from 'ng2-dragula';
import { WellcomeComponent } from './dashboard/wellcome/wellcome.component';
import { AngularDraggableModule } from 'angular2-draggable';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {MatButtonModule, MatCheckboxModule} from '@angular/material';
import {DragDropModule} from '@angular/cdk/drag-drop';
import { ResizableModule } from 'angular-resizable-element';
import { SafeHTMLPipe } from '../app/safeHTML.pipe';
import { PhotoComponent } from './nav-bar/photo/photo.component';


const routes: Routes = [
     { path: '', redirectTo: 'Login', pathMatch:'prefix' },
      { path: 'Login', component:LoginComponent },
      { path: 'new-album', component: NewAlbumComponent },
      { path: 'view-album', component: ViewAlbumsComponent },
      { path: 'edit-album', component: EditAlbumComponent },
      { path: 'wellcome', component:WellcomeComponent  },
  
]

@NgModule({
  declarations: [
    AppComponent,
    TemplatePageComponent,
    StickersComponent,
    BackgroundComponent,
    HomeComponent,
    ViewAlbumsComponent,
    EditAlbumComponent,
    NewAlbumComponent,
    LoginComponent,
    ShapeComponent,
    PagesComponent,
    WorkspaceComponent,
    WellcomeComponent,
    SafeHTMLPipe,
    PhotoComponent
 
  ],
  imports: [
    BrowserModule,
    RouterModule.forRoot(routes),
    FormsModule,
    HttpClientModule,
    AngularDraggableModule,
    BrowserAnimationsModule,
    MatButtonModule,
    DragDropModule,
    ResizableModule
    
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

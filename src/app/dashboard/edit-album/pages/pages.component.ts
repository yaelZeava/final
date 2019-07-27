import { Component, OnInit } from '@angular/core';
import { EditService } from 'src/app/services/edit.service';
import { PageAlbom } from 'src/app/models/PageAlbom';
import { AlbumService } from 'src/app/services/album.service';
import { WorkspaceComponent } from '../workspace/workspace.component';

@Component({
  providers:[WorkspaceComponent],
  selector: 'app-pages',
  templateUrl: './pages.component.html',
  styleUrls: ['./pages.component.css']
})
export class PagesComponent implements OnInit {

  constructor(private EditService:EditService,private AlbumService:AlbumService,private comp:WorkspaceComponent) { }
      pages:PageAlbom[];
  ngOnInit() {
    this.create();
    this.GetAllPegeAlbom(this.AlbumService.cuurentAlbum.AlbomId);
    
  }
  create(){
    var num=this.AlbumService.cuurentAlbum.NumOfPage
    this.pages= PageAlbom[num];
  }   
  GetAllPegeAlbom(IdAlbum:number){
    this.EditService.GetAllPegeAlbom(IdAlbum).subscribe((PageAlboms:PageAlbom[])=>
    {this.pages=PageAlboms;
      
    });   
  }
  Paper(item:PageAlbom){
    this.comp.paper(item);
  }
}

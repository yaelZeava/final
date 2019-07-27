import { Component, OnInit } from '@angular/core';
import { AlbumService } from 'src/app/services/album.service';
import { UserService } from 'src/app/services/user.service';
import { TemplateAlbom } from 'src/app/models/TemplateAlbom';
import { Albom } from 'src/app/models/Albom';
import { AlertsModule } from 'angular-alert-module';

@Component({
  selector: 'app-new-album',
  templateUrl: './new-album.component.html',
  styleUrls: ['./new-album.component.css']
})
export class NewAlbumComponent implements OnInit {
public newAlbum:Albom=new Albom();
  constructor(private albumService:AlbumService,private UserService:UserService) { }
public TemplateAlbum:TemplateAlbom[];

  ngOnInit() {
    this.GetAllTemplateAlbom();
    this.newAlbum.AlbomDate=null;
    this.newAlbum.NumOfPage=null;
    this.newAlbum.AlbomName=null;
  }
  
  GetAllTemplateAlbom(): void{
    this.albumService.GetAllTemplateAlbom().subscribe((currentAlboms:TemplateAlbom[])=>
     {this.TemplateAlbum=currentAlboms;
     });
    }
   
    create(album:TemplateAlbom):void
    {
      this.newAlbum.TamplateAlbomId=album.TemplateAlbomId;
      this.newAlbum.UserId=this.UserService.currentid;
       this.albumService.AddAlbom(this.newAlbum).subscribe((res:boolean)=>
       {
         if(res==true)
       {  
          this.albumService.cuurentAlbum=this.newAlbum;
          this.newAlbum.AlbomDate=null;
          this.newAlbum.NumOfPage=null;
          this.newAlbum.AlbomName=null;
       }
         else alert("try again");

       });
     
      
   }

}

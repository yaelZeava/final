import { Component, OnInit } from '@angular/core';
import { Albom } from 'src/app/models/Albom';
import { UserService } from 'src/app/services/user.service';

import { AlbumService } from 'src/app/services/album.service';

@Component({
  selector: 'app-view-albums',
  templateUrl: './view-albums.component.html',
  styleUrls: ['./view-albums.component.css']
})
export class ViewAlbumsComponent implements OnInit {

  
  ngOnInit() {
    this.getAlboms();
  }
  private currentAlboms:Albom[];
  constructor(private albumService:AlbumService,private UserService:UserService){

  }
  

  
 getAlboms(): void{
    this.albumService.GetAlboms(this.UserService.currentid).subscribe((currentAlboms:Albom[])=>
     {this.currentAlboms=currentAlboms;
     });
    }
  Edit(item:Albom)
  {
    this.albumService.cuurentAlbum=item;
       
  }


}

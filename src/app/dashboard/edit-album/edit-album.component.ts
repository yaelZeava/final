import { Component, OnInit, Input } from '@angular/core';
import { StoreService } from 'src/app/services/store.service';
import { sticker } from 'src/app/models/sticker';
import { shape } from 'src/app/models/shape';
import { Background } from 'src/app/models/Background';
import { PageTemplate } from 'src/app/models/PageTemplate';
import { EditService } from 'src/app/services/edit.service';
import { DragulaService } from 'ng2-dragula';

@Component({
  selector: 'app-edit-album',
  templateUrl: './edit-album.component.html',
  styleUrls: ['./edit-album.component.css']
})
export class EditAlbumComponent implements OnInit 
{
  height="";
  widht=""
  showSection = "";
  selectedStickers=[];
  
  constructor(private EditService:EditService) {
   
   }
  ngOnInit() {
    this.createPaper()
  }
  //private _background: string = this.EditService.background.path;
  
 createPaper(){
    /*  this.height=document.getElementById("paper").style.height;
     this.widht= document.getElementById("paper").style.width;
   console.log(this.height);
   console.log(this.widht); */
 }
 
  
  
}

import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { sticker } from 'src/app/models/sticker';
import { StoreService } from 'src/app/services/store.service';
import { WorkspaceComponent } from 'src/app/dashboard/edit-album/workspace/workspace.component';

@Component({
  providers:[WorkspaceComponent],
  selector: 'app-stickers',
  templateUrl: './stickers.component.html',
  styleUrls: ['./stickers.component.css']
})
export class StickersComponent implements OnInit {
  
@Output() selectedSticker = new EventEmitter();

  constructor(private storeService:StoreService,private comp:WorkspaceComponent) {
  
   }


  public stickers:sticker[];
  ngOnInit() {

    this.GetAllSticker();
  }
  GetAllSticker(): void{
    this.storeService.GetAllSticker().subscribe(Sticker=>
     this.stickers=Sticker);
   }
   createStickers(item:sticker)
   {
     this.comp.createStickers(item);
   }
   cloneSticket(event){
     this.comp.cloneSticket(event);
   }
   
}

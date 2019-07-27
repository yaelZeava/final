import { Component, OnInit } from '@angular/core';
import { Background } from 'src/app/models/Background';
import { StoreService } from 'src/app/services/store.service';
import { EditService } from 'src/app/services/edit.service';
import { WorkspaceComponent } from 'src/app/dashboard/edit-album/workspace/workspace.component';

@Component({
  providers:[WorkspaceComponent],
  selector: 'app-background',
  templateUrl: './background.component.html',
  styleUrls: ['./background.component.css']
})
export class BackgroundComponent implements OnInit {

  
   backgrounds:Background[];
  ngOnInit() {
    this.GetAllBackground();
  }
  
  constructor(private storeService:StoreService,private EditService:EditService,private comp:WorkspaceComponent) { 
   }
  GetAllBackground(): void{
    this.storeService.GetAllBackground().subscribe(Background=>
     this.backgrounds=Background);
   }
   changeBackground(item:Background){
    this.comp.background=item.path;
     this.comp.createBack();
   }
}

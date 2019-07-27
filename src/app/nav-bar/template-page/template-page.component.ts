import { Component, OnInit } from '@angular/core';
import { PageTemplate } from 'src/app/models/PageTemplate';
import { StoreService } from 'src/app/services/store.service';
import { WorkspaceComponent } from 'src/app/dashboard/edit-album/workspace/workspace.component';

@Component({
  providers:[WorkspaceComponent],
  selector: 'app-template-page',
  templateUrl: './template-page.component.html',
  styleUrls: ['./template-page.component.css']
})
export class TemplatePageComponent implements OnInit {

  constructor(private storeService:StoreService,private comp:WorkspaceComponent) { }
  public pageTemplates:PageTemplate[];
  ngOnInit() {
    this.GetAllPageTemplate();
  }
  
  GetAllPageTemplate(): void{
    this.storeService.GetAllPageTemplate().subscribe(PageTemplate=>
     this.pageTemplates=PageTemplate);
   }
   changeTemplate(item:string){
     this.comp.changeTemplate(item);
   }
}

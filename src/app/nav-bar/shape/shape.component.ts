import { Component, OnInit } from '@angular/core';
import { shape } from 'src/app/models/shape';
import { StoreService } from 'src/app/services/store.service';

@Component({
  selector: 'app-shape',
  templateUrl: './shape.component.html',
  styleUrls: ['./shape.component.css']
})
export class ShapeComponent implements OnInit {
  public shapes:shape[];
  constructor(private storeService:StoreService) { }

  ngOnInit() {
    this.GetAllShape();
  }
  GetAllShape(): void{
    this.storeService.GetAllShape().subscribe(shapes=>
     this.shapes=shapes);
   }
 
}

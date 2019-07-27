import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/services/user.service';
import { User } from 'src/app/models/user.module';
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
//import { NgbModal } from '@ng-bootstrap/ng-bootstrap';


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

public newUser:User;

 constructor(private userService: UserService){

 }
  ngOnInit() {
   
  }

  get currentid(){
    return this.userService.currentid;
  }
  
}

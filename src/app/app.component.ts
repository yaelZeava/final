import { Component,OnInit } from '@angular/core';
import { UserService } from './services/user.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'project';
  constructor(private userService: UserService){
  } 
ngOnInit() {
 
}

public IsLogin():boolean{
  return this.userService.isLogin;
}

}

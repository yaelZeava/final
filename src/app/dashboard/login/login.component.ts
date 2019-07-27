import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/services/user.service';
import { User } from 'src/app/models/user.module';
import { AlertsService } from 'angular-alert-module';
import { Route, Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit 
{
 public type1:string="sign in"
  private currentUser:User=new User();
  
  constructor(private userService: UserService, private activatedRoute: ActivatedRoute, private router: Router){

  }
  
 
  ngOnInit() {
    this.currentUser.UserName="";
    this.currentUser.UserPassword="";
  
  }
  
   getUsers(): void{
    this.userService.GetUsers().subscribe(currentUser=>
     this.currentUser=currentUser);

   }
   CheckUser():void
   {
     this.userService.CheckUser(this.currentUser).subscribe(( id:number) => {
       if(id!=0)
    {  this.userService.currentid=id;
      this.userService.isLogin=true;
      this.currentUser.UserName="";
      this.currentUser.UserPassword="";
      this.router.navigate(["/wellcome"]);
  
    }
    else alert("error login");
    }
      );
    
    }
    Register():void{
      this.userService.Register(this.currentUser).subscribe((t:Boolean)=>{
        if(t!=false)
          alert('you have to change the passoword')
        else
        {
           this.CheckUser();}
    });}


    toggle(){
      document.querySelector(".container").classList.add("active");
    }
    close(){
      document.querySelector(".container").classList.remove("active");
    } 




  }




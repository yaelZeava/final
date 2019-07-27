import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { User } from 'src/app/models/user.module';
import { Observable, of } from "rxjs";
import{Albom}from 'src/app/models/Albom';
@Injectable({
  providedIn: 'root'
})
export class UserService {

private baseUrl: string = 'http://localhost:61739/api/user';
public currentid:number=null;
public newUser:boolean=null;
isLogin:boolean=false;
  constructor(private httpClient: HttpClient) { }

  // getUser() : Observable<User>{
  //   return this.httpClient.get<User>(this.baseUrl + '/getUser?password=123')

  // }
  User(user: User) {
    return this.httpClient.post(this.baseUrl+"/loginUser", user);
  }
  GetUsers(): Observable<User>{
    return this.httpClient.get<User> (this.baseUrl+"/getall");
  }
  CheckUser(User1:User): Observable<number>{
    return this.httpClient.post<number> (this.baseUrl+"/CheckUser",User1);
  }
  Register(User1:User): Observable<boolean>{
    return this.httpClient.post<boolean> (this.baseUrl+"/Register",User1);
  }
}

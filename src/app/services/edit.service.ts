import { Injectable } from '@angular/core';
import { Background } from '../models/Background';
import { Subject } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from "rxjs";
import { PageAlbom } from '../models/PageAlbom';
@Injectable({
  providedIn: 'root'
})
export class EditService {
public st:string="http://localhost:61739/img/background/love/אהבה 01.jpg";
obs:Subject<any>=new Subject();
element:Subject<any>=new Subject();
private baseUrl: string = 'http://localhost:61739/api/Edit';
currentPage:PageAlbom=new PageAlbom();
currentImg:string="";
constructor(private httpClient: HttpClient) { }
ngOnInit(){
}
GetAllPegeAlbom(idAlbum:number):Observable<PageAlbom[]> {
  return this.httpClient.get<PageAlbom[]>(this.baseUrl+"/AllPageAlbom/"+idAlbum);
}
UpdatePage(item:PageAlbom):Observable<boolean>{
          return this.httpClient.post<boolean>(this.baseUrl+"/UpdatePage",item);
}
}


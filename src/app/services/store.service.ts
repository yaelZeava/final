import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from "rxjs";
import { shape } from '../models/shape';
import { sticker } from '../models/sticker';
import { Background } from '../models/Background';
import { PageTemplate } from '../models/PageTemplate';
import { photo } from '../models/photo';
@Injectable({
  providedIn: 'root'
})
export class StoreService {
  private baseUrl: string = 'http://localhost:61739/api/Edit';
  constructor(private httpClient: HttpClient) { }
  
  GetAllPhoto(): Observable<photo[]>{
    return this.httpClient.get<photo[]>(this.baseUrl+"/AllPhoto")
  }

  GetAllShape(): Observable<shape[]> {
    return this.httpClient.get<shape[]>(this.baseUrl+"/AllShape");
  }
  GetAllSticker(): Observable<sticker[]> {
    return this.httpClient.get<sticker[]>(this.baseUrl+"/AllStricker");
  }
  GetAllBackground(): Observable<Background[]> {
    return this.httpClient.get<Background[]>(this.baseUrl+"/AllBackground");
  }
  GetAllPageTemplate(): Observable<PageTemplate[]> {
    return this.httpClient.get<PageTemplate[]>(this.baseUrl+"/AllPageTemplate");
  }
  postFileUpLoad(data: any,UserId:number): any {
    let headers = new Headers();
    return this.httpClient.post(this.baseUrl+'/uploadFile?id='+UserId, data);
  }







}

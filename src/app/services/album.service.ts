import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Observable, of } from "rxjs";
import{Albom}from 'src/app/models/Albom';
import { TemplateAlbom } from '../models/TemplateAlbom';
@Injectable({
  providedIn: 'root'
})
export class AlbumService {
  private baseUrl: string = 'http://localhost:61739/api/View';
  public cuurentAlbum:Albom=new Albom();
  constructor(private httpClient: HttpClient) { }
 
  GetAlboms(id:number): Observable<Albom[]> {
    return this.httpClient.post<Albom[]>(this.baseUrl+"/getAlboms",id);
  }
  GetAllTemplateAlbom(): Observable<TemplateAlbom[]> {
    return this.httpClient.get<TemplateAlbom[]>(this.baseUrl+"/AllTemplateAlbom");
  }
  AddAlbom(newAlbum:Albom): Observable<boolean> {
    return this.httpClient.post<boolean>(this.baseUrl+"/AddAlbom",newAlbum);
  }

}

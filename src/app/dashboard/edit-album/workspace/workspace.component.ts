import { Component, OnInit, Input, ElementRef } from '@angular/core';
import { EditService } from 'src/app/services/edit.service';
import { Background } from 'src/app/models/Background';
import { sticker } from 'src/app/models/sticker';
import { PageAlbom } from 'src/app/models/PageAlbom';
import { PageTemplate } from 'src/app/models/PageTemplate';
import { ResizeEvent } from 'angular-resizable-element';
import { photo } from 'src/app/models/photo';

@Component({

  selector: 'app-workspace',
  templateUrl: './workspace.component.html',
  styleUrls: ['./workspace.component.scss'],
})
export class WorkspaceComponent implements OnInit {
  public st: string = "http://localhost:61739/img/background/love/אהבה 01.jpg";
  background: string = "love/אהבה 01.jpg";
  imgUrl: string = "http://localhost:61739/img/background/";
  stickerUrl: string = "http://";
  page: any;
  sticker: sticker;
  public all: string;
  public img;
  thispage: string = "";
  imgSrc = "http://localhost:61739/UploadFile/";
  @Input() selectedStickers;

  get fullBack() {
    return this.imgUrl + this.background
  }
  constructor(private EditService: EditService,private elRef:ElementRef) {
    /*this.EditService.obs.subscribe(res=>{
      this.background=(res as Background).path;
          });*/

  }
  pic(event) {
    if (this.EditService.currentImg)
      document.getElementById(this.EditService.currentImg).classList.remove("click");
    this.EditService.currentImg = event.target.id;
    document.getElementById(event.target.id).classList.add("click");
  }
  changePic(item: photo) {
    this.imgSrc += "/";
    this.imgSrc += item.userId;
    this.imgSrc += "/";
    this.imgSrc += item.path;
    document.getElementById(this.EditService.currentImg).style.backgroundImage = "url('" + this.imgSrc + "')"
  }
  ngOnInit() {

  }

  onResizeEnd(event: ResizeEvent): void {
    console.log('Element was resized', event);
  }

  createStickers(item: sticker) {

    this.img = document.createElement("img");
    this.img.src = this.stickerUrl + item.path;
    document.getElementById("paper").append(this.img);
  }
  cloneSticket(event) {
    var itm = document.getElementById(event.target.id);
    var cln = itm.cloneNode(true);
    document.getElementById("paper").appendChild(cln);
    //document.getElementById("paper").children[0].setAttribute("ngDraggable","true");


  }
  createBack() {
    this.all = this.imgUrl + this.background;
    this.page = document.getElementById("paper");
    this.page.style.backgroundImage = "url('" + this.all + "')";
    console.log(this.all);
  }

  UpdatePage(item: PageAlbom) {
    this.EditService.UpdatePage(item).subscribe((res: boolean) => {
      console.log(res);
    });
  }
  changePaper() {

    this.EditService.currentPage.path = document.getElementById("paper").innerHTML;
    this.UpdatePage(this.EditService.currentPage);
  }
  changeTemplate(item: string) {
   var element= document.getElementById("paper").innerHTML = item;
   debugger;
   this.elRef.nativeElement.querySelector('button').addEventListener('click', this.pic.bind(this));
  }

  paper(item: PageAlbom) {
    this.changePaper();
    this.EditService.currentPage = item;
    document.getElementById("paper").innerHTML = item.path;

  }
}

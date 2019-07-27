import { Component, OnInit } from '@angular/core';
import { StoreService } from 'src/app/services/store.service';
import { UserService } from 'src/app/services/user.service';
import { photo } from 'src/app/models/photo';
import { WorkspaceComponent } from 'src/app/dashboard/edit-album/workspace/workspace.component';

@Component({
  providers:[WorkspaceComponent],
  selector: 'app-photo',
  templateUrl: './photo.component.html',
  styleUrls: ['./photo.component.css']
})
export class PhotoComponent implements OnInit {
  newFile;
  photos:photo[];
  constructor(private StoreService:StoreService,private UserService:UserService,private comp:WorkspaceComponent) { }

  ngOnInit() {
      this.GetAllPhoto();
  }
  GetAllPhoto(): void{
      this.StoreService.GetAllPhoto().subscribe(photo=>
       this.photos=photo);
   }
  onChange(event) {
    let fileList: FileList = event.target.files;
    if (fileList.length > 0) {
      this.newFile = fileList[0];
    }
    this.updateFile();
  }
pic(item:photo){
  this.comp.changePic(item);

}
  updateFile() {
    if (this.newFile == null) return;
    let formData: FormData = new FormData();
    formData.append('uploadFile', this.newFile, this.newFile.name);
    this.StoreService.postFileUpLoad(formData,this.UserService.currentid).subscribe(()=>{
      alert('success!');
    });
  }
}



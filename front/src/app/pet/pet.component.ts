import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
@Component({
  selector: 'pet-shop',
  templateUrl: './pet.component.html',
  styleUrls: ['./pet.component.css']
})
export class PetComponent implements OnInit{
  
  constructor(private http: Http) { }

  pets;
  suggests:string;
  newInfo:string;
  suggestion: string;
  
  ngOnInit() : void{
    this.http.get('http://localhost:3000/pets')
      .subscribe((res)=> {
        this.pets = res.json().pets;
    });
  };

  buscar(newInfo) {
    this.suggestion = ""
    var key_words;
    if (newInfo){
      key_words = '?keywords=' + newInfo;
    }else{
      key_words ='';
    }
    

    this.http.get('http://localhost:3000/pets' + key_words)
      .subscribe((res)=> {
        this.pets = res.json().pets,
        this.suggests = res.json().suggests[0]
        
        if(this.suggests){
          this.suggestion = 'Você quis dizer:' + this.suggests
        }
    });
    
  }
}

import { Component, OnInit } from '@angular/core';
import { BaseApiService } from 'src/service/BaseApiService';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  constructor(
    private baseApiService: BaseApiService,
  ) {

  }
  ngOnInit(): void {
    this.getData();
  }

  getData() {
    this.baseApiService.weatherForecast().subscribe(res => {
      console.log(res);
    });
  }

  title = 'angular-testapi';
}

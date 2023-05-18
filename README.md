   <img width="331" alt="Ekran Resmi 2023-05-18 23 48 07" src="https://github.com/asudenisatiras/asudenisatiras_hw2/assets/127339561/1686b974-5abc-4e4b-b041-58ba62d505a5">


# SYNCNews: Best for keeping up-to-date with current news and the latest events!
With the SyncNews application, you can access the most accurate news and determine your favorite news in the application.

### Application Summary
In the application, news is shown on a homepage using the New York Times Top Stories API. In practice, the news comes from the NYT up to date. There are weather forecast, current exchange rates and sports news buttons. When you click on the news on the main page, you will be switched to another page to view it in detail. On this page, if the user wants to access the news and read more, he directs them to safari.The user can also see the news he likes on the favorites page and delete the news he wants on this page.

## Features Used
- UIKit
- TableView 
- SafariViewController
- SearchBarController
- TabBar Controller
- URLSession
- SDWebImage
- Alamofire
- UserDefaults

## API Reference
### Get all items

| Parameter	 | Type | Description |
| ------------- | ------------- |------------- |
| ```api-key```   | ```string```       | drd83CuzY0DkYcFkO7AUh2naHU6unqMh     |


```
https://api.nytimes.com/svc/topstories/v2/home.json?api-key=yourkey
```
##### More help: https://developer.nytimes.com



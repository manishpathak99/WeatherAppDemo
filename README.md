# Weather iOS App
The main purpose of this app is to show the weather information of a city 

## Pre-requisites
XCode 16.0

MAC Sonoma 14.5

Swift 5.5

iOS 16.0 +

## Application Version 
1.0


## How to run this project
Open terminal and run  `pod install`

Go to project directory and run command `xed .` in terminal to open project in Xcode. 


## Architecture 
 In this application , VIPER pattern is used.
 
**V (View):**
View is responsible for the UI updates and show whatever the presenter tells it.

**I (Interactor)** The purpose of Interactor is responsible for fetching data from the model layer, and its implementation is totally independent of the user interface.All the business logic like `getting delivery data` is written inside the Interactor.

**P (Presenter)** The role of Presenter is intermediator, it gets data from interaction and passes to View. (It may be data or any user action)

**E (Entity)**  Basically it is contains the Object Model which is used by Interactor. like DeliveryModel

**R (Router)** It contains navigation logic for the application for example when user clicks on list item , it navigates to Map screen

**DataManager** - The main purpose of DataManager is to handle the data flow , it decides whether the data should come from the server or from local DB. 


## Network Handling and Caching
The application is using Alamofire library for network API calls. when user open app , it starts fetching the data from server, after successfull response it shows the data in the list. If there is an error occured, something went wrong dialog appears . 

## Cocoapods
Alamofire

Snapkit
  
ObjectMapper

Kingfisher

NVActivityIndicatorView


## SwiftLint 
- For installing Swfitlint, Follow instructions which are written in Readme file  https://github.com/realm/SwiftLint
- Open the .swiftlint.yml file and modify the rules if its required as per the requirement.

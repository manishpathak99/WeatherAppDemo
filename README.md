# Weather iOS App
This application provides real-time weather information for any city using the OpenWeather API. It displays key weather details such as temperature, wind speed, humidity, and minimum/maximum temperatures. Users can search for a city by name, and based on the response from the OpenWeather API, the relevant weather data is presented in a clear and accessible format.

Key features:

* Search for weather information by city

* Display temperature, wind speed, and humidity

* View minimum and maximum temperatures

* Uses OpenWeather API for real-time data

## Pre-requisites
XCode 16.0

MAC Sonoma 14.5

Swift 6.0

iOS 16.0 +

## Application Version 
1.0


## How to setup and run this project

In order to download the project , run the following command in terminal - 
`git clone https://github.com/manishpathak99/WeatherAppDemo.git`

Navigate to the directory - `cd WeatherApp`

Open terminal and run  `pod install`

Go to project directory and run command `xed .` in terminal to open project in Xcode. 

Click Run to run the project in simulator.

## Screenshot 
https://github.com/manishpathak99/WeatherAppDemo/blob/main/Screenshot/app-screenshot%20.png

## Architecture 
 In this application , VIPER pattern is used.
 
**V (View):**
View is responsible for the UI updates and show whatever the presenter tells it.

**I (Interactor)** The purpose of Interactor is responsible for fetching data from the model layer, and its implementation is totally independent of the user interface.All the business logic like `getting weather data` is written inside the Interactor.

**P (Presenter)** The role of Presenter is intermediator, it gets data from interaction and passes to View. (It may be data or any user action)

**E (Entity)**  Basically it is contains the Object Model which is used by Interactor. like WeatherModel

**R (Router)** It contains the navigation logic across screens the application for example splash screen to weather screen. 

**DataManager** - The main purpose of DataManager is to handle the data flow , it decides whether the data should come from the server or from local DB. 


## Network Handling
The application is using Alamofire library for network API calls. when user open app , it starts fetching the data from server, after successfull response it shows the data in the list. If there is an error occured, something went wrong dialog appears . 

## Cocoapods
Alamofire

Snapkit
  
ObjectMapper

NVActivityIndicatorView

## Run Test cases 
To run test cases in Xcode, open the Test Navigator and click the play button next to the test or test bundle. Alternatively, use Cmd + U to run all tests. You can also run specific tests by clicking the diamond play button next to the test method in the code editor.


## SwiftLint 
- For installing Swfitlint, Follow instructions which are written in Readme file  https://github.com/realm/SwiftLint
- Open the .swiftlint.yml file and modify the rules if its required as per the requirement.

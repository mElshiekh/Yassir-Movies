# Yassir-Movies
## Features:
Feature 1: Retrieve Movies list.

Feature 2: get movies details.


## Requirements
iOS 13.0+

Xcode 14.3+

Swift 5.0+

## Installation
Clone the repository.

Open the terminal in the location of the local repo.

run pod install.

Open the **YassirApp.xcworkspace** project in Xcode.

Build and run the project on the simulator or a connected device.

## Architecture
This project follows the **MVVM (Model-View-ViewModel) clean architecture** pattern with **Coordinator design pattern**. It separates the concerns of data, presentation, and domain.

**Combine** is used for the reactive data observation.

<img width="274" alt="Screenshot 2023-10-28 at 10 13 04 AM" src="https://github.com/mElshiekh/Yassir-Movies/assets/36982649/5a160a9f-0729-44d3-bbe5-557e0bb3deda">

  ### Presentation

  It consists of the *ViewController*, *ViewModel*, and the *coordinator*

  Coordinators are concerned with initiliazation of the controller and the viewmodel and injecting their dependencies
  
  ### Domain

  It consists of the *UseCase* and the *Entities* related

  Usecases are reusable parts of the business logic for logic separation and enhancing reusablity and testability.

  *Only usecases unit testing is included*

  ### Data

  It consists of the *DTOs* and the *Service workers* 

  Where DTOs handles the mapping to the domain entities, and service wokers are concerned with the API calls.

## Usage

  use the included templates to create the Presentation layer and the Data layer requirements.

  ### Templates

  There are 2 templates included **Service.xctemplate** and **MVVMCombine.xctemplate** move these two templates to /Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/Project Templates/iOS/Templates

  if the Templates folder is not found create one.

  ## Presentation

  all dependencies by the viewmodel, viewcontroller, coordinator are passed via the dependency model.

  the start method in the coordinator is to create the objects, inject dependencies and it returns the viewcontroller to the parent coordinator in order to handle the way of the presentation.

  
  ### Data

  the data layer 

  the DTOs created are extendible and additional DTOs can be created.
  
  Implement the Mapper protocol func toDomain() *various domain mapping can be included*

  an endpoint enum is created where you should add all the cases for the api calls, it provides the method and the endpoint value that will be used by the service.

  
  


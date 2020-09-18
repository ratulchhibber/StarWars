# Star Wars

Objective:

* An iOS app in Swift that lists Star Wars characters using the open API (https://swapi.dev/) and targeted at iOS 13.0+
* SWAPIApp lists the names of all Star Wars characters in alphabetical order (using the /api/people endpoint). 
* Selecting a name on the list opens a detail view that displays their name, birth year, and physical attributes (height, mass, hair color, skin color, eye color and gender). 
* The detail view also includes the name of all the films the character appears in and also the word count of the opening_crawl attribute for each film.

Approach:

* Design pattern used - MVVM with RxSwift
* Uses Lottie for Loading Indicator Animations
* Moya for networking
* Uses Multithreading - Upto five parallel calls with zip higher order function and RxSwift and combing data

Note: ** Compiled on xCode 11.5 ** Targetting iOS 13.5

* Addition of more tests in progress....

![Image of README](https://github.com/ratulchhibber/StarWars/blob/master/README.png)

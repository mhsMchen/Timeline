# MHS Timeline

Timeline is a program designed to display a list of clubs, each of which will contain details of the club (event calendar, room number, members, etc).

## Description

Using the concept of nested lists with the use of Swift (SwiftUI), this program will help organize club information; focusing more on accessibility and visuals.

When the program is running, the main page will show up, after displaying our Timeline logo. There will be an option to create a new club through a button, and then you could add club details.

After finishing, a club will be added to the club list in the main page. When a specific club is clicked, the program will bring you into another page, directly displaying club information, in addition to a small banner, containing a visual. In the same page page are you able to edit that specific club's details.

Further services are offered within the club detail page: an event calendar for that specfic club; theme picker; and more.

## Getting Started

### Dependencies

* MacOS
* Firebase
* XCode v13 (Any Swift-Compatible IDE)
* CoreSimulator

### Installing

* Download all files directly from github: [https://github.com/mhsMchen/Timeline]
* Make sure to open the *Timeline.xcodeproj* file in the Timeline folder when you want to run the program
* To download dependencies: double click on the Timeline project in Xcode, click "add packages", within packages page, enter package URL and select the package you want to download. Then click the download button to install. 
* Dependencies URLs required for this project are as follows:

  * Firebase: [https://github.com/firebase/firebase-ios-sdk]
  * Calendar: [https://github.com/mszpro/Selectable-Calendar-View] (The calendar function was not made by the Timeline team and full credits go to mszpro for the base code of this calendar)

### Firebase

* Create new firebase project here: [https://console.firebase.google.com/]
* Lauch Timeline from Xcode and double click the Timeline file within Xcode
* Go to Signing & Capabilities and copy the bundle identifier
* Go back to Firebase and add an IOS application
* Register the app using the bundle ID you just copied
* Download the info.plist and add it to Timeline files
* You can now work with all capabiities of Firebase and are connected to the Firebase servers

### Executing program (XCode)

* After downloading the program files and XCode, open the Timeline *xcode.projec* file
* On the toolbar, download a specific build to download for CoreSimulator (ex: iPhone 13 Pro Max)
* On the top right of the window, click on the run button, and wait for the program to build
* The CoreSimulator should run, and a simulator will appear and run a preview of the program

## Help
The program takes a while to load, approximately 5 - 20 seconds. If it doesn't run by then, check for any breakpoints: use the debug tab on the very top to deactivate any breakpoints.

For help with system images, find them here: [https://github.com/cyanzhong/sf-symbols-online], full credits to cyanzhong.
For further help, [you can contact us.](https://classroom.google.com/c/MzIwMDI3NTU5NzIz)

## Authors

Contributors names and contact info
* Mark Chen - Lead Programmer - mchen8@ocdsb.ca
* Bryan Bui - Lead UI Designer - bbui1@ocdsb.ca
* Griffin Kealey - Quality Control - gkeal1@ocdsb.ca


## Version History

* 0.2
    * Various bug fixes and optimizations
    * See [commit change]() or See [release history]()
* 0.1

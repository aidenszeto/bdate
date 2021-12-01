# bdate

## Frontend 

### Command Line Approach

For this project, we use flutter as the frontend. To install flutter on your device (preferably macOS, since we used iOS for testing/implementation, which is only available on macOS), please follow the detailed tutorial posted [here](https://docs.flutter.dev/get-started/install/macos).

A few simplified steps are given here.

Please first clone the repo and `cd` into it.

Then download the Flutter SDK given above. And unzip it to the current directory using the `unzip ~/Downloads/flutter_macos_2.5.3-stable.zip`. (replace the path with whereever you place the zip).

Then, add flutter tool to your path by ```export PATH="$PATH:`pwd`/flutter/bin"```. **This command sets your `PATH` variable for the *current* terminal window only. **

Next, we need to install Xcode tools by 

```shell
$ sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
$ sudo xcodebuild -runFirstLaunch
```

Also, please make sure a. Xcode is installed, b. Xcode license agreement is signed.

macOS system has iOS simulator, which will be the place we run our frontend. Use `open -a Simulator` to open one.

Before starting the app, make sure you have all the dependencies installed by `cd frontend` and run `flutter pub get`.

To start the frontend app, simply make sure all environments and dependencies are properly set and then run `flutter run`. This should automatically connect to the iOS simulator and start the app.
## Backend

We used Node.js for the backend server of this project. To install Node.js on your local device please follow the instructions for your specific device [here](https://nodejs.org/en/download/).

Once you have installed Node.js, please change directories into the `backend` folder and install the project dependencies with `npm install`.

Next, create a file named `.env` in the `backend` folder of the project repository. Inside of this file, paste

```DATABASE_URI=mongodb+srv://user:password@bdate.msyzd.mongodb.net/bdate?retryWrites=true&w=majority
```
where `user` and `password` are replaced with the username and password found in the security tab in the MongoDB project console.

The server is now ready to be run. To start the server, run `npm start`. This should run the instance on port 8080 by default, but the port can be configured by adding an additional variable to the `.env` file.
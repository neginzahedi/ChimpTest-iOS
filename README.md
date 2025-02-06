# ChimpTest App - iOS Game
Welcome to the Chimp Test Game! This iOS app, written in SwiftUI, challenges your memory and focus. The objective of the game is simple: follow the sequence of numbers, guess the next number in the sequence, and progress to the next level. But watch out! You only have 3 lives, and a wrong guess means you lose one.

## Video (wait for gif to load) 
<img src="./Images/chimp.gif" width="50%" height="50%"/>

## Features

### Game Play:
- The game begins with numbers 1 to 5 displayed in sequence. Your task is to click the number in order (1, then 2, then 3, and so on).
- With each successful level, a new number is added to the sequence, making the game progressively more difficult.
- You have 3 lives. Incorrect guesses will cause you to lose a life. When all lives are lost, it’s game over!

### Customization:
- Choose between Dark Mode and Light Mode to suit your preference.
- Reset the game at any level to restart the challenge.

### Code Structure:
- The app follows the MVVM (Model-View-ViewModel) architecture, ensuring a clean separation of concerns between the UI, the data, and the game logic.

### Custom Data Structures:
- The app uses a Matrix data structure for various game mechanics.
- Linked List is used to manage data dynamically and efficiently.

## Requirements

- iOS 16 or later
- Swift 5

## Installation

To get started, clone the repository to your local machine:

```
git clone https://github.com/neginzahedi/ChimpTest-iOS.git
cd ChimpTest-iOS
```
Open the project in Xcode:
```
open ChimpTest-iOS.xcodeproj
```
Build and run the project on your simulator or device.

## Contributing

We welcome contributions from everyone! If you'd like to contribute to the project, feel free to fork the repository, create a feature branch, and submit a pull request. Please follow the contribution guidelines for detailed instructions.

### How to Contribute:
- Fork the repository.
- Create a new branch (`git checkout -b feature-branch`).
- Commit your changes (`git commit -m 'Add new feature'`).
- Push your changes to your fork (`git push origin feature-branch`).
- Open a pull request.

# License

This project is licensed under the MIT License - see the LICENSE file for details.

<br>
Have fun playing the Chimp Test Game, and let us know how you perform! 😊

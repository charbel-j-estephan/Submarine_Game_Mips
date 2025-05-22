🐟 Submarine Game in MIPS Assembly
Welcome to our submarine game built entirely using MIPS assembly language on the MARS simulator! This project was created as a fun and educational challenge to push our understanding of low-level programming concepts.

🎮 Game Overview
In this game, you control a submarine trying to avoid sharks underwater.

Controls:

W – Move up

S – Move down

Objective:

Avoid the sharks! You start with 3 lives, and each collision with a shark costs you one.

When you lose all your lives, you’re given the option to play again or quit.

🧠 Features
Intro Music & Menu: A short musical tune plays at the beginning with a welcome screen. Press Space to start.

Dynamic Movement: Sharks and the submarine move smoothly thanks to a simple frame update system.

Collision Detection: The game checks for collisions every frame.

Game Over Screen: Includes sound effects and the option to restart.

Pixel Art Graphics: Submarine, sharks, and a scrolling sea background built with pixel-based rendering.

🛠️ How It Works
Start Screen & Music:

Custom intro music plays.

Press Space to begin the game.

Main Loop:

Input is checked continuously.

The screen updates every cycle: erase, move, draw, repeat.

Lives are updated and tracked in real-time.

Game Over:

When all lives are lost, a "Game Over" message and a replay option are shown.

👥 Contributors
Charbel Estephan: Designed the submarine and shark graphics, handled animations, and made movement responsive.

Lamita El Khoueiry: Composed the intro music and sound effects, implemented the menu and game-over screen.

Anthony El Chakar: Programmed shark movement and attack logic, implemented the life system and collision behavior.

📚 What We Learned
This project taught us how much is possible with low-level code—even something as dynamic as a game. We learned:

Manual graphics rendering

Game state management

Handling keyboard input in MIPS

Real-time interaction without built-in libraries

🎥 Gameplay Preview
You can see the game in action in the videos we've shared — showcasing the submarine movement, shark behavior, and game mechanics in real time.

📂 How to Run
Download MARS (MIPS Assembler and Runtime Simulator)

Open the .asm file in MARS

Assemble and run the program

Enjoy the game!

🚧 Known Issues
The life counter doesn’t always display correctly.

Collision sometimes triggers early or late.

Some animations may stutter occasionally.

We're aware of these bugs and did our best within the limited time to make the game playable. Contributions and suggestions are welcome!

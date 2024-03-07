# Toy Robot Simulator

This is a Ruby application that simulates a toy robot moving on a square tabletop.

## Prerequisites

Ruby version used is **3.2.0**, however the app has been tested with Ruby version **2.6.4** too

## Setup

First, clone the repository:

```sh
git clone git@github.com:lsamon/dash-toy-robot.git
cd dash-toy-robot
```

Then, install the dependencies:

```sh
bundle install
```

**Running the Application**
You can run the application with:

```sh
ruby application.rb
```

This will start the application and you can begin issuing commands to the robot.

**Running the Tests**
You can run the tests with:

```sh
bundle exec rspec
```

**Commands**

The app accepts the following commands:

- PLACE X,Y,F - Places the robot on the board at position X,Y and facing F (NORTH, SOUTH, EAST, WEST).
- MOVE - Moves the robot one unit forward in the direction it is currently facing.
- LEFT - Rotates the robot 90 degrees to the left without changing the position of the robot.
- RIGHT - Rotates the robot 90 degrees to the right without changing the position of the robot.
- REPORT - Prints the X,Y and F of the robot.

Enjoy!!
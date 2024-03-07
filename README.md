# Toy Robot Simulator

This is a Ruby application that simulates a toy robot moving on a square tabletop.

## Prerequisites

- Ruby 3.2.0

## Setup

First, clone the repository:

```sh
git clone <repository_url>
cd toy_robot
```

Then, install the dependencies:

`bundle install`

**Running the Application**
You can run the application with:

`ruby application.rb`

This will start the application and you can begin issuing commands to the robot.

**Running the Tests**
You can run the tests with:

`bundle exec rspec`

**Commands**

The app accepts the following commands:

- PLACE X,Y,F - Places the robot on the board at position X,Y and facing F (NORTH, SOUTH, EAST, WEST).
- MOVE - Moves the robot one unit forward in the direction it is currently facing.
- LEFT - Rotates the robot 90 degrees to the left without changing the position of the robot.
- RIGHT - Rotates the robot 90 degrees to the right without changing the position of the robot.
- REPORT - Prints the X,Y and F of the robot.

Enjoy!!
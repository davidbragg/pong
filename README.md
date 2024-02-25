# Pong Clone

This is a very stripped down clone of Pong built with the intention of building a little bit of knowledge developing games using Godot with GDScript. The goal was to build something functional in a short amount of time.

# Game Play

Single player only. The left paddle is player controlled and can be moved with the `up` and `down` arrows on the keyboard. The `space` bar will serve the ball. The ball will remain in play until a goal. The ball will reset to the start position and wait for the player to serve again.

# Limitations

* player 1 always serves
* player 2 uses a naive movement implementation that tracks and attempts to match the ball's Y position
* ball angle is modified when connecting with a paddle and there's nothing in the code to prevent it from ending up perfectly horizontal or vertical



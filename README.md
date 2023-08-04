# Noctis IV Godot

This is a simple test Godot project, using [feltyrion-godot](https://github.com/jorisvddonk/feltyrion-godot) in an attempt to recreate Noctis IV in Godot.

THIS IS HIGHLY EXPERIMENTAL AND PRETTY BUGGY!

## Travel modes

This project contains two "Travel modes", which affect how you travel around space: Original (24 ticks per second), and Recreated (any other rate :)).

The Original travel mode uses the original code for both Vimana and Local star system travel, but is currently very experimental and glitchy.

The Recreated travel mode uses a completely recreated travel and orbiting engine. It's very simple and should be expanded on further, but allows for higher resolution, more responsive travel. In this mode, orbits around planets where the planet is kept centered in view are much more satisfying.

To switch between these travel modes, set the "Physics Ticks per Second" project setting (`physics/common/physics_ticks_per_second`). If it's set to 24, then the Original travel mode is used. Otherwise, Recreated is used.

## Dependencies

This project depends on https://github.com/jorisvddonk/feltyrion-godot, which is not included by default. See `addons/feltyrion-godot`

class_name State
extends Node
##############################
##### GLOBAL STATE CLASS #####
##############################
## 
## The script that all the states in the game will extend
##
## It handles the following behaviors:
## - Enter: execute some logic when the machine enters the 
##   state (initialize variables, trigger one-time actions, 
##   update current animation)
## - Exit: execute some logic when the machine exists the 
##   state (clean up resources, reset variables, remove nodes)
## - Update: execute some logic at every 
##   frame (equivalent to _process)
## - Physics_update: execute some logic at fixed 
##   intervals (equivalent to _physics_process)
##
## It handles the following signal:
## - Transitioned: triggers a state change. This signal 
##   accepts the name of the next state as parameter. 
##   The state machine will react to the signal to 
##   update the current state.


## SIGNALS
signal transitioned(new_state_name: StringName)

## CUSTOMIZABLE VARS
@export var animation_name: String
@export var run_speed: float = 200.0
@export var jump_velocity: float = 350.0
@export var fall_velocity_scale: float = 0.5

## LOCAL VARS
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
## Hold a reference to the parent so that it can be controlled by the state
var animations: AnimationPlayer
var parent: CharacterBody2D
var previous_state: State
var move_component


## BEHAVIORS
func enter() -> void:
	animations.play(animation_name)


func exit() -> void:
	pass


func process_input(_event: InputEvent) -> State:
	return null


func process_frame(_delta: float) -> State:
	return null


func process_physics(_delta: float) -> State:
	return null

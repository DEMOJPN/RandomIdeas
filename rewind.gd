# godot v4.4.1
# added to the root node of the level

extends Node3D
# gets the character node
@onready var player: CharacterBody3D = $CharacterBody3D

# vars
var position_history: Array = []
var active: bool = false


# timing for the rewind is pulled from the process but i just did this because it was the quickest method.
func _physics_process(_delta):
	if active:
		rewind()


# the main rewind function that sets the player position and removes that element from the array and repeats until 0
func rewind():
	if position_history.size() > 0:
		player.global_position = position_history.pop_back()
	else:
		active = false


# connected to scene timer & appends the position to the end of array on timeout
func _on_timer_timeout() -> void:
	if position_history.size() > 1000:
		position_history.pop_front()
	position_history.append(player.global_position)


# connected to UI button on pressed
func _on_btn_rewind_pressed() -> void:
	if !active:
		active = true
	else:
		active = false

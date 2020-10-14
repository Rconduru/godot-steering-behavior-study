extends KinematicBody2D

var target_position: Vector2 = Vector2.ZERO

### SHIP VARIABLES
var MAX_VELOCITY = 280
var velocity: Vector2 = Vector2.ZERO

### Steering Variables
var steering_speed: int = 15
var steering_angular: float = 0.5
var timeToTarget: float = 0.35

func _ready():
	pass # Replace with function body.

func _process(delta):
	move(delta)

func _input(event):
	if event.is_action_pressed('mouse_click'):
		target_position = get_global_mouse_position()

## Smooth Moviment
func move(delta):
	
	#### Aceleration movement ###
	if target_position.length() > 0:
		$Sprite.look_at(target_position)
		update_velocity(delta)
		
	if global_position.distance_to(target_position) < 100:
		$Sprite.look_at(target_position)
		velocity = (target_position - global_position) / timeToTarget
		velocity = velocity.clamped(MAX_VELOCITY)
		
	if global_position.distance_to(target_position) < 5:
		velocity = Vector2.ZERO
		target_position = Vector2.ZERO
	
	
	velocity = move_and_slide(velocity)	
	
func update_velocity(delta: float):
	var direction = (target_position - global_position).normalized()
	
	velocity += direction * steering_speed
	velocity = velocity.clamped(MAX_VELOCITY)

	

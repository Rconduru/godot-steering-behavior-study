extends KinematicBody2D

#class Kinematic:
#position: Vector
#orientation: float
onready var Ship = get_tree().get_root().find_node("Ship", true, false)
var velocity: Vector2 = Vector2.ZERO
var max_speed = 150
#rotation: float

#class SteeringOutput:
#linear: Vector
#angular: float	s

func _physics_process(delta):
	var target_position = Ship.global_position - global_position
	
	var current_dir = Vector2(1,0).rotated($Sprite.get_global_rotation())
	var target_angle = current_dir.angle_to(Ship.global_position)

	
	seek_update(target_position, target_angle, delta)
	
	move_and_slide(velocity)
	
	
func seek_update(steering_linear: Vector2, 
	steering_angle: float, 
	delta: float ):
	velocity += velocity 
	velocity += steering_linear * (delta * 10)
	velocity *= max_speed
	velocity = velocity.clamped(max_speed)
	
	#var rotation = $Sprite.global_rotation + steering_angle
	$Sprite.set_global_rotation(rotation)
	#$Sprite.rotate()
	

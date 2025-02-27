extends CharacterBody2D

@onready var score_label = $ScoreLabel
var score = 0
@onready var timer: Timer = $Timer
signal increase_point(value: int)

@export var max_speed: float = 200.0  # Maximum movement speed
@export var acceleration: float = 8.0  # Speeding up rate
@export var deceleration: float = 5.0  # Slowing down rate
@export var deadzone_radius: float = 15.0 #radius of dead zone


func increase_score(amount: int):
	score += amount
	emit_signal("increase_point", score)
	score_label.text = "Score: " + str(score)
	


func _process(delta):
	
	
	
	var target_position = get_global_mouse_position()  # Get mouse position in world coordinates
	
	var distance_to_mouse = global_position.distance_to(target_position)  # Distance to the mouse

	if distance_to_mouse 	< deadzone_radius:
		velocity = velocity.lerp(Vector2.ZERO, deceleration * delta)
	else:
		var direction = (target_position - global_position).normalized()  # Direction to mouse
		var target_velocity = direction * max_speed  # Desired velocity
		velocity = velocity.lerp(target_velocity, acceleration * delta)  # Smooth movement
	

	if global_position.distance_to(target_position) < 10:  # If close, slow down
		velocity = velocity.lerp(Vector2.ZERO, deceleration * delta)
	
	move_and_slide()  # Apply movement
	





func _on_timer_timeout() -> void:
	pass # Replace with function body.
	increase_score(1) # Increase score by 1

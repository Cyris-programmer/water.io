extends Area2D
@onready var player: Node2D = $player



# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	

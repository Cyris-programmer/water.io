extends Area2D
@onready var player: Node2D = $player

func _ready() -> void:
	pass

func _on_body_entered(_body):
	queue_free()
	

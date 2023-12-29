extends Area2D
class_name Portal

func _process(delta: float) -> void:
	position.y = position.y + (sin(Globals.time * 100 * delta) * 0.08)

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("win!")

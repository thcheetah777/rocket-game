extends Area2D
class_name Portal

@onready var sprite := $Sprite
@onready var particles := $Particles

func _ready() -> void:
	sprite.self_modulate = Globals.current_level.palette.portal_color
	particles.self_modulate = Globals.current_level.palette.portal_color

func _process(delta: float) -> void:
	position.y = position.y + (sin(Globals.time * 100 * delta) * 0.08)

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("win!")

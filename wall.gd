extends StaticBody2D
class_name Wall

@onready var sprite := $Sprite

func _ready() -> void:
	sprite.self_modulate = Globals.current_level.palette.wall_color

extends Area2D
class_name Spike

@onready var sprite := $Sprite

func _ready() -> void:
	sprite.self_modulate = Globals.current_level.palette.spikes_color

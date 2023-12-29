extends StaticBody2D
class_name LandingPad

@onready var sprite := $Sprite

func _ready() -> void:
	sprite.self_modulate = Globals.current_level.palette.landing_pad_color

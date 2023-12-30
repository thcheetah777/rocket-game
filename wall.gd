extends StaticBody2D
class_name Wall

@export var rotation_speed = 0
@export var path: PathFollow2D
@export var path_speed = 100

@onready var sprite := $Sprite

func _ready() -> void:
	sprite.self_modulate = Globals.current_level.palette.wall_color

func _process(delta: float) -> void:
	global_rotation_degrees += rotation_speed * delta

	if path:
		path.progress += path_speed * delta
		global_position = path.global_position

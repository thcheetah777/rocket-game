@tool
@icon("res://2d-shadow.svg")
extends Sprite2D
class_name DropShadow

@export var shadow_offset = Vector2(-8, 0)

var parent_sprite: Sprite2D

func _ready():
	if get_parent() is Sprite2D:
		parent_sprite = get_parent() as Sprite2D
		texture = parent_sprite.texture

func _process(_delta: float) -> void:
	global_position = parent_sprite.global_position + shadow_offset
	global_rotation = parent_sprite.global_rotation
